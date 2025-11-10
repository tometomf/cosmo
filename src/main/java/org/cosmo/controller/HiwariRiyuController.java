package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariRiyu")
public class HiwariRiyuController {

	@GetMapping("")
	public String showKinmuchiPage() {
		return "hiwariKinmuchi/hiwariRiyu";
	}
}