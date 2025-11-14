package org.cosmo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.service.ShinseiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/shinsei")
public class ShinseiController {

	@Autowired
	private ShinseiService shinseiService;

	@GetMapping("/ichijihozon")
	public String view(@RequestParam("no") Long shinseiNo, Model model) {
		ShinseiKeiroVO vo = shinseiService.getShinseiKeiro(shinseiNo);
		model.addAttribute("keiro", vo);
		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/torikesu")
	public String view2() {

		return "shinsei/dummy_11_shinseiDetail_03";
	}

	@GetMapping("/kakunin")
	public String viewShinseiDetail03() {
		return "shinsei/11_shinseiDetail_03";
	}

	@GetMapping("/test")
	public String showShinseiJyohou(@RequestParam("no") Long shinseiNo, Model model) {
		ShinseiJyohouVO vo = shinseiService.getShinseiJyohou(shinseiNo);
		model.addAttribute("jyohou", vo);
		return "shinsei/jyohouDetail";
	}

	@GetMapping("/shinseiDetail")
	public String viewShinseiDetail(@RequestParam("no") Long shinseiNo, HttpSession session, Model model) {

		Long kigyoCd = (Long) session.getAttribute("kigyoCd");

		if (kigyoCd == null) {
			kigyoCd = 1L;
			session.setAttribute("kigyoCd", kigyoCd);
		}

		ShinseiDetailVO detail = shinseiService.getShinseiDetail(kigyoCd, shinseiNo);

		model.addAttribute("detail", detail);

		return "shinsei/11_shinseiDetail";
	}

	@PostMapping("/hikimodosu")
	public String hikimodosu(@RequestParam("shinseiNo") Long shinseiNo, HttpSession session, HttpServletRequest request,
			RedirectAttributes rttr) {

		// 세션에서 기업코드 / 로그인 사용자ID 는
		// 너희 프로젝트에서 실제로 쓰는 속성명으로 맞춰줘.
		Long kigyoCd = (Long) session.getAttribute("kigyoCd");
		String loginUserId = (String) session.getAttribute("loginUserId");
		String userIp = request.getRemoteAddr();

		shinseiService.hikimodosu(kigyoCd, shinseiNo, loginUserId, userIp);

		rttr.addFlashAttribute("message", "申請を引戻しました。");
		return "redirect:/shinsei/shinseiDetail?no=" + shinseiNo;
	}

}
