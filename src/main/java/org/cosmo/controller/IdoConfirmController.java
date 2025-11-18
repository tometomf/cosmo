package org.cosmo.controller;

import java.io.File;
import java.util.UUID;

import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.service.FuzuiShoruiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/idoconfirm")
public class IdoConfirmController {
	
	@Autowired
	private FuzuiShoruiService fuzuiShoruiService;
	
	@GetMapping("/kinmuInput")
	public String kinmuInput() {
		
		return "idoconfirm/03_kinmuInput";
	}
	
	@GetMapping("/huzuikanri")
	public String huzuikanri(@ModelAttribute SearchCriteriaDTO criteria, Model model) {
		
		// 1. 조회 조건 검증 (필수 키 값 확인)
		if (criteria.getKigyoCd() == 0 || criteria.getShinseiNo() == 0) {
			// 필수 값이 없으면 오류 처리 또는 리다이렉트
			return "redirect:/error"; 
		}
		
		try {
			// 2. 서비스 호출: 화면에 필요한 모든 데이터(신청 정보, 경로 목록, 마스터)를 가져옵니다.
			FuzuiShoruiFormDTO formData = fuzuiShoruiService.getInitialData(criteria);

			// 3. JSP에 데이터 전달
			model.addAttribute("formData", formData);

			// 4. 기존 JSP 반환
			return "idoconfirm/08_huzuiKanri";

		} catch (Exception e) {
			System.err.println("부수 서류 조회 중 오류 발생: " + e.getMessage());
			// 로그 기록 (PROCESS_LOG 테이블에 실패 기록)
			// logService.logError(e, "08_huzuiKanri 초기 로딩");
			return "redirect:/error";
		}
	}
	
	@PostMapping("/saveFuzuiData") // JSP 폼의 action을 이 경로로 변경해야 합니다.
	public String saveFuzuiData(@ModelAttribute FuzuiShoruiFormDTO formData) {

		try {
			// 1. 서비스 호출: 데이터 유효성 검사 및 최종 저장/갱신을 트랜잭션으로 처리
			//    (SHINSEI, SHINSEI_FUZUI_SHORUI, PROCESS_LOG, OSHIRASE 테이블 처리)
			fuzuiShoruiService.saveFuzuiShoruiData(
				formData.getShinsei(), 
				formData.getFuzuiShoruiList()
			);

			// 2. 성공 시 다음 단계 (확인 페이지)로 리다이렉트
			return "redirect:/idoconfirm/kakuninpage";

		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("부수 서류 최종 저장 중 오류 발생: " + e.getMessage());
			// 실패 시 오류 페이지로 리다이렉트 (또는 현재 페이지에 에러 메시지 포함)
			return "redirect:/error"; 
		}
	}

	@GetMapping("/kanryoPage")
	public String kanryoPage() {
		
		return "idoconfirm/10_kanryoPage";
	}
	
	@GetMapping("/tokureiShinsei")
	public String tokureiShinsei() {
		
		return "idoconfirm/k_52_tokureiShinsei";
	}
	
	@GetMapping("/keiroInfo")
	public String keiroInfo() {
		
		return "idoconfirm/05_keiroInfo";
	}
	
	@GetMapping("/addressinput")
	public String addressinput() {
		
		return "idoconfirm/04_addressinput";
	}
	
	@GetMapping("/kakuninpage")
	public String kakuninpage() {
		
		return "idoconfirm/09_kakuninPage";
	}
	
	@GetMapping("/idoconfirm")
	public String idoconfirm() {
		
		return "idoconfirm/02_idoConfirm";
	}
	
	// 기존 public String uploadHuzuiFile(...) 메서드는 최종 저장 로직으로 대체하거나,
    // 아래와 같이 AJAX 임시 업로드 로직으로 변경/분리해야 합니다.

    /**
     * [POST] 파일 임시 업로드 및 ICHIJI_HOZON 등록 (AJAX 전용)
     * JSP의 AJAX URL인 /idoconfirm/tempUploadFile에 대응합니다.
     * @param file 클라이언트에서 업로드된 파일 데이터
     * @param fileType 파일 종류 식별자 (예: license1, insurance2 등)
     * @return JSON 응답 (성공 여부 및 임시 ID)
     */
    @PostMapping("/tempUploadFile")
    @ResponseBody // JSON 응답을 위해 필수
    public String tempUploadFile(@RequestParam("uploadFile") MultipartFile file, @RequestParam("fileType") String fileType) {
        
        // 1. 파일 저장 경로 및 이름 생성 (기존 로직 활용)
        String uploadPath = "C:/temp/uploaded_files/";
        String savedFileName = "";
        File destFile = null;
        
        try {
            // 디렉토리 생성 및 파일 이름 중복 방지 로직... (생략)
            String originalFileName = file.getOriginalFilename();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            savedFileName = UUID.randomUUID().toString() + fileExtension;
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            
            destFile = new File(uploadPath + savedFileName);
            file.transferTo(destFile);

            // 2. DB 임시 저장 로직 (ICHIJI_HOZON 사용)
            // 💡 실제로는 파일을 DB의 BLOB/CLOB에 저장하는 대신,
            //    파일 경로와 임시 ID를 ICHIJI_HOZON 테이블에 저장하는 방식이 더 일반적입니다.
            
            // 임시 ID (UUID 또는 DB 시퀀스) 생성
            long tempId = System.currentTimeMillis(); 
            
            IchijiHozonDTO hozonDto = new IchijiHozonDTO();
            // TODO: 사용자 정보, 신청 구분 등 세션에서 필요한 데이터 hozonDto에 설정 필요
            hozonDto.setHozonUid((int) tempId);
            hozonDto.setFileExtension(fileExtension); // 예시: DTO에 필드 추가 필요
            // hozonDto.setData(file.getBytes()); // 실제 파일 바이트를 BLOB에 저장하는 경우
            
            // 3. 서비스 호출: 임시 파일 정보 저장 (ICHIJI_HOZON, PROCESS_LOG, OSHIRASE 처리)
            // fuzuiShoruiService.tempSave(hozonDto);
            
            // 4. 성공 JSON 응답 (JSP의 AJAX success 콜백에 전달)
            return "{\"success\": true, \"tempId\": " + tempId + ", \"savedName\": \"" + originalFileName + "\"}";
            
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("임시 파일 업로드 중 오류 발생: " + e.getMessage());
            // 오류 JSON 응답
            return "{\"success\": false, \"message\": \"업로드 실패\"}";
        }
    }

} 