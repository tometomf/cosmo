package org.cosmo.controller;

import java.util.List;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.ShozokuService;
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
    public String tokureiShinsei(@RequestParam(name = "type", required = false) String type,
                                 Model model) {

        // 기본값: A타입 (상한 초과)
        if (type == null) {
            type = "A";
        }

        model.addAttribute("tokureiType", type);

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

        // ③ 여기서 나중에 Service 불러서 DB 저장하게 됨
        //    예: tokureiService.save(form);

        // ④ 지금은 일단 "완료 페이지"로 보내기만 한다
        rttr.addFlashAttribute("message", "特例申請を受け付けました。");
        return "redirect:/idoconfirm/kanryoPage";
    }
  
    
}