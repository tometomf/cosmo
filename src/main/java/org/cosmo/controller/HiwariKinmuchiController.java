package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.HiwariKakuninService;
import org.cosmo.service.HiwariKeiroService;
import org.cosmo.service.HiwariKinmuchiService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.OshiraseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/hiwariKinmuchi")
public class HiwariKinmuchiController {
	
	@Autowired
	private IchijiHozonService ichijiHozonService;
	
	@Autowired
	private OshiraseService oshiraseService;

    @Autowired
    private HiwariKeiroService hiwariKeiroService;

    @Autowired
    private HiwariKinmuchiService service;
    
    @Autowired
    private HiwariKakuninService hiwariKakuninService;

    @Autowired
    private AddressInputService addressService;
  
    
    
    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage(HttpSession session, Model model) {

        // 🔥 (1) 로그인 체크 – shain 세션 없으면 홈으로
        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        // 🔥 (2) 세션에서 값 꺼내기
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Long shainUid   = (Long) session.getAttribute("SHAIN_UID");
        Long shinseiNo  = (Long) session.getAttribute("SHINSEI_NO");

        // 🔥 (3) null 방지 기본값 넣기 (지금은 로그인X 상태라 필수)
        if (kigyoCd == null) kigyoCd = 1001;   // 기본 기업 코드
        if (shainUid == null) shainUid = 1L;   // 기본 사원 UID
        // shinseiNo는 신청 전이면 null이 정상. 건드리지 않음.

        // 🔥 (4) 신청 전/후 데이터 가져오기
        HiwariKinmuchiVO data;
        if (shinseiNo == null) {
            data = service.getBeforeShinsei(kigyoCd, shainUid);
        } else {
            data = service.getAfterShinsei(kigyoCd, shainUid, shinseiNo);
        }

        // 🔥 (5) 소속 리스트(선택박스)
        List<String> shoList = service.getShozokuNames(kigyoCd);

        // 🔥 (6) JSP로 전달
        model.addAttribute("initData", data);
        model.addAttribute("shoList", shoList);

        return "hiwariKinmuchi/hiwariKinmuchi";
    }


    
    @GetMapping("/address")
    public String showHiwariAddressPage(HttpSession session, Model model) {
    	
    	ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }
        
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Long shainUid   = (Long) session.getAttribute("SHAIN_UID");
        Long shinseiNo  = (Long) session.getAttribute("SHINSEI_NO");
        
        if (kigyoCd == null) kigyoCd = 1001;
        if (shainUid == null) shainUid = 1L;
        
        HiwariAddressVO data;
        
        if (shinseiNo == null) {
            data = service.getAddressPageDataBefore(kigyoCd, shainUid);
        } else {
            data = service.getAddressPageData(kigyoCd, shainUid, shinseiNo);
        }
        
        model.addAttribute("initData", data);
        model.addAttribute("addressData", data);
        
        return "hiwariKinmuchi/hiwariAddress";
    }
    
    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }

    
    @GetMapping("/kakunin")
    public String showKakuninPage(HttpSession session, Model model) {
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Long shinseiNo  = (Long) session.getAttribute("SHINSEI_NO");
        
        // 테스트용 임시 데이터
        if (kigyoCd == null) kigyoCd = 1;
        if (shinseiNo == null) shinseiNo = 1L;
        
        // 1) 헤더 정보
        HiwariKakuninVO header = hiwariKakuninService.getHeader(kigyoCd, shinseiNo);
        // 2) 경로 리스트
        List<HiwariKakuninRouteVO> routes = hiwariKakuninService.getRoutes(kigyoCd, shinseiNo);
        if (routes == null) {
            routes = new ArrayList<HiwariKakuninRouteVO>();
        }
        
        // ==== emp 세팅 ====
        Map<String, Object> emp = new HashMap<String, Object>();
        if (header != null) {
            emp.put("no",        header.getEmpNo());
            emp.put("name",      header.getEmpName());
            emp.put("workplace", header.getEmpWorkplace());
            emp.put("address",   header.getEmpAddress());
        }
        model.addAttribute("emp", emp);
        
        // ==== route1 세팅 ====
        HiwariKakuninRouteVO r1 = routes.size() > 0 ? routes.get(0) : null;
        Map<String, Object> route1 = new HashMap<String, Object>();
        if (r1 != null) {
            route1.put("transport",     r1.getTsukinShudanNm());
            route1.put("route",         r1.getKeiroSection());
            route1.put("workDays",      r1.getShukkinNissuu() + "日間");
            route1.put("oneWayFee",     formatAmount(r1.getKataMichiRyokin()));
            route1.put("amount",        formatAmount(r1.getKingaku()));
            route1.put("amountMonthly", formatAmount(r1.getKingakuMonthly()));
        }
        model.addAttribute("route1", route1);
        
        // ==== route2 세팅 ====
        HiwariKakuninRouteVO r2 = routes.size() > 1 ? routes.get(1) : null;
        Map<String, Object> route2 = new HashMap<String, Object>();
        if (r2 != null) {
            route2.put("transport",     r2.getTsukinShudanNm());
            route2.put("route",         r2.getKeiroSection());
            route2.put("workDays",      r2.getShukkinNissuu() + "日間");
            route2.put("oneWayFee",     formatAmount(r2.getKataMichiRyokin()));
            route2.put("amount",        formatAmount(r2.getKingaku()));
            route2.put("amountMonthly", formatAmount(r2.getKingakuMonthly()));
        }
        model.addAttribute("route2", route2);
        
        // ==== apply 세팅 ====
        Map<String, Object> apply = new HashMap<String, Object>();
        if (header != null) {
            apply.put("kind",        header.getShinseiKbnNm());
            apply.put("reason",      header.getShinseiRiyu());
            apply.put("periodText",  header.getTaishoKikanFrom() + " ～ " + header.getTaishoKikanTo());
            apply.put("workDays",    header.getShukkinNissuu() + "日間");
            apply.put("totalAmount", formatAmount(header.getKingakuGokei()));
        }
        model.addAttribute("apply", apply);
        
        return "hiwariKinmuchi/hiwariKakunin";
    }

    private String formatAmount(Integer amount) {
        if (amount == null || amount == 0) {
            return "―";
        }
        return String.format("%,d円", amount);
    }
    
  
    // =========================
    // 完了画面
    // =========================
    @GetMapping("/kanryo")
    public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
        model.addAttribute("shinseiNo", shinseiNo);
        return "hiwariKinmuchi/hiwariKanryo";
    }

    // =========================
    // ③ 経路入力画面 (GET)
    // =========================
    @GetMapping("/keiro")
    public String showKeiroPage(HttpSession session, Model model) {

        // kigyoCd 추가
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        // 테스트용 기본값
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        // kigyoCd 파라미터 추가
        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(kigyoCd, shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

        return "hiwariKinmuchi/hiwariKeiro";
    }

    // =========================
    // ③ 経路入力画面 (POST)
    // =========================
    @PostMapping("/keiro")
    public String handleKeiro(
            @RequestParam("action") String action,
            HttpSession session,
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        // kigyoCd 추가
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        // 테스트용 기본값
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        // kigyoCd 파라미터 추가
        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(kigyoCd, shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);
        System.out.println("keiroList size = " + keiroList.size());

        if ("apply".equals(action)) {
            // 경로 없으면 에러
            if (keiroList.isEmpty()) {
                model.addAttribute("errorMsg", "経路が1件も登録されていません。");
                model.addAttribute("keiroList", keiroList);
                model.addAttribute("repRouteNo", repRouteNo);
                return "hiwariKinmuchi/hiwariKeiro";
            }
            
          
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        if ("temp".equals(action)) {
            // kigyoCd 파라미터 추가
            hiwariKeiroService.saveTemp(kigyoCd, shainUid, keiroList);
            return "redirect:/shinsei/11_shinseiDetail_02";
        }
        
        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
        return "hiwariKinmuchi/hiwariKeiro";
    }

    // =========================
    // 経路削除
    // =========================
    @GetMapping("/keiro/delete")
    public String deleteKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq,
            HttpSession session) {

        // kigyoCd 추가
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        // 테스트용 기본값
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        // kigyoCd 파라미터 추가
        hiwariKeiroService.deleteOne(kigyoCd, shainUid, keiroSeq);
        return "redirect:/hiwariKinmuchi/keiro";
    }

    @GetMapping("/keiro/edit")
    public String editKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq) {
        return "redirect:/tsukinInput?mode=edit&keiroSeq=" + keiroSeq;
    }

    private int calcRepRouteNo(List<HiwariKeiroVO> keiroList) {
        if (keiroList == null || keiroList.isEmpty()) {
            return 1;
        }
        return keiroList.size();
    }
    
    @GetMapping("/keiroInput")
    public String showKeiroInputPage() {
        return "keiroinput/06_keiroInput";
    }

    @GetMapping("/map")
    public String showMapPage(HttpSession session, Model model) {
        
        // 세션에서 가져오기 (테스트용 기본값 포함)
        String kigyoCd = "100";
        String shainUid = "30000001";
        
        // 1. 주소 정보 가져오기
        AddressViewDto address = addressService.loadCurrentAddress(kigyoCd, shainUid);
        
        // 2. 근무지 정보 가져오기
        HiwariKinmuchiVO kinmuchi = service.getBeforeShinsei(100, 30000001L);
        
        // 3. 주소 조합
        String fullAddress = "";
        if (address != null) {
            if (address.getCurZip() != null) fullAddress += address.getCurZip() + " ";
            if (address.getCurPref() != null) fullAddress += address.getCurPref();
            if (address.getCurCity() != null) fullAddress += address.getCurCity();
            if (address.getCurStreet() != null) fullAddress += address.getCurStreet();
            if (address.getCurBuilding() != null) fullAddress += " " + address.getCurBuilding();
        }
        
        // 4. 근무지 정보 조합
        String kinmuchiName = "";
        String kinmuchiAddress = "";
        if (kinmuchi != null) {
            kinmuchiName = kinmuchi.getGenKinmusakiNm() != null ? kinmuchi.getGenKinmusakiNm() : "";
            
            if (kinmuchi.getGenKinmuAddress1() != null) kinmuchiAddress += kinmuchi.getGenKinmuAddress1();
            if (kinmuchi.getGenKinmuAddress2() != null) kinmuchiAddress += " " + kinmuchi.getGenKinmuAddress2();
            if (kinmuchi.getGenKinmuAddress3() != null) kinmuchiAddress += " " + kinmuchi.getGenKinmuAddress3();
        }
        
        // 5. Model에 담기
        model.addAttribute("address", fullAddress.trim());
        model.addAttribute("kinmuchi", kinmuchiName);
        model.addAttribute("kinmuchiAddress", kinmuchiAddress.trim());
        
        return "hiwariKinmuchi/hiwariMap";
    }
    /**
     * 3. 「申請」ボタン押下時
     * - 申請情報を更新
     * - 成功したら完了画面へ遷移
     */
    @GetMapping("/submit")
    public String submitApplication(HttpSession session, RedirectAttributes ra) {
        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Long shinseiNo = (Long) session.getAttribute("SHINSEI_NO");
        
        // テスト用 임시 데이터
        if (kigyoCd == null) kigyoCd = 1;
        if (shinseiNo == null) shinseiNo = 1L;
        
        try {
            // 申請処理
            hiwariKakuninService.submitApplication(kigyoCd, shinseiNo);
            
            // 成功メッセージ
            ra.addFlashAttribute("message", "申請が完了しました");
            
            // 完了画面へ
            return "redirect:/hiwariKinmuchi/hiwariKanryo";
            
        } catch (Exception e) {
            // エラーメッセージ
            ra.addFlashAttribute("error", "申請に失敗しました: " + e.getMessage());
            
            // 確認画面に戻る
            return "redirect:/hiwariKinmuchi/kakunin";
        }
    }
    

    
    @PostMapping("/tempSave")
    public String tempSaveKinmu(
            @RequestParam("commuteJson") String commuteJson,
            @RequestParam("actionUrl") String actionUrl,
            @RequestParam(value = "redirectUrl", required = false) String redirectUrl,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/"; 
        }

        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
        String  shozokuCd = shain.getShozoku_Cd();
        String  shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null || shinseiKbn.isEmpty()) {
            shinseiKbn = "01";
        }

        byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

        IchijiHozonDTO dto = new IchijiHozonDTO();
        dto.setUserUid(userUid);
        dto.setShinseiKbn(shinseiKbn);
        dto.setShozokuCd(shozokuCd);
        dto.setActionNm(actionUrl);
        dto.setData(dataBytes);
        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);

        oshiraseService.saveTempOshirase(shain);

        if (redirectUrl == null || redirectUrl.isEmpty()) {
            return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
        }

        return "redirect:" + redirectUrl;
    }
}