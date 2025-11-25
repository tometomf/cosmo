package org.cosmo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.FuzuiRequestWrapperDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.service.HuzuiNewInputService;
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

//김민수
@Controller
@RequestMapping(value="/huzuiNewInput")
public class HuzuiNewInputController {
	
	  @Autowired
	  private HuzuiNewInputService huzuiNewInputService;  

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model,HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			ShainFuzuiShoruiVO data = huzuiNewInputService.getList(kigyo_Cd, shain_Uid);
			
			model.addAttribute("shainHuzuiShorui", data);
		}
		return "/huzuiNewInput/24_huzuiNewInput";
	}
	
	//김민수
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
			
			huzuiNewInputService.fileUpload(kigyo_Cd, shain_Uid, fileNo, uniqueId);
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
			
	//김민수
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String update(ShainFuzuiShoruiVO vo, Model model, HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			ShainFuzuiShoruiVO data = huzuiNewInputService.getList(kigyo_Cd, shain_Uid);
			
			model.addAttribute("shainHuzuiShorui", data);
			System.out.println(data);
		}
		
		
		model.addAttribute("shainHuzui", vo);
		
		System.out.print(vo);
		
		
		return "/huzuiNewInput/25_huzuiUpdate";
	}
	
	//김민수
	@PostMapping(value= "/shinseiFuzuiShorui")
    public ResponseEntity<?> handleSubmit(@RequestBody FuzuiRequestWrapperDTO wrapper,HttpSession session) {
        try {
        	ShinseiFuzuiShoruiDTO shinseiFuzuiShorui = wrapper.getShinseiFuzuiShoruiDTO();
        	ShinseiDTO shinseiDTO = wrapper.getShinseiDTO();
        	OshiraseDTO oshiraseDTO = wrapper.getOshiraseDTO();
        	ProcessLogDTO processLogDTO = wrapper.getProcessLogDTO();
        	
        	ShainVO shain = (ShainVO) session.getAttribute("shain");
    		System.out.println(shain);
            LocalDate today = LocalDate.now();

            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");

            LocalDate today1 = LocalDate.now();
       	 LocalTime now1 = LocalTime.now();


       	 // 시간 포맷을 "HHmm"으로 설정
       	 DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
       	 String time1 = now1.format(timeFormatter);

       	 // 날짜와 시간을 결합하여 "yyyy-MM-dd HH:mm:ss" 형식의 문자열을 만듭니다.
       	 String dateTimeString = today1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " " + time1;

            
            String toDay = today.format(format);
            String date = today.format(format);
            
            String shinsei = shain.getKigyo_Cd().substring(0, 3) + date;
            long shinseiNo = Long.parseLong(shinsei);
            
            shinseiFuzuiShorui.setShinseiYmd(toDay);
            shinseiFuzuiShorui.setShinseiNo(shinseiNo);
            
 	        
 	        
 	        shinseiDTO.setShinseiNo(shinseiNo);
 	        shinseiDTO.setShinseiYmd(toDay); 	        
 	        shinseiDTO.setFirstShinseiYmd(toDay);
 	        
 	        System.out.println("신청 vo : "+shinseiDTO);
 	        
 	       
 	        oshiraseDTO.setShinseiNo(321);
 	        oshiraseDTO.setOshiraseNaiyo("申請");
 	        oshiraseDTO.setTsuchiYmd(toDay);
 	        
 	        LocalTime now = LocalTime.now();
 	        String time = now.format(DateTimeFormatter.ofPattern("HHmm"));
 	        
 	        oshiraseDTO.setTsuchiHm(time);
 	        
 	        
 	       Timestamp timestamp = Timestamp.valueOf(dateTimeString);
 	       processLogDTO.setProcessTimestamp(timestamp);
 	       
 	       processLogDTO.setSubsystemId("111");
 	       processLogDTO.setProcessCol("shinseiFuzuiShorui");
 	      oshiraseDTO.setAddDate(timestamp);
          oshiraseDTO.setUpdDate(timestamp);
 	       
 	      
 	      
 	      
 	      
 	     huzuiNewInputService.saveAll(shinseiDTO, shain, shinseiFuzuiShorui, oshiraseDTO,processLogDTO);
            return ResponseEntity.ok().body("데이터가 성공적으로 처리되었습니다.");
        } catch (Exception e) {
        	e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("처리 중 오류가 발생했습니다.");
        }
    }
	
	//김민수
	@RequestMapping(value = "/finalForm", method = RequestMethod.GET)
	public String kanryo() {
		
		return "/huzuiNewInput/26_huzuiKanryo";
	}
	
	//김민수
	@RequestMapping(value="/hozon", method= RequestMethod.POST)
	public ResponseEntity<?> hozonSubmit(HttpSession session){
		try {
			ShainVO shain = (ShainVO) session.getAttribute("shain");
			OshiraseDTO oshiraseDTO = new OshiraseDTO();
        	ProcessLogDTO processLogDTO = new ProcessLogDTO();
        	IchijiHozonDTO ichijiHozonDTO = new IchijiHozonDTO();

        	 LocalDate today1 = LocalDate.now();
        	 LocalTime now = LocalTime.now();

        	 // 날짜 포맷을 "yyyyMMdd"로 설정
        	 DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        	 String toDay = today1.format(dateFormatter);

        	 // 시간 포맷을 "HHmm"으로 설정
        	 DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        	 String time = now.format(timeFormatter);

        	 // 날짜와 시간을 결합하여 "yyyy-MM-dd HH:mm:ss" 형식의 문자열을 만듭니다.
        	 String dateTimeString = today1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " " + time;

        	 // Timestamp 객체로 변환
        	 Timestamp timestamp = Timestamp.valueOf(dateTimeString);

        	 
             //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
             DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");

             String formattoDay = today1.format(format);
             
             LocalTime nowTime = LocalTime.now();
             
             String HHtime = nowTime.format(DateTimeFormatter.ofPattern("HHmm"));
		
             processLogDTO.setProcessTimestamp(timestamp);
             processLogDTO.setSubsystemId("123");
             processLogDTO.setProcessCol("hozon");
             
             oshiraseDTO.setTsuchiYmd(toDay);
             oshiraseDTO.setTsuchiHm(HHtime);
             oshiraseDTO.setOshiraseNaiyo("一時保存しました");
             oshiraseDTO.setAddDate(timestamp);
             oshiraseDTO.setUpdDate(timestamp);
         
             ichijiHozonDTO.setActionNm("hozon");
             
             
             //ichijiHozonDTO.setData(data);
             
             huzuiNewInputService.saveHozon(shain, oshiraseDTO, processLogDTO, ichijiHozonDTO);
			  return ResponseEntity.ok().body("데이터가 성공적으로 처리되었습니다.");
		}
		catch (Exception e) {
        	e.printStackTrace();
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("처리 중 오류가 발생했습니다.");
	}
	
}
}
