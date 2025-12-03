package org.cosmo.controller;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/haishinList")
public class HaishinListController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			
		}
		return "/haishinList/k_09_haishinList";
	}
	
}
