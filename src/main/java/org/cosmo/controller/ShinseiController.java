package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shinsei")
public class ShinseiController {
	
	@GetMapping("/ichijihozon")
	public String view() {
		
		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/torikesu")
	public String view2() {
		
		return "shinsei/dummy_11_shinseiDetail_03";
	}
}
