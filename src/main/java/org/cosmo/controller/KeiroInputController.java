package org.cosmo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.KeiroInputService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/keiroinput")
public class KeiroInputController {

	@Autowired
	private KeiroInputService keiroInputservice;

	@GetMapping("/07_keirodtInput")
	public String densha(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput";
	}

	@GetMapping("/07_keirodtInput_02")
	public String bus(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_02";
	}

	@GetMapping("/07_keirodtInput_04")
	public String toho(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_04";
	}

	@GetMapping("/06_keiroInput")
	public String select(HttpSession session, Model model) {
		 Integer keiroSeq = 1;
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");

		System.out.println(shain);
		if (shain.getKigyo_Cd() == null ||  shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		/*
		 * ShainKeiroDTO dto =
		 * keiroInputservice.getShainKeiro(Integer.parseInt(shain.getKigyo_Cd()),
		 * Long.parseLong(shain.getShain_Uid()) , keiroSeq);
		 */
		ShainKeiroDTO dto = keiroInputservice.getShainKeiro(100, 2001L, keiroSeq);
		
		model.addAttribute("keiro", dto);
		
		System.out.println(dto);
		return "keiroinput/06_keiroInput";
	}

	@GetMapping("/07_keirodtInput_03")
	public String jidousha(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_03";
	}

}
