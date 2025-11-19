package org.cosmo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

//import org.cosmo.domain.AddressInputForm;
//import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.ShozokuVO;
//import org.cosmo.service.AddressInputService;
import org.cosmo.service.IdoConfirmService;
import org.cosmo.service.ShozokuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/idoconfirm")
public class IdoConfirmController {

    // 기존 기능 유지
//    private final AddressInputService addressInputService;
    private final ShozokuService shozokuService;

    // 새로운 분기 기능
    private final IdoConfirmService idoConfirmService;

    @Autowired
    public IdoConfirmController(
//            AddressInputService addressInputService,
            ShozokuService shozokuService,
            IdoConfirmService idoConfirmService
    ) {
//        this.addressInputService = addressInputService;
        this.shozokuService = shozokuService;
        this.idoConfirmService = idoConfirmService;
    }

    /**
     * ================================
     *  0200 異動有無確認 (GET)
     * ================================
     */
    @RequestMapping(value = {"", "/idoconfirm"}, method = RequestMethod.GET)
    public String showForm(
            @RequestParam(value = "alertType", required = false) String alertTypeParam,
            HttpSession session,
            Model model) {

        AlertType alertType = null;

        // 1) URL 파라미터 우선 적용
        if (alertTypeParam != null) {
            String tmp = alertTypeParam.toUpperCase();
            if ("IDOU_ITEN".equals(tmp)) {
                alertType = AlertType.IDOU_ITEN;
            } else if ("SONOTA".equals(tmp)) {
                alertType = AlertType.SONOTA;
            } else if ("JISHIN".equals(tmp)) {
                alertType = AlertType.JISHIN;
            } else {
                alertType = AlertType.SONOTA;
            }
            session.setAttribute("alertType", alertType);
        } else {
            // 2) 세션에서 가져오기
            alertType = (AlertType) session.getAttribute("alertType");
            if (alertType == null) {
                alertType = AlertType.SONOTA;
                session.setAttribute("alertType", alertType);
            }
        }

        // 화면 바인딩
        model.addAttribute("currWorkPlaceText", "東京都中野区本町3-30-4KDX中野坂上ビル8F");
        model.addAttribute("currAddressText", "神奈川県川崎市高津区下作延1-2-3 レオパレス溝の口 103");

        // 異動/移転인 경우 勤務地 = 변함 고정
        model.addAttribute("isWorkPlaceFixed", alertType == AlertType.IDOU_ITEN);

        return "idoconfirm/02_idoConfirm";
    }

    /**
     * ================================
     *  「次へ」 (POST)
     * ================================
     */
    @RequestMapping(value = "/next", method = RequestMethod.POST)
    public String goNext(
            @RequestParam("workPlaceChange") boolean workPlaceChange,
            @RequestParam("addressChange") boolean addressChange,
            HttpSession session) {

        AlertType alertType = (AlertType) session.getAttribute("alertType");
        if (alertType == null) alertType = AlertType.SONOTA;

        NextStep nextStep = idoConfirmService.decideNextStep(alertType, workPlaceChange, addressChange);

        // 自ら申請④ 패턴이면 mustChangeRoute 저장
        session.setAttribute("mustChangeRoute", nextStep.isMustChangeRoute());

        NextScreen screen = nextStep.getFirstScreen();

        if (screen == NextScreen.WORK_INPUT) {
            return "redirect:/idoconfirm/kinmuInput";
        }
        if (screen == NextScreen.ADDRESS_INPUT) {
            return "redirect:/idoconfirm/addressinput";
        }
        if (screen == NextScreen.APPLICATION_ERROR) {
            return "redirect:/idoconfirm/applyError";
        }

        // 기본값
        return "redirect:/idoconfirm/keiroInfo";
    }

    /** ================================
     *     ↓↓↓ 기존 프로젝트 기능 유지 ↓↓↓
     * ================================ */

    @RequestMapping("/kinmuInput")
    public String kinmuInput() {
        return "idoconfirm/03_kinmuInput";
    }

    @RequestMapping("/huzuikanri")
    public String huzuikanri() {
        return "idoconfirm/08_huzuiKanri";
    }

    @RequestMapping("/addressinput")
    public String addressinput() {

        return "idoconfirm/04_addressinput";
    }

    @RequestMapping("/keiroInfo")
    public String keiroInfo() {
        return "idoconfirm/05_keiroInfo";
    }

    @RequestMapping("/shozokuSearchPopup")
    public String shozokuSearchPopup(Model model) {

        int kigyoCd = 100;
        List<ShozokuVO> list = shozokuService.findShozokuList(kigyoCd);
        model.addAttribute("list", list);

        return "idoconfirm/shozokuSearchPopup";
    }

    @RequestMapping("/kanryoPage")
    public String kanryoPage() {
        return "idoconfirm/10_kanryoPage";
    }

    @RequestMapping("/tokureiShinsei")
    public String tokureiShinsei() {
        return "idoconfirm/k_52_tokureiShinsei";
    }

    @RequestMapping("/kakuninpage")
    public String kakuninpage() {
        return "idoconfirm/09_kakuninPage";
    }
}
