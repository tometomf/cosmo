package org.cosmo.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Locale locale, Model model) {
		
		ShainVO shain = new ShainVO("10", "(株)○○○○○○○○", "123456", "net001", "田中　太郎");
		
		session.setAttribute("shain", shain);
		
		return "home";
	}
	
}
