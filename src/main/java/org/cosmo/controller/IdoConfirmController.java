package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/idoconfirm")
public class IdoConfirmController {
	
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
	public String addressinput() {
		
		return "idoconfirm/04_addressinput";
	}

} 