package org.cosmo.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiFileVO;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		String fileName = shinseiService.getFileName(shinseiNo);
		
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
		model.addAttribute("fileName", fileName);
		
		return "shinsei/dummy_11_shinseiDetail_03";
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


	@GetMapping("/shinseiDetail")
	public String viewShinseiDetail(@RequestParam("no") Long shinseiNo, HttpSession session, Model model) {

		Long kigyoCd = (Long) session.getAttribute("kigyoCd");

		if (kigyoCd == null) {
			kigyoCd = 1L;
			session.setAttribute("kigyoCd", kigyoCd);
		}

		ShinseiDetailVO detail = shinseiService.getShinseiDetail(kigyoCd, shinseiNo);

		model.addAttribute("detail", detail);

		return "shinsei/11_shinseiDetail";
	}

	@PostMapping("/hikimodosu")
	public String hikimodosu(@RequestParam("shinseiNo") Long shinseiNo, HttpSession session, HttpServletRequest request,
			RedirectAttributes rttr) {

		Long kigyoCd = (Long) session.getAttribute("kigyoCd");
		String loginUserId = (String) session.getAttribute("loginUserId");
		String userIp = request.getRemoteAddr();

		shinseiService.hikimodosu(kigyoCd, shinseiNo, loginUserId, userIp);

		rttr.addFlashAttribute("message", "申請を引戻しました。");
		return "redirect:/shinsei/shinseiDetail?no=" + shinseiNo;
	}

	
	@PostMapping("/updateTorikesu")
	public String update(
			@RequestParam("tkComment") String tkComment,
			@RequestParam("shinseiNo") String shinseiNo,
			@RequestParam("beforeKbn") String beforeKbn,
			@RequestParam("hozonUid") String hozonUid,
			HttpSession session, Model model) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		String shainUid = shain.getShain_Uid();
		
		String nowKbn = shinseiService.getShinchokuKbn(shinseiNo);
		
		 if ("1".equals(nowKbn) && (shinseiNo == null || shinseiNo.isEmpty())) {

		        shinseiService.deleteIchijiHozonByHozonUid(hozonUid);  // hozonUid 기준 삭제

		        model.addAttribute("errorMessage", "保存データのみ削除しました。");
		        return "shinsei/dummy_11_shinseiDetail_03";
		    }
		
		  if (!beforeKbn.equals(nowKbn)) {
		        model.addAttribute("errorMessage", "他のユーザーにより更新されています。再度画面を開いてください。");
		        return "shinsei/dummy_11_shinseiDetail_03"; 
		    }
		
		shinseiService.updateTorikesu(shinseiNo, tkComment,shainUid);
		
		return "home"; //나중에 링크 수정할게요

	}

}
