package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariAddress")
public class HiwariAddressController {

	@GetMapping("")
	public String showHiwariAddressPage() {
		return "hiwariKinmuchi/hiwariAddress";
	}
}