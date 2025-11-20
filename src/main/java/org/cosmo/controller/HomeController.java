package org.cosmo.controller;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.HomeShainVO;
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
		
		HomeShainVO vo = new HomeShainVO();
		
		vo.setKigyo_Cd("100");				// 기업코드
		vo.setKigyo_Nm("ABCDEFG");
		vo.setShain_Uid("30000001");			// 사원 Uid
		vo.setShain_No("000001");			// 사원 No
		vo.setShain_Nm("山田 一郎");
		vo.setJigyosho_cd("11000001");
		vo.setJigyosho_Nm("丸の内ｵﾌｨｽ");
		vo.setShozoku_Cd("000C00740");
		vo.setShozoku_Nm("東京書類センター");
		
		session.setAttribute("shain", vo);
		
		model.addAttribute("list", homeService.getList(vo.getKigyo_Cd(), vo.getShain_Uid()));
		
		return "home";
	}
	
	@RequestMapping(value = "/exam", method = RequestMethod.GET)
	public String exam() {
		
		return "exam"; 
	}
}
