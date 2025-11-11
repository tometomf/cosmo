package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/huzuiNewInput")
public class HuzuiNewInputController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		return "/huzuiNewInput/24_huzuiNewInput";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String update() {
		
		return "/huzuiNewInput/25_huzuiUpdate";
	}
	
	
	@RequestMapping(value = "/finalForm", method = RequestMethod.GET)
	public String kanryo() {
		
		return "/huzuiNewInput/26_huzuiKanryo";
	}
	
	
	
}
