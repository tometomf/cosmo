package org.cosmo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.IdoConfirmService;
import org.cosmo.service.ShozokuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/idoconfirm")
public class IdoConfirmController {

	private final ShozokuService shozokuService;
	private final AddressInputService addressInputService;
	private final IdoConfirmService idoConfirmService;

	 @Autowired
	    public IdoConfirmController(
	            ShozokuService shozokuService,
	            IdoConfirmService idoConfirmService,
	            AddressInputService addressInputService) {

	        this.shozokuService = shozokuService;
	        this.idoConfirmService = idoConfirmService;
	        this.addressInputService = addressInputService;
	    }

	/**
	 * ================================ 0200 異動有無確認 (GET)
	 */
	@RequestMapping(value = { "", "/idoconfirm" }, method = RequestMethod.GET)
	public String showForm(@RequestParam(value = "alertType", required = false) String alertTypeParam,
			HttpSession session, Model model) {

		AlertType alertType = null;

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
			alertType = (AlertType) session.getAttribute("alertType");
			if (alertType == null) {
				alertType = AlertType.SONOTA;
				session.setAttribute("alertType", alertType);
			}
		}

		model.addAttribute("currWorkPlaceText", "東京都中野区本町3-30-4KDX中野坂上ビル8F");
		model.addAttribute("currAddressText", "神奈川県川崎市高津区下作延1-2-3 レオパレス溝の口 103");

		// 異動/移転인 경우 勤務地 = 변함 고정
		model.addAttribute("isWorkPlaceFixed", alertType == AlertType.IDOU_ITEN);

		return "idoconfirm/02_idoConfirm";
	}

	@RequestMapping(value = "/next", method = RequestMethod.POST)
	public String goNext(@RequestParam("workPlaceChange") boolean workPlaceChange,
			@RequestParam("addressChange") boolean addressChange, HttpSession session) {

		AlertType alertType = (AlertType) session.getAttribute("alertType");
		if (alertType == null)
			alertType = AlertType.SONOTA;

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

		return "redirect:/idoconfirm/keiroInfo";
	}

	@RequestMapping("/kinmuInput")
	public String kinmuInput() {
		return "idoconfirm/03_kinmuInput";
	}

	@RequestMapping("/huzuikanri")
	public String huzuikanri() {
		return "idoconfirm/08_huzuiKanri";
	}

	 @RequestMapping(value = "/addressinput", method = RequestMethod.GET)
	    public String addressinput(Model model, HttpSession session) {

	        // 실제로는 세션에서 기업코드/직원UID 꺼내야 함
	        String kigyoCd = "DUMMY";
	        String shainUid = "DUMMY";

	        AddressViewDto view = addressInputService.loadCurrentAddress(kigyoCd, shainUid);

	        AddressInputForm form =
	                (AddressInputForm) model.asMap().get("addressForm");
	        if (form == null) {
	            form = addressInputService.initForm();
	        }

	        model.addAttribute("view", view);
	        model.addAttribute("addressForm", form);

	        return "idoconfirm/04_addressinput";
	    }

	    // 0400 버튼 처리 (POST)
	    @RequestMapping(value = "/addressinput", method = RequestMethod.POST)
	    public String handleAddressInput(
	            @ModelAttribute("addressForm") AddressInputForm form,
	            @RequestParam("action") String action,
	            HttpSession session,
	            RedirectAttributes redirectAttributes) {

	        String kigyoCd = "DUMMY";
	        String shainUid = "DUMMY";

	        if ("back".equals(action)) {
	            // 「戻る」 → 03_勤務先入力
	            return "redirect:/idoconfirm/kinmuInput";
	        } else if ("save".equals(action)) {
	            // 「一時保存」
	            addressInputService.saveTemporary(form, kigyoCd, shainUid);
	            redirectAttributes.addFlashAttribute("message", "一時保存しました。");
	            redirectAttributes.addFlashAttribute("addressForm", form);
	            return "redirect:/idoconfirm/addressinput";
	        } else if ("next".equals(action)) {
	            // 「次へ」 → 신규주소 반영 후 0500(経路入力)으로
	            addressInputService.reflectAddress(form, kigyoCd, shainUid);
	            return "redirect:/idoconfirm/keiroInfo";
	        }

	        // 알 수 없는 action이면 그냥 다시 0400으로
	        redirectAttributes.addFlashAttribute("addressForm", form);
	        return "redirect:/idoconfirm/addressinput";
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
