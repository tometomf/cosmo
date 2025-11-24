package org.cosmo.controller;

import java.util.List;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.IdoConfirmService;
import org.cosmo.service.ShozokuService;
import org.cosmo.service.TokureiService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

    // ===== 의존성 주입 (Service) =====
    private final AddressInputService addressInputService; // 0400 화면용
    private final IdoConfirmService idoConfirmService;     // 0200 화면 판정용
    private final ShozokuService shozokuService;
    private final TokureiService tokureiService;

    // =====================================
    // 0200 화면: 이동/이전 확인 (GET)
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

    // =====================================
    // 0200 화면: [다음] 버튼 클릭 시 (POST)
    // =====================================
    @PostMapping("/next")
    public String next(
            @ModelAttribute("form") IdoCheckForm form,
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            RedirectAttributes rttr) {

        if (alertType == null) {
            alertType = AlertType.SONOTA;
        }

        boolean kinmu = form.isKinmuChanged();
        boolean jusho = form.isJushoChanged();

        // Service 로직 수행
        NextStep step = idoConfirmService.judge(alertType, kinmu, jusho);
        NextScreen nextScreen = step.getFirstScreen();

        // 폼 데이터 유지 (이름 충돌 방지를 위해 idoCheckForm으로 변경)
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
    // 0400 화면: 주소 입력 (GET)
    // =====================================
    @GetMapping("/addressinput")
    public String addressInputGet(Model model) {
        String shainUid = "testUser"; // 실제로는 세션에서 가져와야 함

        // 화면 표시 데이터 로드 (현주소, 반영할 주소)
        AddressViewDto view = addressInputService.loadViewData(shainUid);
        
        // 폼이 RedirectAttributes로 넘어왔는지 확인 (없으면 초기화)
        if (!model.containsAttribute("addressInputForm")) {
            model.addAttribute("addressInputForm", addressInputService.initForm());
        }
        
        model.addAttribute("view", view);

        return "idoconfirm/04_addressinput";
    }

    // =====================================
    // 0400 화면: 주소 입력 액션 처리 (POST)
    // =====================================
    @PostMapping("/addressinput")
    public String addressInputPost(
            @ModelAttribute("addressInputForm") AddressInputForm form,
            BindingResult result,
            Model model,
            RedirectAttributes rttr) {

        String shainUid = "testUser";
        String action = form.getAction(); // 버튼에서 설정한 값 (reflect, search, tempsave, next)

        // 1. [반영] 버튼
        if ("reflect".equals(action)) {
            addressInputService.reflectMiddleAddress(form, shainUid);
            model.addAttribute("view", addressInputService.loadViewData(shainUid));
            return "idoconfirm/04_addressinput";
        }
        
        // 2. [검색] 버튼
        if ("search".equals(action)) {
            addressInputService.searchZipCode(form);
            model.addAttribute("view", addressInputService.loadViewData(shainUid));
            return "idoconfirm/04_addressinput";
        }

        // 3. [일시보존] 버튼
        if ("tempsave".equals(action)) {
            addressInputService.tempSave(form, shainUid);
            rttr.addFlashAttribute("message", "一時保存しました。");
            rttr.addFlashAttribute("addressInputForm", form); // 입력값 유지
            return "redirect:/idoconfirm/addressinput";
        }
        
        // 4. [다음] 버튼
        if ("next".equals(action)) {
            boolean isValid = addressInputService.validateAndCheckRoute(form);
            if (!isValid) {
                model.addAttribute("errorMessage", "必須項目を入力してください。(または経路取得エラー)");
                model.addAttribute("view", addressInputService.loadViewData(shainUid));
                return "idoconfirm/04_addressinput";
            }
            // 성공 시 다음 화면으로
            return "redirect:/idoconfirm/keiroInfo";
        }

        return "redirect:/idoconfirm/addressinput";
    }

    // =====================================
    // 근무지 입력 (기존 유지)
    // =====================================
    @GetMapping("/kinmuInput")
    public String kinmuInput() {
        return "idoconfirm/03_kinmuInput";
    }

    // =====================================
    // 경로 정보 (기존 유지)
    // =====================================
    @GetMapping("/keiroInfo")
    public String keiroInfo() {
        return "idoconfirm/05_keiroInfo";
    }

    // =====================================
    // 기타 화면들 (기존 유지)
    // =====================================
    @GetMapping("/huzuikanri")
    public String huzuikanri() {
        return "idoconfirm/08_huzuiKanri";
    }

    @GetMapping("/kakuninpage")
    public String kakuninpage() {
        return "idoconfirm/09_kakuninPage";
    }

    @GetMapping("/kanryoPage")
    public String kanryoPage() {
        return "idoconfirm/10_kanryoPage";
    }

    // =====================================
    // 팝업 및 특례 신청 (기존 유지)
    // =====================================
    @GetMapping("/shozokuSearchPopup")
    public String shozokuSearchPopup(Model model) {
        int kigyoCd = 100;
        List<ShozokuVO> list = shozokuService.findShozokuList(kigyoCd);
        model.addAttribute("list", list);
        return "idoconfirm/shozokuSearchPopup";
    }

    @GetMapping("/tokureiShinsei")
    public String tokureiShinsei(
            @RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            @RequestParam(name = "type", required = false) String type,
            Model model) {

        if (type == null || type.trim().isEmpty()) type = "A";
        if (shinseiNo == null || shinseiNo.trim().isEmpty()) shinseiNo = "1";

        model.addAttribute("tokureiType", type);
        model.addAttribute("shinseiNo", shinseiNo);

        return "idoconfirm/k_52_tokureiShinsei";
    }

    @PostMapping("/tokureiSubmit")
    public String tokureiSubmit(@ModelAttribute TokureiForm form, RedirectAttributes rttr) {
        if (form.getAgree() == null) {
            rttr.addFlashAttribute("errorMessage", "同意が必要です。");
            return "redirect:/idoconfirm/tokureiShinsei";
        }
        if (form.getTokureiReason() == null || form.getTokureiReason().trim().isEmpty()) {
            rttr.addFlashAttribute("errorMessage", "理由を入力してください。");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        tokureiService.saveTokurei(form);
        rttr.addFlashAttribute("message", "特例申請が完了しました。");
        return "redirect:/idoconfirm/kanryoPage";
    }
}