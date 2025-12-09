package org.cosmo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.AlertVO;
import org.cosmo.domain.FileViewDTO;
import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.IdoConfirmViewDto;
import org.cosmo.domain.KinmuForm;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiLogDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.domain.UploadResult;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.AddressService;
import org.cosmo.service.FuzuiShoruiService;
import org.cosmo.service.GeoService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.IdoConfirmService;
import org.cosmo.service.OshiraseService;
import org.cosmo.service.ShozokuService;
import org.cosmo.service.TokureiService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/idoconfirm")
@RequiredArgsConstructor
public class IdoConfirmController {

    private final AddressInputService addressInputService; // 0400 화면용
    private final IdoConfirmService idoConfirmService;     // 0200 화면 판정용
    
    private final ShozokuService shozokuService;
    private final TokureiService tokureiService;

    private final GeoService geoService;
    private final AddressService addressService;
    
    private final IchijiHozonService ichijiHozonService;
    private final OshiraseService oshiraseService;
    private final FuzuiShoruiService fuzuiShoruiService;

    
 // 02조우진
    
    @GetMapping("/idoconfirm")
    public String idoconfirm(
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            @RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            Model model,
            HttpSession session) {

        // 1. 세션 체크 (로그인 여부 확인)
        ShainVO sessionShain = (ShainVO) session.getAttribute("shain");
        if (sessionShain == null) {
            System.out.println("⚠️ [0200] 세션 없음 -> 메인으로 이동");
            return "redirect:/"; 
        }

        // 2. 세션 정보 추출
        String kigyoCd = sessionShain.getKigyo_Cd();
        String shainUid = sessionShain.getShain_Uid();
        
        System.out.println(">>> [0200 진입] 사용자: " + shainUid + ", 신청번호: " + shinseiNo);

        // 3. DB 데이터 조회 (Service 호출)
        IdoConfirmViewDto viewDto = idoConfirmService.loadDisplayData(kigyoCd, shainUid, shinseiNo);
        
        // 4. 화면 전달
        model.addAttribute("view", viewDto);
        model.addAttribute("shinseiNo", shinseiNo); // Hidden 필드용

        // 5. AlertType 및 Form 초기화
        if (alertType == null) {
            alertType = AlertType.JISHIN;
        }
        IdoCheckForm form = new IdoCheckForm();
        if (alertType == AlertType.IDOU_ITEN) {
            form.setKinmuChange("Y");
        }
        
        model.addAttribute("alertType", alertType);
        model.addAttribute("form", form);

        return "idoconfirm/02_idoConfirm";
    }
    
    @PostMapping("/next")
    public String next(
            @ModelAttribute("form") IdoCheckForm form,
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            RedirectAttributes rttr) {

        if (alertType == null) alertType = AlertType.JISHIN;
        
        boolean kinmu = form.isKinmuChanged();
        boolean jusho = form.isJushoChanged();

        NextStep step = idoConfirmService.judge(alertType, kinmu, jusho);
        NextScreen nextScreen = step.getFirstScreen();

        rttr.addFlashAttribute("idoCheckForm", form);
        rttr.addFlashAttribute("alertType", alertType);

        switch (nextScreen) {
            case WORK_INPUT:
                return "redirect:/idoconfirm/kinmuInput";
            case ADDRESS_INPUT:
                return "redirect:/idoconfirm/addressinput";
            case COMMUTE_INFO:
                rttr.addFlashAttribute("mustChangeRoute", step.isMustChangeRoute());
                return "redirect:/idoconfirm/keiroInfo";
            case APPLICATION_ERROR:
            default:
                String errorMsg = "";
                if (alertType == AlertType.IDOU_ITEN) {
                    errorMsg = "異動・移転の場合は「勤務地：変わる」を選択してください。";
                } else {
                    errorMsg = "選択された組み合わせは無効です。";
                }
                rttr.addFlashAttribute("errorMessage", errorMsg);
                return "redirect:/idoconfirm/idoconfirm?alertType=" + alertType.name();
        }
    }

    
    // 04조우진
 // ==========================================
    // 04. 주소 입력 화면 (Address Input) - 조우진
    // ==========================================

    @GetMapping("/addressinput")
    public String addressInputGet(
            @RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            Model model, HttpSession session) {
        

        // shinseiNo도 같이 서비스로 전달
    	ShainVO sessionShain = (ShainVO) session.getAttribute("shain");
        String shainUid = "";

        if (sessionShain != null) {
            // HomeController에서 설정한 '30000001'을 가져옴
            shainUid = sessionShain.getShain_Uid(); 
            System.out.println("DEBUG: Session에서 가져온 ShainUID: " + shainUid);
        } else {
  
            System.out.println("WARN");
        }
        // -----------------------------------------------------------------

        // shinseiNo도 같이 서비스로 전달
        AddressViewDto view = addressInputService.loadViewData(shainUid, shinseiNo);

        if (!model.containsAttribute("addressInputForm")) {
            model.addAttribute("addressInputForm", addressInputService.initForm());
        }
        model.addAttribute("view", view);

        return "idoconfirm/04_addressinput";
    }
    @PostMapping("/addressinput")
    public String addressInputPost(
            @ModelAttribute("addressInputForm") AddressInputForm form,
            BindingResult result,
            Model model,
            RedirectAttributes rttr,
            HttpSession session) { // 1. 세션 파라미터 추가

        String action = form.getAction();
        
        // -----------------------------------------------------------
        // 2. [수정] 세션에서 shainUid 가져오기 (이 부분이 없어서 에러가 났습니다)
        // -----------------------------------------------------------
        ShainVO sessionShain = (ShainVO) session.getAttribute("shain");
        String shainUid = "";
        
        if (sessionShain != null) {
            shainUid = sessionShain.getShain_Uid(); // 세션값 사용
        } else {
            shainUid = "30000001"; // 세션 없을 때 비상용 (테스트용)
        }
        // -----------------------------------------------------------

        // 3. 일시저장
        if ("tempsave".equals(action)) {
            try {
                // 이제 shainUid 변수가 있으므로 에러가 나지 않습니다.
                addressInputService.tempSave(form, shainUid); 
                rttr.addFlashAttribute("message", "一時保存しました。");
            } catch (Exception e) {
                e.printStackTrace();
                rttr.addFlashAttribute("errorMessage", "保存失敗");
            }
            rttr.addFlashAttribute("addressInputForm", form);
            return "redirect:/idoconfirm/addressinput";
        }

        // 4. 다음 버튼 (GeoService 체크)
        if ("next".equals(action)) {
            boolean isValid = addressInputService.validateAndCheckRoute(form);
            
            if (!isValid) {
                model.addAttribute("errorMessage", "住所エラー (座標取得不可)");
                // 에러 시 화면 복구를 위해 데이터 다시 로드
                model.addAttribute("view", addressInputService.loadViewData(shainUid, null));
                return "idoconfirm/04_addressinput";
            }
            return "redirect:/idoconfirm/keiroInfo";
        }

        return "redirect:/idoconfirm/addressinput";
    }
    // 作成者 : 권예성
    // 근무지 입력
    @GetMapping("/kinmuInput")
    public String kinmuInput() {
        return "idoconfirm/03_kinmuInput";
    }

    // 作成者 : 권예성
    @GetMapping("/input")
    public String showKinmuInput(Model model) {
        KinmuForm form = new KinmuForm();
        form.setAddressChange("1"); // 기본: 住所が変わる
        model.addAttribute("kinmuForm", form);
        return "idoconfirm/03_kinmuInput";
    }

    // 作成者 : 권예성
    // 3번 화면에서 "次へ" 클릭 시
    @PostMapping("/kinmuNext")
    public String kinmuNext(@ModelAttribute("kinmuForm") KinmuForm form,
                            Model model) {

        System.out.println("===== KinmuController.next() 실행됨 =====");
        System.out.println("입력한 신규주소: " + form.getNewAddress());
        System.out.println("addressChange: " + form.getAddressChange());
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // 1) 새 근무지 주소
        String address = form.getNewAddress();

        if (address == null || address.trim().isEmpty()) {
            model.addAttribute("error", "新勤務地住所を入力してください。");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // 2) GeoService로 위도/경도 조회
        GeoPoint geo = geoService.getLatLng(address);

        if (geo == null) {
            model.addAttribute("error", "住所の緯度経度が取得できませんでした。");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // 조회 성공 → 폼에 좌표 저장
        form.setLat(geo.getLat());
        form.setLng(geo.getLng());

        System.out.println("=== 좌표 세팅 후 ===");
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // 3) 주소 변경 여부에 따라 분기
        String addressChange = form.getAddressChange(); // "1" or "0"

        if ("1".equals(addressChange)) {
            // 住所が変わる → 4번 住所入力 화면으로 이동
            return "redirect:/idoconfirm/addressinput";
        } else {
            // 住所が変わらない → 5번 経路入力 화면으로 바로 가기 전, 주소 PG 사전 처리
            addressService.runPreNextProcess(form);
            return "redirect:/idoconfirm/keiroInfo";
        }
    }

    // 作成者 : 권예성
    // 勤務地入力 화면의 임시보존(tempSave) 처리
    @PostMapping("/tempSave")
    public String tempSaveKinmu(
            @RequestParam("kinmuJson") String kinmuJson,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        
        if (shain == null) {
            shain = new ShainVO();
            shain.setShain_Uid("30000001");  // 더미 사원번호
        }

        int userUid = Integer.parseInt(shain.getShain_Uid());
        String shozokuCd = shain.getShozoku_Cd();
        String shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null) {
            shinseiKbn = "01";
        }

        byte[] dataBytes = kinmuJson.getBytes(StandardCharsets.UTF_8);

        IchijiHozonDTO dto = new IchijiHozonDTO();
        dto.setUserUid(userUid);
        dto.setShinseiKbn(shinseiKbn);
        dto.setShozokuCd(shozokuCd);
        dto.setActionNm("KINMU_INPUT_TEMP_SAVE");
        dto.setData(dataBytes);
        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);

        oshiraseService.saveTempOshirase(shain, newUid);

        return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
    }

    	
    @GetMapping("/keiroInfo") //조우진
    public String keiroInfo() {
        return "idoconfirm/05_keiroInfo";
    }

    // =====================================
    // 기타 화면들 (기존 유지)
    // =====================================
    
    // 윤종운
	@GetMapping("/huzuikanri")
	public String huzuikanri(@ModelAttribute SearchCriteriaDTO criteria, Model model, HttpSession session) {
		
		if (criteria == null) {
			return "redirect:/fatalError";
		}
		
		// --- 0. 임시 더미데이터 주입
		
		// 0-1. 세션 데이터 시뮬레이션
		Integer kigyoCd = (Integer) session.getAttribute("kigyoCd");
		Integer shainUid = (Integer) session.getAttribute("shainUid");
		String tsukinShudanKbn = (String) session.getAttribute("tsukinShudanKbn");
		
		// kigyoCd 처리 (int)
		int kigyoCdValue = (kigyoCd == null) ? 0 : kigyoCd.intValue();
		if (kigyoCdValue == 0) {
			kigyoCdValue = 100;
			kigyoCd = kigyoCdValue; // Integer 객체 업데이트
			session.setAttribute("kigyoCd", kigyoCd);
		}
		
		// shainUid 처리 (Integer)
		Integer shainUidValue = (shainUid == null) ? 0 : shainUid.intValue();
		if (shainUidValue == 0) {
			shainUidValue = 30000001; //
			shainUid = shainUidValue;
			session.setAttribute("shainUid", shainUid);
		}
		
		// 0-2. 요청 파라미터(criteria) 시뮬레이션
		if (criteria.getShinseiNo() == 0) {
			criteria.setShinseiNo(1);
		}
		if (criteria.getKeiroSeq() == 0) {
			criteria.setKeiroSeq(1);
		}
		
		// --- 더미 데이터 주입 끝
		
		// 필수 키 값 criteria에 반영
		
		Integer currentKigyoCd = criteria.getKigyoCd();
		if (currentKigyoCd == null || currentKigyoCd.intValue() == 0) {
			criteria.setKigyoCd(kigyoCdValue);
		}
		
		Integer currentShainUid = criteria.getShainUid(); // NPE 방지를 위해 변수에 담기
		if (currentShainUid == null || currentShainUid.intValue() == 0) {
			criteria.setShainUid(shainUidValue);
		}
		
		// 필수 키 값 criteria 반영 끝
		
		// --- 디버그 코드 추가 ---
		System.out.println("DEBUG: Final kigyoCd = " + criteria.getKigyoCd());
		System.out.println("DEBUG: Final shinseiNo = " + criteria.getShinseiNo());
		// -----------------

		// 1. 조회 조건 검증 (필수 키 값 확인)
		if (criteria.getKigyoCd() == 0 || criteria.getShinseiNo() == 0) {
			// 필수 값이 없으면 오류 처리 또는 리다이렉트
			System.err.println("조회 조건 검증 중 오류 발생");
			return "redirect:/error";
		}

		try {
			// 2. 서비스 호출: 화면에 필요한 모든 데이터(신청 정보, 경로 목록, 마스터)를 가져옵니다.
			FuzuiShoruiFormDTO formData = fuzuiShoruiService.getInitialData(criteria);
			
			// --- 서비스 호출 확인 디버그 코드 추가
			System.out.println("DEBUG: Service call succeeded. Processing to rendering.");
			// --------------

			// 3. JSP에 데이터 전달
			model.addAttribute("formData", formData);

			// 4. 기존 JSP 반환
			return "idoconfirm/08_huzuiKanri";

		} catch (Exception e) {
			System.err.println("부수 서류 조회 중 오류 발생: " + e.getMessage());
			// 로그 기록 (PROCESS_LOG 테이블에 실패 기록)
			// logService.logError(e, "08_huzuiKanri 초기 로딩");
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	// 윤종운
    @GetMapping("/kakuninpage")
    public String kakuninpage() {
        return "idoconfirm/09_kakuninPage";
    }

    // 作成者 : 권예성
    @GetMapping("/kanryoPage")
    public String kanryoPage() {
        return "idoconfirm/10_kanryoPage";
    }

    // 作成者 : 권예성
    // 팝업 및 특례 신청
    @GetMapping("/shozokuSearchPopup")
    public String shozokuSearchPopup(Model model) {
        int kigyoCd = 100; // 더미 데이터 기준
        List<ShozokuVO> list = shozokuService.findShozokuList(kigyoCd);
        model.addAttribute("list", list);
        return "idoconfirm/shozokuSearchPopup";
    }

    // 作成者 : 권예성
    // 특례 신청 화면
    @GetMapping("/tokureiShinsei")
    public String tokureiShinsei(
            @RequestParam(name = "shinseiNo", required = false) String shinseiNo,
            @RequestParam(name = "type", required = false) String type,
            Model model) {

        if (type == null || type.trim().isEmpty()) {
            type = "A";
        }
        if (shinseiNo == null || shinseiNo.trim().isEmpty()) {
            shinseiNo = "0";
        }

        model.addAttribute("tokureiType", type);
        model.addAttribute("shinseiNo", shinseiNo);

        return "idoconfirm/k_52_tokureiShinsei";
    }

 // 作成者 : 권예성
    @PostMapping("/tokureiSubmit")
    public String tokureiSubmit(
    		@ModelAttribute ShinseiDTO mainDto,
            @ModelAttribute ShinseiStartKeiroVO startVo,
            @ModelAttribute ShinseiEndKeiroVO endVo,  
            @ModelAttribute ShinseiFuzuiShoruiDTO fuzuiDto,
            @ModelAttribute UploadFileDTO fileDto,
            @ModelAttribute AlertVO alertVo,
            @ModelAttribute ShinseiLogDTO shinseiLogDto,
            @ModelAttribute OshiraseDTO oshiraseDto,
            @ModelAttribute ProcessLogDTO processLogDto,
            @ModelAttribute IchijiHozonDTO ichijiDto,
            RedirectAttributes rttr) {

    	// 1. 로그 확인
        System.out.println("===== [DEBUG] 데이터 도착 =====");
        System.out.println("신청번호(JSP) : " + mainDto.getShinseiNo()); 
        
        // 시작 경로에는 '출발지'
        System.out.println("출발지 : " + startVo.getStartPlace()); 
        
        // 종료 경로에는 '장소'가 없으니 '금액'이나 '종료일'
        System.out.println("신청금액 : " + endVo.getShinseiKin()); 
        
        System.out.println("=============================");

        // 2. 유효성 체크 (이건 꼭 있어야 함)
        // (특례 사유가 비어있으면 신청 불가)
        if (mainDto.getTokuShinseiRiyu() == null || mainDto.getTokuShinseiRiyu().trim().isEmpty()) {
            rttr.addFlashAttribute("errorMessage", "特例申請事由を入力してください");
            return "redirect:/idoconfirm/tokureiShinsei";
        }
        
        // 3. 서비스 호출
        tokureiService.registerShinsei(mainDto, startVo, endVo, fuzuiDto, fileDto, alertVo, shinseiLogDto, oshiraseDto, processLogDto, ichijiDto);

        rttr.addFlashAttribute("message", "申し込みが完了しました");
        return "redirect:/idoconfirm/kanryoPage";
    }
    
 // 윤종운
 	@PostMapping(value = "/api/upload/fuzuiShorui", produces = "application/json")
 	@ResponseBody
 	public ResponseEntity<UploadResult> uploadFuzuiShorui(
 			@RequestParam("uploadFile") MultipartFile uploadFile,
 			@RequestParam("fileType") String fileType,
 			HttpSession session) {
 		
 		// 1. 파일 유효성 검사
 		if (uploadFile.isEmpty()) {
 			UploadResult result = UploadResult.builder()
 				.success(false)
 				.message("업로드할 파일을 선택해주세요.")
 				.build();
 			// 400 Bad Request 상태 코드와 함께 응답 본문을 반환
 			return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST); 
 		}
 		
 		// 2. 세션에서 ShainUid 추출 로직
 		Integer shainUid = (Integer) session.getAttribute("shainUid");
 		Integer kigyoCd = (Integer) session.getAttribute("kigyoCd");
 		
 		// 2-1. ShainUid 검증
 		if (shainUid == null || shainUid.intValue() == 0) {
 			UploadResult result = UploadResult.builder()
 				.success(false)
 				.message("세션에 사용자 정보가 없습니다.")
 				.build();
 			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED); // 401
 		}
 		// 2-2. KigyoCd 처리
 		// KigyoCd가 세션에 없거나 0인 경우, huzuikanri에서 설정했던 기본값(100)을 사용합니다.
 		if (kigyoCd == null || kigyoCd.intValue() == 0) {
 			kigyoCd = 100;
 		}
 		
 		try {
 			// 3. 파일 저장 처리 로직 호출 (shainUid와 kigyoCd 파라미터 추가)
 			String newFileUid = fuzuiShoruiService.saveUploadedFile(uploadFile, shainUid, kigyoCd, fileType);
 			
 			// String -> Long 변환
 			Long longFileUid = Long.parseLong(newFileUid);
 			
 			// 4. 메인 테이블(SHAIN_FUZUI_SHORUI)의 FILE_UID_4 필드 업데이트
 			fuzuiShoruiService.updateFuzuiShoruiFileUid(kigyoCd, shainUid, fileType, longFileUid);
 			
 			// 5. 성공 응답 구성 및 반환
 			UploadResult result = UploadResult.builder()
 				.success(true)
 				.fileUid(newFileUid)
 				.message("파일 업로드 완료")
 				.build();
 			
 			return new ResponseEntity<>(result, HttpStatus.OK);
 				
 		} catch (Exception e) {
 			
 			// 5. 실패 응답 구성 및 반환
 			System.err.println("파일 업로드 중 서버 에러가 발생: " + e.getMessage());
 			e.printStackTrace();
 			
 			UploadResult result = UploadResult.builder()
 				.success(false)
 				.message("파일 업로드 처리중에 서버 에러가 발생했습니다.")
 				.build();
 			
 			return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
 		}
 	}
 	
 	@GetMapping("/viewDocument")
 	public ResponseEntity<byte[]> viewDocument(@RequestParam("fileUid") String fileUid) {
 		// 1. Service를 통해 파일 데이터 및 메타 정보 조회
 		FileViewDTO fileData = fuzuiShoruiService.getFileForView(fileUid);
 		
 		if (fileData == null) {
 			// 등록된 파일이 없을 경우 404 또는 204 No Content 반환
 			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
 		}
 		
 		String contentType = fileData.getContentType();
 		
 		System.out.println("DEBUG: 조회된 ContentType (DB 값): [" + contentType + "]");
 		
 		// DB에서 조회한 값이 null이거나 빈 문자열인지 확인
 		if (contentType == null || contentType.trim().isEmpty()) {
 			System.err.println("ERROR: DB에서 조회된 ContentType이 NULL 또는 비어 있습니다. 파일 UID: " + fileUid);

 			// **방어 로직**: 기본값 설정
 			// 오류를 막기 위해 알 수 없는 바이너리 파일 타입인 'application/octet-stream'으로 대체
 			contentType = "application/octet-stream";
 			System.out.println("DEBUG: ContentType을 기본값 [application/octet-stream]으로 대체합니다.");
 		}
 		
 		// 2. Content Type 설정 (HTTP Header)
 		HttpHeaders headers = new HttpHeaders();
 		headers.setContentType(MediaType.parseMediaType(contentType));
 		headers.setCacheControl("no-cache, no-store, must-revalidate");
 		headers.setPragma("no-cache");
 		headers.setExpires(0L);
 		
 		// 3. 파일 이름 설정 (Content-Disposition을 'inline' 으로 하여 팝업/브라우저에 표시)
 		String fileName = fileData.getName(); 
 		String encodedFileName = "file"; // 파일 이름이 null이거나 비어있을 경우 사용할 기본값

 		// 파일 이름이 null이 아닐 때만 인코딩을 시도합니다.
 		if (fileName != null && !fileName.isEmpty()) {
 			try {
 				// 파일명에 포함된 공백, 한글 등을 UTF-8로 인코딩
 				encodedFileName = URLEncoder.encode(fileName, "UTF-8");
 			} catch (UnsupportedEncodingException e) {
 				System.err.println("UTF-8 인코딩을 지원하지 않아 파일명을 인코딩할 수 없습니다.");
 				// 인코딩 실패 시 (매우 드물지만) 안전한 이름으로 대체
 				encodedFileName = fileName.replaceAll("[^a-zA-Z0-9.-]", "_"); 
 			}
 		} else {
 			System.err.println("ERROR: DB에서 조회된 파일 이름(NAME)이 NULL 또는 비어 있습니다. 기본 이름 'file' 사용.");
 		}

 		// Content-Disposition을 'inline'으로 설정하여 브라우저에서 바로 표시하도록 합니다.
 		headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + encodedFileName + "\"");
 		
 		// 4. ResponseEntity로 파일 데이터와 HTTP 헤더 반환
 		return new ResponseEntity<>(fileData.getData(), headers, HttpStatus.OK);
 	}
 	
 	// 임시저장 엔드포인트
 	@PostMapping("/tempSaveFuzui")
 	public String tempSaveCommute(@RequestParam(name = "hozonUid", required = false) String hozonUid,
 			@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
 			@RequestParam("commuteJson") String commuteJson, @RequestParam("actionUrl") String actionUrl,
 			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, 
 			HttpSession session,
 			HttpServletRequest request) {

 		ShainVO shain = (ShainVO) session.getAttribute("shain");

 		System.out.println(">>> hozonUid = " + hozonUid);
 		System.out.println(">>> shinseiNo = " + shinseiNo);

 		Integer userUid = Integer.parseInt(shain.getShain_Uid());
 		String shozokuCd = shain.getShozoku_Cd();
 		String shinseiKbn = shain.getShinchoku_kbn();

 		if (shinseiKbn == null || shinseiKbn.isEmpty()) {
 			shinseiKbn = "01";
 		}

 		if (hozonUid == null || hozonUid == "") {
 			hozonUid = "0";
 		}
 		
 		byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

 		IchijiHozonDTO dto = new IchijiHozonDTO();
 		dto.setHozonUid(Integer.valueOf(hozonUid));
 		dto.setUserUid(userUid);
 		dto.setShinseiKbn(shinseiKbn);
 		dto.setShozokuCd(shozokuCd);
 		dto.setActionNm(actionUrl);
 		dto.setData(dataBytes);

 		dto.setAddUserId(userUid);
 		dto.setUpdUserId(userUid);

 		if (shinseiNo == null || shinseiNo == "") {
 			shinseiNo = "0";
 		}

 		int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);
 		oshiraseService.saveTempOshirase(shain, Long.valueOf(shinseiNo));
 		String clientIp = getClientIp(request);

 		fuzuiShoruiService.writeProcessLog("COS", "TEMP", shinseiNo, "", "", "", "", "", userUid, clientIp);

 		if (redirectUrl == "") {
 			return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
 		}
 		
 		if (hozonUid == "0") {
 			return "redirect:" + redirectUrl + "?hozonUid=" + newUid;
 		} else {		
 			return "redirect:" + redirectUrl;
 		}
 		
 	}
 	
 	private boolean isBlank(String str) {
 		return (str == null || str.trim().isEmpty());
 	}
 	
 	public String getClientIp(HttpServletRequest request) {

 		String ip = request.getHeader("X-Forwarded-For");

 		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
 			ip = request.getHeader("Proxy-Client-IP");
 		}
 		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
 			ip = request.getHeader("WL-Proxy-Client-IP");
 		}
 		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
 			ip = request.getRemoteAddr();
 		}

 		if (ip != null && ip.contains(",")) {
 			ip = ip.split(",")[0].trim();
 		}

 		if ("0:0:0:0:0:0:0:1".equals(ip)) {
 			ip = "127.0.0.1";
 		}

 		return ip;
 	}
}
