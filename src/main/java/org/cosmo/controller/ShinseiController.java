package org.cosmo.controller;

import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.service.ShinseiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/shinseiDetail")
	public String viewShinseiDetail() {

		return "shinsei/11_shinseiDetail";
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

}
