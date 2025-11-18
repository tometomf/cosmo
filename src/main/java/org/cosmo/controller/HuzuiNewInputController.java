package org.cosmo.controller;

import org.cosmo.domain.Shain_Fuzui_Shorui_HuzuiNewInputVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/huzuiNewInput")
public class HuzuiNewInputController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		Shain_Fuzui_Shorui_HuzuiNewInputVO vo = new Shain_Fuzui_Shorui_HuzuiNewInputVO();
		// 값 설정
		vo.setMenkyo_Yuko_Kigen("2026/10/11"); 
		vo.setMenkyo_No("1234-5678-AB");
		vo.setShashu("승용차");
		vo.setToroku_No("서울 12가 3456");
		vo.setHaikiryo(2000);
		vo.setShaken_Yuko_Kigen("2026/11/1");
		vo.setHoken_Manryo_Ymd("2026/10/30");
		vo.setTaijin_Baisho("무제한");
		vo.setTaibutsu_Baisho("2억");
		vo.setJinshin_Shogai("1억");
		vo.setTojosha_Shogai("5천만");
		vo.setTokyu(1);
		vo.setEtc_File_Uid_1(101);
		vo.setEtc_File_Uid_2(102);
		vo.setEtc_File_Uid_3(103);
		vo.setEtc_File_Uid_4(104);
		vo.setEtc_File_Uid_5(105);
		vo.setEtc_Comment_1("첨부파일 1 관련 코멘트");
		vo.setEtc_Comment_2("첨부파일 2 관련 코멘트");
		vo.setEtc_Comment_3("첨부파일 3 관련 코멘트");
		vo.setEtc_Comment_4("첨부파일 4 관련 코멘트");
		vo.setEtc_Comment_5("첨부파일 5 관련 코멘트");
		
		model.addAttribute("shainHuzuiShorui", vo);
		
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
