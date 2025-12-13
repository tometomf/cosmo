package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sikyu")
public class SikyuController {

	@GetMapping("/kensaku")
	public String kensaku() {
		return "sikyu/k_19_1_choseisearch";
	}

	@GetMapping("/toroku")
	public String toroku() {
		return "sikyu/k_19_.2_choseiEntry";
	}

	@GetMapping("/data")
	public String data() {
		return "sikyu/k_19_2_choseiEntry";
	}

	@GetMapping("/lock")
	public String lock() {
		return "sikyu/k_23_shikyuLock";
	}
}
