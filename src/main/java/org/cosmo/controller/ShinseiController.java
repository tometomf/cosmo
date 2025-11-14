package org.cosmo.controller;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.service.ShinseiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/shinsei")
public class ShinseiController {

	@Autowired
	private ShinseiService shinseiService;

	@GetMapping("/ichijihozon")
	public String view(@RequestParam("no") String shinseiNo, @RequestParam("hozonUid") String hozonUid, Model model) {
		ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNo);
		ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNo);
		ShinseiIcHozonVO hozonVo = shinseiService.getShinseiIcHozon(hozonUid);
		
		model.addAttribute("keiro", keiroVo);
		model.addAttribute("jyohou", jyohouVo);
		model.addAttribute("hozon", hozonVo);
		
		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/torikesu")
	public String view2(@RequestParam("no") String shinseiNo, Model model) {
		ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNo);
		ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNo);
		ShinseiShoruiVO shoruiVo = shinseiService.getShinseiShorui(shinseiNo);
		
		if (jyohouVo != null && jyohouVo.getShinchokuKbn() != null) {
	        String codeNm = shinseiService.getCodeNm(jyohouVo.getShinchokuKbn());
	        jyohouVo.setCodeNm(codeNm);
	    }
		
		if (jyohouVo != null && jyohouVo.getShinseiKbn() != null) {
	        String shinseiName = shinseiService.getShinseiName(jyohouVo.getShinseiKbn());
	        jyohouVo.setShinseiName(shinseiName);
	    }
		
		if (keiroVo != null && keiroVo.getTsukinShudan() != null) {
	        String shudanName = shinseiService.getShudanName(keiroVo.getTsukinShudan());
	        keiroVo.setShudanName(shudanName);
	    }

		model.addAttribute("keiro", keiroVo);
		model.addAttribute("jyohou", jyohouVo);
		model.addAttribute("shorui", shoruiVo);
		
		return "shinsei/dummy_11_shinseiDetail_03";
	}

	@GetMapping("/shinseiDetail")
	public String viewShinseiDetail() {

		return "shinsei/11_shinseiDetail";
	}

	@GetMapping("/kakunin")
	public String viewShinseiDetail03() {
		return "shinsei/11_shinseiDetail_03";
	}

	@GetMapping("/test")
	public String showShinseiJyohou(@RequestParam("no") String shinseiNo, Model model) {
		ShinseiJyohouVO vo = shinseiService.getShinseiJyohou(shinseiNo);
		model.addAttribute("jyohou", vo);
		return "shinsei/jyohouDetail";
	}
	
	@PostMapping("/updateTorikesu")
	public String update(
			@RequestParam("tkComment") String tkComment,
			@RequestParam("shinseiNo") String shinseiNo,
			HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		String shainUid = shain.getShain_Uid();
		
		shinseiService.updateTorikesu(shinseiNo, tkComment,shainUid);
		
		return "/shinsei/jyohouDetail"; //나중에 링크 수정
	}

}
