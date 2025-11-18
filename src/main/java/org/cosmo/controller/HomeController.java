package org.cosmo.controller;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	private HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		
		ShainVO vo = new ShainVO();
		
		vo.setKigyo_Cd("100");				// 기업코드
		vo.setKigyo_Nm("(株)○○○○○○○○");
		vo.setShain_Uid("123456");			// 사원 Uid
		vo.setShain_No("net001");			// 사원 No
		vo.setShain_Nm("田中　太郎");
		
		session.setAttribute("shain", vo);
		
		model.addAttribute("list", homeService.getList(vo.getKigyo_Cd(), vo.getShain_Uid()));
		
		return "home";
	}
	
}
