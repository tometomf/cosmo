package org.cosmo.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.FuzuiRequestWrapperDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;
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
	@RequestMapping(value="/upload", method=RequestMethod.POST,produces="application/json")
	public ResponseEntity<?> fileUpload(@RequestParam("file") MultipartFile file, String fileNo,@RequestParam("fileName") String fNo, HttpSession session) {
		
	    if(!file.isEmpty()) {
	        try {
	            ShainVO shain = (ShainVO) session.getAttribute("shain");
	            if(shain != null) {
	               
	            	UploadFileDTO dto = huzuiNewInputService.saveTempFile(file,fileNo,fNo,session);

	                List<UploadFileDTO> tempFiles =
	                        (List<UploadFileDTO>) session.getAttribute("tempFiles");
	                if (tempFiles == null) tempFiles = new ArrayList<>();
	                tempFiles.add(dto);
	                session.setAttribute("tempFiles", tempFiles);
	                
	               
	                
	                return ResponseEntity.ok(Collections.singletonMap("uid", dto.getFileUid()));
	            } else {
	                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("사원 정보가 없습니다.");
	            }
	        }catch(IOException e) {
	            e.printStackTrace();
	            return ResponseEntity.badRequest().body("파일을 선택해주세요");
	        }
	    } else {
	        return ResponseEntity.badRequest().body("파일을 선택해주세요");
	    }
	}
		
	//김민수
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String update(@RequestParam("uploadedFiles") List<MultipartFile> fileList,ShainFuzuiShoruiVO vo, Model model, HttpSession session) {
		
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if(shain != null) {
			
			String kigyo_Cd = shain.getKigyo_Cd();
			String shain_Uid = shain.getShain_Uid();
			
			ShainFuzuiShoruiVO data = huzuiNewInputService.getList(kigyo_Cd, shain_Uid);
			
			model.addAttribute("shainHuzuiShorui", data);
			
		}
		
		
		model.addAttribute("shainHuzui", vo);
		System.out.print(vo);
		
		
		return "/huzuiNewInput/25_huzuiUpdate";
	}
	
	
	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public void downloadFile(@RequestParam("fileUid") Long fileUid, HttpServletResponse response) {

	    // 1. Service를 통해 DB에서 파일 정보 (BLOB 데이터, 원본 파일명, MIME 타입) 조회
	    // 예: FileVO fileData = fileDownloadService.getFileData(fileId);
	    
	    // 가정된 데이터
	    String originalFilename = "첨부_서류_원본.pdf";
	    //byte[] fileBytes = /* DB에서 읽어온 BLOB 데이터 */; 
	    
	    try {
	        // 2. HTTP 헤더 설정 (가장 중요)
	        
	        // 파일명 인코딩 (한글 깨짐 방지)
	        String encodedFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");

	        // 다운로드 유도 헤더 설정
	        response.setContentType("application/octet-stream"); // 또는 fileData.getMimeType()
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        
	        // 파일 크기 설정 (선택 사항이지만 권장)
	        //response.setContentLength(fileBytes.length); 

	        // 3. 데이터 전송
	        OutputStream out = response.getOutputStream();
	       // out.write(fileBytes);
	        out.flush();
	        out.close();

	    } catch (Exception e) {
	        // 에러 처리 (예: 파일이 DB에 없는 경우, IOException 등)
	        e.printStackTrace(); 
	    }
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
 	        
 	       
 	        oshiraseDTO.setShinseiNo(shinseiNo);
 	        oshiraseDTO.setOshiraseNaiyo("申請");
 	        oshiraseDTO.setTsuchiYmd(toDay);
 	        
 	        session.setAttribute("shinseiNo", shinseiNo);
 	        
 	        LocalTime now = LocalTime.now();
 	        String time = now.format(DateTimeFormatter.ofPattern("HHmm"));
 	        
 	        oshiraseDTO.setTsuchiHm(time);
 	        
 	        
 	       Timestamp timestamp = Timestamp.valueOf(dateTimeString);
 	       processLogDTO.setProcessTimestamp(timestamp);
 	       
 	       processLogDTO.setSubsystemId("111");
 	       processLogDTO.setProcessCol("shinseiFuzuiShorui");
 	      oshiraseDTO.setAddDate(timestamp);
          oshiraseDTO.setUpdDate(timestamp);
 	       
          Map<String, Path> uploadedFiles = (Map<String, Path>) session.getAttribute("uploadedFiles");
          
          
          
          List<UploadFileDTO> tempFiles =
                  (List<UploadFileDTO>) session.getAttribute("tempFiles");
          if(uploadedFiles != null && tempFiles != null) {
        	  Map.Entry<String, Path>[] entries =
          	        uploadedFiles.entrySet().toArray(new Map.Entry[0]);
          for(int i=0; i < tempFiles.size(); i++) {
        	  UploadFileDTO fileDTO = tempFiles.get(i);
        	  Map.Entry<String, Path> entry = entries[i];
        	  
        	  String fNo = entry.getKey();
        	  Path value = entry.getValue();

        	  byte[] data = Files.readAllBytes(value);
        	  fileDTO.setData(data);
        	  
        	  huzuiNewInputService.addFile(fileDTO, fNo, shain);
          }
          }
 	     huzuiNewInputService.saveAll(shinseiDTO, shain, shinseiFuzuiShorui, oshiraseDTO,processLogDTO);
            return ResponseEntity.ok().body("데이터가 성공적으로 처리되었습니다.");
        } catch (Exception e) {
        	e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("처리 중 오류가 발생했습니다.");
        }
    }
	
	//김민수
	@RequestMapping(value = "/finalForm", method = RequestMethod.GET)
	public String kanryo(HttpSession session, Model model) {
		 String shinseiNo = (String) session.getAttribute("lastShinseiNo");
		    model.addAttribute("shinseiNo", shinseiNo);
		
		return "/huzuiNewInput/26_huzuiKanryo";
	}
	
	//김민수
	@RequestMapping(value="/hozon", method= RequestMethod.POST)
	public ResponseEntity<?> hozonSubmit(@RequestBody ShainFuzuiShoruiVO vo, HttpSession session){
		try {
			ShainVO shain = (ShainVO) session.getAttribute("shain");
			OshiraseDTO oshiraseDTO = new OshiraseDTO();
        	ProcessLogDTO processLogDTO = new ProcessLogDTO();
        	IchijiHozonDTO ichijiHozonDTO = new IchijiHozonDTO();
        	
        	byte[] blobData = serialize(vo);
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
             
             LocalTime nowTime = LocalTime.now();
             
             String HHtime = nowTime.format(DateTimeFormatter.ofPattern("HHmm"));
		
             int shainUid = Integer.parseInt(shain.getShain_Uid());
             
             processLogDTO.setProcessTimestamp(timestamp);
             processLogDTO.setSubsystemId("123");
             processLogDTO.setProcessCol("hozon");
             
             oshiraseDTO.setTsuchiYmd(toDay);
             oshiraseDTO.setTsuchiHm(HHtime);
             oshiraseDTO.setOshiraseNaiyo("一時保存しました");
             oshiraseDTO.setAddDate(timestamp);
             oshiraseDTO.setUpdDate(timestamp);
             oshiraseDTO.setAddUserId(shainUid);
             oshiraseDTO.setUpdUserId(shainUid);
             
             ichijiHozonDTO.setActionNm("hozon");
             ichijiHozonDTO.setAddDate(timestamp);
             ichijiHozonDTO.setUpdDate(timestamp);
             ichijiHozonDTO.setAddUserId(shainUid);
             ichijiHozonDTO.setUpdUserId(shainUid);
             ichijiHozonDTO.setData(blobData);
             //ichijiHozonDTO.setData(data);
             
             huzuiNewInputService.saveHozon(shain, oshiraseDTO, processLogDTO, ichijiHozonDTO);
			  return ResponseEntity.ok().body("데이터가 성공적으로 처리되었습니다.");
		}
		catch (Exception e) {
        	e.printStackTrace();
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("처리 중 오류가 발생했습니다.");
	}
	
}

	private byte[] serialize(Object obj) {
	    try (ByteArrayOutputStream bos = new ByteArrayOutputStream();
	         ObjectOutputStream oos = new ObjectOutputStream(bos)) {
	        
	        oos.writeObject(obj); 
	        return bos.toByteArray(); 
	    } catch (IOException e) {
	        throw new RuntimeException("객체 직렬화 오류", e);
	    }
	}
}
