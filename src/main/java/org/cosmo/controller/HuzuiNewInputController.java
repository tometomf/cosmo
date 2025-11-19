package org.cosmo.controller;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainFuzuiShoruiHuzuiNewInputVO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/huzuiNewInput")
public class HuzuiNewInputController {
	
	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model,HttpSession session) {
		
		Integer kigyo_Cd = (Integer) session.getAttribute("kigyo_Cd");
		Integer shain_Uid = (Integer) session.getAttribute("shain_Uid");
		if(kigyo_Cd != null && shain_Uid != null) {
		model.addAttribute("shainHuzuiShorui", huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid));
		};
		return "/huzuiNewInput/24_huzuiNewInput";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String update(ShainFuzuiShoruiHuzuiNewInputVO vo, Model model) {
		
	
		ShainFuzuiShoruiHuzuiNewInputVO data = new ShainFuzuiShoruiHuzuiNewInputVO();
		// 값 설정
		data.setMenkyo_Yuko_Kigen("2026/10/11"); 
		data.setMenkyo_No("1234-5678-AB");
		data.setShashu("승용차");
		data.setToroku_No("서울 12가 3456");
		data.setHaikiryo(2000);
		data.setShaken_Yuko_Kigen("2026/11/1");
		data.setHoken_Manryo_Ymd("2026/10/30"); 
		data.setTaijin_Baisho("무제한");
		data.setTaibutsu_Baisho("2억");
		data.setJinshin_Shogai("1억");
		data.setTojosha_Shogai("5천만");
		data.setTokyu(1);
		data.setEtc_File_Uid_1(101);
		data.setEtc_File_Uid_2(102);
		data.setEtc_File_Uid_3(103);
		data.setEtc_File_Uid_4(104);
		data.setEtc_File_Uid_5(105);
		data.setEtc_Comment_1("첨부파일 1 관련 코멘트");
		data.setEtc_Comment_2("첨부파일 2 관련 코멘트");
		data.setEtc_Comment_3("첨부파일 3 관련 코멘트");
		data.setEtc_Comment_4("첨부파일 4 관련 코멘트");
		data.setEtc_Comment_5("첨부파일 5 관련 코멘트");
		
		model.addAttribute("shainHuzui", data);
		
		model.addAttribute("shainHuzuiShorui", vo);
		
		System.out.print(vo);
		
		
		return "/huzuiNewInput/25_huzuiUpdate";
	}
	
	
	@RequestMapping(value = "/finalForm", method = RequestMethod.GET)
	public String kanryo() {
		
		return "/huzuiNewInput/26_huzuiKanryo";
	}
	
	
	
}
