package org.cosmo.controller;

import java.util.List;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.KinmuForm;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.AddressService;
import org.cosmo.service.GeoService;
import org.cosmo.service.ShozokuService;
import org.cosmo.service.TokureiService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/idoconfirm")
@RequiredArgsConstructor
public class IdoConfirmController {

    private final AddressInputService addressInputService;
    private final ShozokuService shozokuService;
    private final TokureiService tokureiService;
    private final GeoService geoService;
    private final AddressService addressService;


    @GetMapping("/kinmuInput")
    public String kinmuInput() {
        return "idoconfirm/03_kinmuInput";
    }

    @GetMapping("/huzuikanri")
    public String huzuikanri() {
        return "idoconfirm/08_huzuiKanri";
    }

    @GetMapping("/kanryoPage")
    public String kanryoPage() {
        return "idoconfirm/10_kanryoPage";
    }

    @GetMapping("/tokureiShinsei")
    public String tokureiShinsei(
    		@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            @RequestParam(name = "type", required = false) String type,
            Model model) {

    	// type 기본값 세팅 (A / B 중 A를 기본)
        if (type == null || type.trim().isEmpty()) {
            type = "A";
        }
        
        // shinseiNo 안 넘어오면 기본값 1 사용
        if (shinseiNo == null || shinseiNo.trim().isEmpty()) {
            shinseiNo = "1";
        }

        model.addAttribute("tokureiType", type);
        model.addAttribute("shinseiNo", shinseiNo);

        return "idoconfirm/k_52_tokureiShinsei";
    }

    @GetMapping("/keiroInfo")
    public String keiroInfo() {
        return "idoconfirm/05_keiroInfo";
    }

    @GetMapping("/addressinput")
    public String addressinput(Model model) {

        String kigyoCd = "DUMMY";
        String shainUid = "DUMMY";

        AddressViewDto view = addressInputService.loadCurrentAddress(kigyoCd, shainUid);
        AddressInputForm form = (AddressInputForm) model.asMap().get("form");

        if (form == null) {
            form = addressInputService.initForm();
        }

        model.addAttribute("view", view);
        model.addAttribute("form", form);

        return "idoconfirm/04_addressinput";
    }

    @GetMapping("/kakuninpage")
    public String kakuninpage() {
        return "idoconfirm/09_kakuninPage";
    }

    @GetMapping("/idoconfirm")
    public String idoconfirm(Model model) {
        model.addAttribute("form", new IdoCheckForm());
        return "idoconfirm/02_idoConfirm";
    }

    @PostMapping("/next")
    public String next(@ModelAttribute("form") IdoCheckForm form,
                       RedirectAttributes redirectAttributes) {

        boolean kinmu = form.isKinmuChange(); // 勤務地
        boolean jusho = form.isJushoChange(); // 住所

        // ① 둘 다 "変わらない(N)"
        if (!kinmu && !jusho) {
            redirectAttributes.addFlashAttribute("errorMessage", "勤務先または住所の変更を選択してください。");
            return "idoconfirm/05_keiroInfo";
        }

        // ② 둘 다 "変わる(Y)"
        if (kinmu && jusho) {
            return "idoconfirm/03_kinmuInput";
        }

        // ③ 근무지만 변함(Y,N)
        if (kinmu && !jusho) {
            return "idoconfirm/03_kinmuInput";
        }

        // ④ 주소만 변함(N,Y)
        return "idoconfirm/04_addressinput";
    }
    
    @GetMapping("/shozokuSearchPopup")
    public String shozokuSearchPopup(Model model) {

        // 현재 더미데이터는 KIGYO_CD = 100 고정
        int kigyoCd = 100;

        List<ShozokuVO> list = shozokuService.findShozokuList(kigyoCd);

        model.addAttribute("list", list);

        return "idoconfirm/shozokuSearchPopup";  
    }
    
    @PostMapping("/tokureiSubmit")
    public String tokureiSubmit(@ModelAttribute TokureiForm form,
                         RedirectAttributes rttr) {

        // ① 폼에서 값 잘 들어왔는지 콘솔로 일단 확인
        System.out.println("===== TokureiForm =====");
        System.out.println("신청번호   : " + form.getShinseiNo());
        System.out.println("특례타입   : " + form.getTokureiType());
        System.out.println("동의 여부  : " + form.getAgree());
        System.out.println("특례 사유  : " + form.getTokureiReason());
        System.out.println("======================");

        // ② (간단 서버쪽 유효성 검사 - 1차 버전)
        //    화면에서 JS로 막긴 하지만, 혹시 모를 경우 대비
        if (form.getAgree() == null) {
            rttr.addFlashAttribute("errorMessage", "特例について内容を理解した上で申請にチェックしてください。");
            // 다시 특례 화면으로 (임시)
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        if (form.getTokureiReason() == null || form.getTokureiReason().trim().isEmpty()) {
            rttr.addFlashAttribute("errorMessage", "特例申請理由を入力してください。");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        // ③ 여기서 DB 저장 (Service 호출)
        tokureiService.saveTokurei(form);

        // ④ 지금은 일단 "완료 페이지"로 보내기만 한다
        rttr.addFlashAttribute("message", "特例申請を受け付けました。");
        return "redirect:/idoconfirm/kanryoPage";
    }
    
 // 3번 화면 최초 표시
    @GetMapping("/input")
    public String showKinmuInput(Model model) {

        KinmuForm form = new KinmuForm();

        // 테스트용 기본값 (나중에 필요 없으면 지워도 됨)
        form.setAddressChange("1"); // 기본: 住所が変わる

        model.addAttribute("kinmuForm", form);
        return "idoconfirm/03_kinmuInput";  // JSP 파일 이름
    }

    // 3번 화면에서 "次へ" 클릭 시
    @PostMapping("/kinmuNext")
    public String next(@ModelAttribute("kinmuForm") KinmuForm form,
                       Model model) {
    	
    	// 🔥 콘솔 로그 확인용
        System.out.println("===== KinmuController.next() 실행됨 =====");
        System.out.println("입력한 신규주소: " + form.getNewAddress());
        System.out.println("addressChange: " + form.getAddressChange());
       	System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // ─────────────────────────────
        // 1) 새 근무지 주소 꺼내기
        // ─────────────────────────────
        String address = form.getNewAddress();

        // (간단 검증) 주소가 비어있으면 에러
        if (address == null || address.trim().isEmpty()) {
            model.addAttribute("error", "新勤務地住所を入力してください。");
            // form을 다시 모델에 넣어서 기존 입력값 유지
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // ─────────────────────────────
        // 2) GeoService로 위도/경도 조회
        // ─────────────────────────────
        GeoPoint geo = geoService.getLatLng(address);

        // 조회 실패 → 에러 메시지 + 3번 화면 유지
        if (geo == null) {
            model.addAttribute("error", "住所の緯度経度が取得できませんでした。");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // 조회 성공 → 폼에 좌표 저장 (나중에 DB 저장용)
        form.setLat(geo.getLat());
        form.setLng(geo.getLng());
        
        System.out.println("=== 좌표 세팅 후 ===");
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // ─────────────────────────────
        // 3) 주소 변경 여부에 따라 분기
        // ─────────────────────────────
        String addressChange = form.getAddressChange(); // "1" or "0"

        if ("1".equals(addressChange)) {
            // 住所が変わる → 4번 住所入力 화면으로 이동
            return "redirect:/idoconfirm/addressinput";

        } else {
            // 住所が変わらない → 5번 経路入力 화면으로 바로 가는데,
            // 그 전에 住所入力PG の「次へ遷移前の処理」を 호출
            addressService.runPreNextProcess(form);

            return "redirect:/idoconfirm/keiroInfo";
        }

    }
    
    
  
    
}