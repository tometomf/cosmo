package org.cosmo.controller;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.service.AddressInputService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/idoconfirm")
@RequiredArgsConstructor
public class IdoConfirmController {
	private final AddressInputService addressInputService;

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
	public String tokureiShinsei() {

		return "idoconfirm/k_52_tokureiShinsei";
	}

	@GetMapping("/keiroInfo")
	public String keiroInfo() {

		return "idoconfirm/05_keiroInfo";
	}

	@GetMapping("/addressinput")
	public String addressinput(Model model) {

		// ★ 실제로는 세션에서 회사코드/직원UID 꺼내야 함
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
	public String next(@ModelAttribute("form") IdoCheckForm form, RedirectAttributes redirectAttributes) {

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
}
