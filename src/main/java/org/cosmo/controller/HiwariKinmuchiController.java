package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariKinmuchi")
public class HiwariKinmuchiController {

	@GetMapping("")
	public String showKinmuchiPage() {
		return "hiwariKinmuchi/hiwariKinmuchi";
	}
}