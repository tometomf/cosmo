package org.cosmo.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/huzuiNewInput")
public class HuzuiNewInputController {
	
	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model,HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			ShainFuzuiShoruiVO data = huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
			
			model.addAttribute("shainHuzuiShorui", data);
		}
		return "/huzuiNewInput/24_huzuiNewInput";
	}
	
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String fileUpload(@RequestParam("file") MultipartFile file,int fileNo, HttpSession session) {
		if(!file.isEmpty()) {
		try {
			ShainVO shain = (ShainVO) session.getAttribute("shain");
			if(shain != null) {
				
				String kigyo_Cd = shain.getKigyo_Cd();
				String shain_Uid = shain.getShain_Uid();
				
			
			Long uniqueId = System.currentTimeMillis();
			
			File destination = new File("/upload/path/" + uniqueId + "-" + file.getOriginalFilename());
			file.transferTo(destination);
			
			huzuiNewInputMapper.fileUpload(kigyo_Cd, shain_Uid, fileNo, uniqueId);
			return "uid:" + uniqueId;
			} else {
				return "사원 정보가 없습니다.";
			}
			
		}catch(IOException e) {
			e.printStackTrace();
			return "파일 업로드 실패";
		}
		}else {
			return "파일을 선택해주세요";
		}
	}
			
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String update(ShainFuzuiShoruiVO vo, Model model, HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			ShainFuzuiShoruiVO data = huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
			
			model.addAttribute("shainHuzuiShorui", data);
			System.out.println(data);
		}
		
		
		model.addAttribute("shainHuzui", vo);
		
		System.out.print(vo);
		
		
		return "/huzuiNewInput/25_huzuiUpdate";
	}
	
	@PostMapping(value= "/shinseiFuzuiShorui")
    public ResponseEntity<?> handleSubmit(@RequestBody ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,HttpSession session) {
        try {
        	//첫번째 로직
        	ShainVO shain = (ShainVO) session.getAttribute("shain");
    		
            LocalDate today = LocalDate.now();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");

            String toDay = today.format(formatter);
            String date = today.format(format);
            
            String shinsei = shain.getKigyo_Cd().substring(0, 3) + date;
            long shinseiNo = Long.parseLong(shinsei);
            
            shinseiFuzuiShorui.setShinseiYmd(toDay);
            shinseiFuzuiShorui.setShinseiNo(shinseiNo);
            
            
 	        huzuiNewInputMapper.addFuzuiShorui(shinseiFuzuiShorui, shain);
            return ResponseEntity.ok().body("데이터가 성공적으로 처리되었습니다.");
        } catch (Exception e) {
        	e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("처리 중 오류가 발생했습니다.");
        }
    }
	
	
	@RequestMapping(value = "/finalForm", method = RequestMethod.GET)
	public String kanryo() {
		
		return "/huzuiNewInput/26_huzuiKanryo";
	}
	
	
	
}
