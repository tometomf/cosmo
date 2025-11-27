package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.AlertType;
import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.IdoCheckForm;
import org.cosmo.domain.KinmuForm;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShozokuVO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.service.AddressInputService;
import org.cosmo.service.AddressService;
import org.cosmo.service.FuzuiShoruiService;
import org.cosmo.service.GeoService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.IdoConfirmService;
import org.cosmo.service.OshiraseService;
import org.cosmo.service.ShozokuService;
import org.cosmo.service.TokureiService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    
    @GetMapping("/idoconfirm")	//02조우진
    public String idoconfirm(
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            Model model) {

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
    
    @PostMapping("/next") //02조우진
    public String next(
            @ModelAttribute("form") IdoCheckForm form,
            @RequestParam(name = "alertType", required = false) AlertType alertType,
            RedirectAttributes rttr) {

        if (alertType == null) {
            alertType = AlertType.SONOHOKA;
        }
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
                } else if (alertType == AlertType.JISHIN) {
                	throw new RuntimeException();
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
    public String addressInputGet(Model model) {
        // [주의] 실제 로그인 연동 시 세션에서 가져와야 함. 
        // DB 테스트 데이터에 넣은 'user123'을 사용합니다.
        String shainUid = "user123"; 

        // 1. 화면 상단(회색 박스)에 보여줄 DB 데이터 로드
        AddressViewDto view = addressInputService.loadViewData(shainUid);

        // 2. 폼 객체 초기화 (없을 경우만)
        if (!model.containsAttribute("addressInputForm")) {
            model.addAttribute("addressInputForm", addressInputService.initForm());
        }
        
        // 3. 뷰 데이터 전달
        model.addAttribute("view", view);

        return "idoconfirm/04_addressinput";
    }

    @PostMapping("/addressinput")
    public String addressInputPost(
            @ModelAttribute("addressInputForm") AddressInputForm form,
            BindingResult result,
            Model model,
            RedirectAttributes rttr) {

        String shainUid = "user123"; // 테스트용 ID
        String action = form.getAction(); 

        // ---------------------------------------------------
        // 1. 반영 버튼 (DB의 중간주소를 입력폼에 자동 채움)
        // ---------------------------------------------------
        if ("reflect".equals(action)) {
            // 서비스에서 DB 값을 조회하여 form에 set 해줌
            addressInputService.reflectMiddleAddress(form, shainUid);
            
            // 화면 상단 데이터 다시 로드
            model.addAttribute("view", addressInputService.loadViewData(shainUid));
            
            // 값이 채워진 form을 다시 화면으로 전달
            model.addAttribute("addressInputForm", form);
            
            return "idoconfirm/04_addressinput";
        }

        // ---------------------------------------------------
        // 2. 우편번호 검색 버튼
        // ---------------------------------------------------
        if ("search".equals(action)) {
            addressInputService.searchZipCode(form);
            model.addAttribute("view", addressInputService.loadViewData(shainUid));
            return "idoconfirm/04_addressinput";
        }

        // ---------------------------------------------------
        // 3. 일시보존 버튼
        // ---------------------------------------------------
        if ("tempsave".equals(action)) {
            addressInputService.tempSave(form, shainUid);
            rttr.addFlashAttribute("message", "一時保存しました。");
            rttr.addFlashAttribute("addressInputForm", form); // 입력했던 값 유지
            return "redirect:/idoconfirm/addressinput";
        }

        // ---------------------------------------------------
     // 4. [다음(次へ)] 버튼 클릭 시 (수정된 부분)
        // ==============================================================
        if ("next".equals(action)) {
            
            // 1) 필수 입력값 체크 (빈 값 확인)
            // (AddressInputServiceImpl에 있는 기본 검증 사용)
            boolean isBasicValid = addressInputService.validateAndCheckRoute(form);
            
            if (!isBasicValid) {
                model.addAttribute("errorMessage", "必須項目を入力してください。");
                // 화면 깨짐 방지용 데이터 로드
                model.addAttribute("view", addressInputService.loadViewData(shainUid));
                return "idoconfirm/04_addressinput";
            }

            // 2) 주소 문자열 합치기 (도도부현 + 시구정촌 + 건물명)
            String fullAddress = form.getPref() + form.getAddr1() 
                               + (form.getAddr2() == null ? "" : form.getAddr2());
            
            System.out.println(">> GeoService 호출 전 주소: " + fullAddress);

            // 3) ★ 동료가 만든 GeoService 호출 (위도/경도 취득) ★
            GeoPoint point = geoService.getLatLng(fullAddress);

            // 4) 좌표 취득 실패 시 (에러 메시지 표시 및 화면 유지)
            if (point == null) {
                model.addAttribute("errorMessage", "住所の緯度経度が取得できませんでした。");
                model.addAttribute("view", addressInputService.loadViewData(shainUid));
                return "idoconfirm/04_addressinput";
            }

            // 5) 성공 시 로그 출력 (취득 확인)
            System.out.println("===== [04] 좌표 취득 성공 =====");
            System.out.println("Lat: " + point.getLat());
            System.out.println("Lng: " + point.getLng());
            
            // (필요하다면 여기서 다음 화면으로 넘길 데이터 처리 가능)
            
            // 6) 경로 입력 화면으로 이동
            return "redirect:/idoconfirm/keiroInfo";
        }

        // 그 외 -> 원래 화면
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
            
            throw new RuntimeException("セッションに社員情報がありません。");
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

        oshiraseService.saveTempOshirase(shain);

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
            shinseiNo = "1";
        }

        model.addAttribute("tokureiType", type);
        model.addAttribute("shinseiNo", shinseiNo);

        return "idoconfirm/k_52_tokureiShinsei";
    }

    // 作成者 : 권예성
    // 특례 신청 Submit
    @PostMapping("/tokureiSubmit")
    public String tokureiSubmit(@ModelAttribute TokureiForm form,
                                RedirectAttributes rttr) {

        System.out.println("===== TokureiForm =====");
        System.out.println("신청번호   : " + form.getShinseiNo());
        System.out.println("특례타입   : " + form.getTokureiType());
        System.out.println("동의 여부  : " + form.getAgree());
        System.out.println("특례 사유  : " + form.getTokureiReason());
        System.out.println("======================");

        if (form.getAgree() == null) {
            rttr.addFlashAttribute("errorMessage",
                    "特例について内容を理解した上で申請にチェックしてください。");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        if (form.getTokureiReason() == null || form.getTokureiReason().trim().isEmpty()) {
            rttr.addFlashAttribute("errorMessage", "特例申請理由を入力してください。");
            return "redirect:/idoconfirm/tokureiShinsei";
        }

        tokureiService.saveTokurei(form);
        rttr.addFlashAttribute("message", "特例申請を受け付けました。");
        return "redirect:/idoconfirm/kanryoPage";
    }
}
