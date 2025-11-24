package org.cosmo.controller;

import java.util.List;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.KinmuForm;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.AddressService;
import org.cosmo.service.GeoService;
import org.cosmo.service.IdoConfirmService;
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

    // ===== �쓽議댁꽦 二쇱엯 =====
    private final AddressInputService addressInputService;
    private final ShozokuService shozokuService;
    private final TokureiService tokureiService;
    private final GeoService geoService;
    private final AddressService addressService;
    private final IdoConfirmService idoConfirmService;   // �쁾 0200�슜 �꽌鍮꾩뒪

    // =====================================
    // 0200 �빊�땿�쐣�꽒閻븃첀 (GET 吏꾩엯)
    // URL: /idoconfirm/idoconfirm?alertType=IDOU_ITEN | SONOTA | JISHIN
    // =====================================
    @GetMapping("/idoconfirm")
    public String idoconfirm(
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            Model model) {

        if (alertType == null) {
            alertType = AlertType.SONOTA;
        }
        
        // 폼 초기화
        IdoCheckForm form = new IdoCheckForm();
        
        // [설계서] IDOU_ITEN인 경우 "근무지는 변한다"가 선택된 상태로 고정
        if (alertType == AlertType.IDOU_ITEN) {
            form.setKinmuChange("Y");
        }

        model.addAttribute("alertType", alertType);
        model.addAttribute("form", form);

        return "idoconfirm/02_idoConfirm";
    }

    /**
     * [다음] 버튼 클릭 시 (POST)
     */
    @PostMapping("/next")
    public String next(
            @ModelAttribute("form") IdoCheckForm form,
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            RedirectAttributes rttr) {

        if (alertType == null) {
            alertType = AlertType.SONOTA;
        }

        boolean kinmu = form.isKinmuChanged(); // Y면 true
        boolean jusho = form.isJushoChanged(); // Y면 true

        // 서비스 로직에 판단 요청
        NextStep step = idoConfirmService.judge(alertType, kinmu, jusho);
        NextScreen nextScreen = step.getFirstScreen();

        // ★ 수정 포인트: 다음 화면으로 넘길 때 "form"이라는 이름을 쓰지 않습니다.
        // 다음 화면(addressinput 등)에서 "form"은 자기 자신만의 Form 클래스를 쓰기 때문입니다.
        // 대신 "prevForm"이나 "idoCheckForm" 처럼 다른 이름을 씁니다.
        rttr.addFlashAttribute("idoCheckForm", form); 
        rttr.addFlashAttribute("alertType", alertType);

        switch (nextScreen) {
            case WORK_INPUT:
                return "redirect:/idoconfirm/kinmuInput";

            case ADDRESS_INPUT:
                return "redirect:/idoconfirm/addressinput";

            case COMMUTE_INFO:
                rttr.addFlashAttribute("mustChangeRoute", step.isMustChangeRoute());
                return "redirect:/idoconfirm/keiroInfo";

            case APPLICATION_ERROR:
            default:
                String errorMsg = "";
                if (alertType == AlertType.IDOU_ITEN) {
                    errorMsg = "異動・移転の場合は「勤務地：変わる」を選択してください。";
                } else if (alertType == AlertType.JISHIN) {
                    errorMsg = "「自ら申請を行う」場合は「勤務地：変わる」は選択不可です。";
                } else {
                    errorMsg = "選択された組み合わせは無効です。";
                }
                rttr.addFlashAttribute("errorMessage", errorMsg);
                return "redirect:/idoconfirm/idoconfirm?alertType=" + alertType.name();
        }
    }
    // =====================================
    // �몾 �떎�떃�쑑�뀯�뒟�뵽�씊 (湲곗〈 肄붾뱶 洹몃�濡�)
    // =====================================
    @GetMapping("/kinmuInput")
    public String kinmuInput() {
        return "idoconfirm/03_kinmuInput";
    }

    // �몾 �솕硫� 理쒖큹 �몴�떆 (�떎瑜� �� 肄붾뱶 �� 洹몃�濡� �몺)
    @GetMapping("/input")
    public String showKinmuInput(Model model) {

        KinmuForm form = new KinmuForm();

        // �뀒�뒪�듃�슜 湲곕낯媛� (�굹以묒뿉 �븘�슂 �뾾�쑝硫� 吏��썙�룄 �맖)
        form.setAddressChange("1"); // 湲곕낯: 鵝뤸��걣鸚됥굩�굥

        model.addAttribute("kinmuForm", form);
        return "idoconfirm/03_kinmuInput";
    }

    // �몾 �솕硫� �뚧А�겦�� �겢由� �떆 (�떎瑜� �� 肄붾뱶 �� 洹몃�濡� �몺)
    @PostMapping("/kinmuNext")
    public String kinmuNext(@ModelAttribute("kinmuForm") KinmuForm form,
                            Model model) {

        System.out.println("===== KinmuController.next() �떎�뻾�맖 =====");
        System.out.println("�엯�젰�븳 �떊洹쒖＜�냼: " + form.getNewAddress());
        System.out.println("addressChange: " + form.getAddressChange());
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        String address = form.getNewAddress();

        if (address == null || address.trim().isEmpty()) {
            model.addAttribute("error", "�뼭�떎�떃�쑑鵝뤸��굮�뀯�뒟�걮�겍�걦�걽�걬�걚��");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        GeoPoint geo = geoService.getLatLng(address);

        if (geo == null) {
            model.addAttribute("error", "鵝뤸��겗渶�佯�永뚦벧�걣�룚孃쀣겎�걤�겲�걵�굯�겎�걮�걼��");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        form.setLat(geo.getLat());
        form.setLng(geo.getLng());

        System.out.println("=== 醫뚰몴 �꽭�똿 �썑 ===");
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        String addressChange = form.getAddressChange(); // "1" or "0"

        if ("1".equals(addressChange)) {
            // 鵝뤸��걣鸚됥굩�굥 �넂 4踰� 鵝뤸��뀯�뒟 �솕硫댁쑝濡� �씠�룞
            return "redirect:/idoconfirm/addressinput";
        } else {
            // 鵝뤸��걣鸚됥굩�굢�겒�걚 �넂 5踰� 永뚩러�뀯�뒟 �솕硫�, 洹� �쟾�뿉 4踰덉쓽 �뚧А�겦�겥燁삣뎺�눇�릤��
            addressService.runPreNextProcess(form);
            return "redirect:/idoconfirm/keiroInfo";
        }
    }

    // =====================================
    // �몿 鵝뤸��뀯�뒟�뵽�씊 (湲곗〈 肄붾뱶 洹몃�濡�)
    // =====================================
    @GetMapping("/addressinput")
    public String addressinput(Model model) {

        String kigyoCd = "DUMMY"; // 실제 로그인 세션에서 가져와야 함
        String shainUid = "DUMMY";

        AddressViewDto view = addressInputService.loadCurrentAddress(kigyoCd, shainUid);
        
        // ★ 수정 포인트: 무조건 형변환하지 않고 타입을 체크합니다.
        Object obj = model.asMap().get("form");
        AddressInputForm form = null;

        if (obj instanceof AddressInputForm) {
            // 진짜 주소입력폼이 들어있다면 그걸 씁니다.
            form = (AddressInputForm) obj;
        } else {
            // 없거나, 엉뚱한 객체(IdoCheckForm 등)가 들어있다면 새로 만듭니다.
            form = addressInputService.initForm();
        }

        model.addAttribute("view", view);
        model.addAttribute("form", form);

        return "idoconfirm/04_addressinput";
    }

    // =====================================
    // �뫀 永뚩러�깄�젿�뵽�씊 (湲곗〈 肄붾뱶 洹몃�濡�)
    // =====================================
    @GetMapping("/keiroInfo")
    public String keiroInfo() {
        return "idoconfirm/05_keiroInfo";
    }

    // �뫃 餓섌쉹嶸←릤�뵽�씊
    @GetMapping("/huzuikanri")
    public String huzuikanri() {
        return "idoconfirm/08_huzuiKanri";
    }

    // �뫅 閻븃첀�뵽�씊
    @GetMapping("/kakuninpage")
    public String kakuninpage() {
        return "idoconfirm/09_kakuninPage";
    }

    // �뫆 若뚥틙�뵽�씊
    @GetMapping("/kanryoPage")
    public String kanryoPage() {
        return "idoconfirm/10_kanryoPage";
    }

    // =====================================
    // �냼�냽 寃��깋 �뙘�뾽 (湲곗〈 肄붾뱶 洹몃�濡�)
    // =====================================
    @GetMapping("/shozokuSearchPopup")
    public String shozokuSearchPopup(Model model) {

        int kigyoCd = 100;  // �뜑誘�

        List<ShozokuVO> list = shozokuService.findShozokuList(kigyoCd);
        model.addAttribute("list", list);

        return "idoconfirm/shozokuSearchPopup";
    }

    // =====================================
    // �돶堊뗧뵵獄� (湲곗〈 肄붾뱶 洹몃�濡�)
    // =====================================
    @GetMapping("/tokureiShinsei")
    public String tokureiShinsei(
            @RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            @RequestParam(name = "type", required = false) String type,
            Model model) {

        if (type == null || type.trim().isEmpty()) {
            type = "A";
        }

        if (shinseiNo == null || shinseiNo.trim().isEmpty()) {
            shinseiNo = "1";
        }

        model.addAttribute("tokureiType", type);
        model.addAttribute("shinseiNo", shinseiNo);

        return "idoconfirm/k_52_tokureiShinsei";
    }

    @PostMapping("/tokureiSubmit")
    public String tokureiSubmit(@ModelAttribute TokureiForm form,
                                RedirectAttributes rttr) {

        System.out.println("===== TokureiForm =====");
        System.out.println("�떊泥�踰덊샇   : " + form.getShinseiNo());
        System.out.println("�듅濡����엯   : " + form.getTokureiType());
        System.out.println("�룞�쓽 �뿬遺�  : " + form.getAgree());
        System.out.println("�듅濡� �궗�쑀  : " + form.getTokureiReason());
        System.out.println("======================");

        if (form.getAgree() == null) {
            rttr.addFlashAttribute("errorMessage",
                    "�돶堊뗣겓�겇�걚�겍�냵若밤굮�릤鰲ｃ걮�걼訝듽겎�뵵獄뗣겓�긽�궒�긿�궚�걮�겍�걦�걽�걬�걚��");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        if (form.getTokureiReason() == null || form.getTokureiReason().trim().isEmpty()) {
            rttr.addFlashAttribute("errorMessage", "�돶堊뗧뵵獄뗧릤�뵳�굮�뀯�뒟�걮�겍�걦�걽�걬�걚��");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        tokureiService.saveTokurei(form);

        rttr.addFlashAttribute("message", "�돶堊뗧뵵獄뗣굮�룛�걨餓섅걨�겲�걮�걼��");
        return "redirect:/idoconfirm/kanryoPage";
    }
}
