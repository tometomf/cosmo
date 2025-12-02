package org.cosmo.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//김민수
@Service
public class HuzuiNewInputServiceImpl implements HuzuiNewInputService {

	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@Override
	public ShainFuzuiShoruiVO getList(String kigyo_Cd, String shain_Uid) {

		
		
		return huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
	}


	@Override
	public void saveAll(ShinseiDTO shinsei, ShainVO shain, ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,
			OshiraseDTO oshirase,ProcessLogDTO processLog) {
		// TODO Auto-generated method stub
		huzuiNewInputMapper.addFuzuiShorui(shinseiFuzuiShorui, shain);
		huzuiNewInputMapper.addShinsei(shinsei, shain);
		huzuiNewInputMapper.updateAlert(shinsei, shain);
		huzuiNewInputMapper.addShinseiLog(shinsei, shain);
		huzuiNewInputMapper.addFuzuiShoruiLog(shinseiFuzuiShorui, shain);
        huzuiNewInputMapper.addOshirase(oshirase, shain);
        huzuiNewInputMapper.addProcessLog(processLog, shain);
	}

	@Override
	public void saveHozon(ShainVO shain, OshiraseDTO oshirase, ProcessLogDTO processLog, IchijiHozonDTO ichiji) {
		huzuiNewInputMapper.addHozonOshirase(oshirase, shain);
		huzuiNewInputMapper.addHozonProcessLog(processLog, shain);
		huzuiNewInputMapper.addIchijiHozon(ichiji, shain);
		
	}
	

	@Override
	public void addFile(UploadFileDTO UploadFile, String fNo, ShainVO shain,ShinseiDTO shinsei, Long findShinseiNo) {
		// TODO Auto-generated method stub
		huzuiNewInputMapper.addFile(UploadFile, shain);
		huzuiNewInputMapper.fileUpdate(UploadFile, fNo, shain);

		    if (fNo.startsWith("ETC_FILE_UID_")) {
		        // ETC_FILE_UID_로 시작하면 shinseiFileUpdate 실행
		        huzuiNewInputMapper.shinseiFileUpdate(UploadFile, fNo, shain, findShinseiNo);
		        
		        String numberPart = fNo.substring("ETC_FILE_UID_".length());
		        
		        // ETC_COMMENT_숫자 형태로 변경
		        fNo = "ETC_COMMENT_" + numberPart;
		        huzuiNewInputMapper.commentUpdate(shinsei, fNo, shain);
		        
		        return;   // 종료
		    }
	}


	@Override
	public UploadFileDTO saveTempFile(MultipartFile file,String fileNo, String fNo,HttpSession session) throws IOException {
		
		String uploadPath = "C:/cosmo/upload/files"; // 안전한 절대 경로 (슬래시 사용)
		
		 File uploadDirectory = new File(uploadPath);
         if (!uploadDirectory.exists()) {
             boolean result = uploadDirectory.mkdirs(); 
             if (!result) {
                 System.err.println("업로드 디렉토리 생성 실패: " + uploadPath);
                 throw new RuntimeException("업로드 디렉토리 생성 실패: " + uploadPath);
             }
         }
         LocalDate today1 = LocalDate.now();
    	 LocalTime now = LocalTime.now();


         DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
         String time = now.format(timeFormatter);

         String dateTimeString = today1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " " + time;

         Timestamp timestamp = Timestamp.valueOf(dateTimeString);
        	 
         UploadFileDTO UploadFile = new UploadFileDTO();
         Random rand = new Random();
         StringBuilder sb = new StringBuilder();

         sb.append(rand.nextInt(9) + 1);

         for (int i = 0; i < 17; i++) {
             sb.append(rand.nextInt(10));
         }

         Long positiveLong = Long.parseLong(sb.toString());
         Long fileUid = positiveLong;
         
         UploadFile.setTitle(fileNo);
         UploadFile.setName(file.getOriginalFilename());
         UploadFile.setContentType(file.getContentType());
         UploadFile.setFileUid(fileUid);
         UploadFile.setAddDate(timestamp);
         UploadFile.setUpdDate(timestamp);
         
         String savedFileName = positiveLong + "-" + file.getOriginalFilename();
         
         
         
         File destination = new File(uploadPath + File.separator + savedFileName);
         fNo.toUpperCase();
         file.transferTo(destination);
         
         
 	
         
         Map<String, Path> uploadedFiles = (Map<String, Path>) session.getAttribute("uploadedFiles");
         if (uploadedFiles == null) uploadedFiles = new HashMap<>();
         
         
         uploadedFiles.put(fNo, destination.toPath());
         

         

         session.setAttribute("uploadedFiles", uploadedFiles);
         
         return UploadFile;
	}


	@Override
	public Long findShinseiNo(ShainVO shain) {
		// TODO Auto-generated method stub
		return huzuiNewInputMapper.findShinseiNo(shain);
	}


	@Override
	public UploadFileDTO getFile(Long fileUid) {
		// TODO Auto-generated method stub
		return huzuiNewInputMapper.getFile(fileUid);
	}


	
	
	

	


	
	

	
	
	
}
