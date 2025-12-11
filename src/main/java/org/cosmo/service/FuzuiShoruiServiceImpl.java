package org.cosmo.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.cosmo.domain.FileViewDTO;
// 필요한 DTO들을 임포트해야 합니다.
import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.KigyoKiteiDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.domain.ShainFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.mapper.FuzuiShoruiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션을 위해 필요
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;

// 윤종운
@Service
public class FuzuiShoruiServiceImpl implements FuzuiShoruiService {
	
	@Setter(onMethod_ = @Autowired)
	private FuzuiShoruiMapper fuzuiShoruiMapper;
	
	// 1. 화면 초기 로딩에 필요한 모든 데이터를 조회
	@Override
	public FuzuiShoruiFormDTO getInitialData(SearchCriteriaDTO criteria) {
		
		int kigyoCd = criteria.getKigyoCd() != 0 ? criteria.getKigyoCd() : 0; // Null 체크
		long shinseiNo = criteria.getShinseiNo() != 0 ? criteria.getShinseiNo() : 0;
		int keiroSeq = criteria.getKeiroSeq() != 0 ? criteria.getKeiroSeq() : 0;
		Integer shainUid = criteria.getShainUid() != null ? criteria.getShainUid() : 0;
		String komokuSybtsu = criteria.getKomokuSybtsu() != null ? criteria.getKomokuSybtsu() : "";
		String code = criteria.getCode() != null ? criteria.getCode() : "";
		int nengetsu = criteria. getNengetsu() != 0 ? criteria.getNengetsu() : 0;
		String shinseiYmd = criteria.getShinseiYmd() != null ? criteria.getShinseiYmd() : "";
		
		if (kigyoCd == 0 || shinseiNo == 0 || keiroSeq == 0 || shainUid == 0) {
			throw new IllegalArgumentException("필수 키 값이 누락되었습니다.");
		}
		
		System.out.println("kigyoCd: " + kigyoCd);
		System.out.println("shinseiNo: " + shinseiNo);
		System.out.println("shainUid: " + shainUid);
		
		// 1-1. 신청 기본 정보 (SHINSEI 조회)
		List<ShinseiDTO> shinseiList = fuzuiShoruiMapper.selectShinseiList(kigyoCd, shinseiNo);
		
		// 1-2. 경로별 부수 서류 목록 (SHINSEI_FUZUI_SHORUI) 조회
		List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList = fuzuiShoruiMapper.selectShinseiFuzuiShoruiList(kigyoCd, shinseiNo, keiroSeq);
		
		// 1-3. 사원 부수 서류 목록 (SHAIN_FUZUI_SHORUI) 조회
		List<ShainFuzuiShoruiDTO> shainFuzuiShoruiList = fuzuiShoruiMapper.selectShainFuzuiShoruiList(kigyoCd, shainUid);
		
		// 1-4. 기업 규정 (KIGYO_KITEI) 조회
		List<KigyoKiteiDTO> kigyoKiteiList = fuzuiShoruiMapper.selectKigyoKiteiList(kigyoCd, komokuSybtsu, code, nengetsu, shinseiYmd);
		
		// 1-5. 현재 통근 수단 구분 및 서류 정보 조회
		String currentTsukinKbn = fuzuiShoruiMapper.selectCurrentTsukinShudanKbn(shainUid);
		
		// 면허증, 차검증, 보험 만료일 값을 SHAIN_FUZUI_SHORUI DTO에서 가져옵니다.
		String currentMenkyoKigen = (shainFuzuiShoruiList != null && !shainFuzuiShoruiList.isEmpty()) 
									? shainFuzuiShoruiList.get(0).getMenkyoYukoKigen() : null;
		String currentShakenKigen = (shainFuzuiShoruiList != null && !shainFuzuiShoruiList.isEmpty()) 
									? shainFuzuiShoruiList.get(0).getShakenYukoKigen() : null;
		String currentHokenManryo = (shainFuzuiShoruiList != null && !shainFuzuiShoruiList.isEmpty()) 
									? shainFuzuiShoruiList.get(0).getHokenManryoYmd() : null;

		// 1-6. 만료 플래그 계산 로직

		// 1. 면허증 기한 계산
		Map<String, Boolean> menkyoFlags = calculateExpiration(currentMenkyoKigen);

		// 2. 차검증 기한 계산
		Map<String, Boolean> shakenFlags = calculateExpiration(currentShakenKigen);

		// 3. 보험 만료일 계산
		Map<String, Boolean> hokenFlags = calculateExpiration(currentHokenManryo);
		
		// 1-7. 모든 데이터를 래퍼 DTO에 담아 반환
		FuzuiShoruiFormDTO formData = new FuzuiShoruiFormDTO(shinseiList, shinseiFuzuiShoruiList, shainFuzuiShoruiList, kigyoKiteiList);
		
		// 조회된 현재 데이터를 DTO에 설정
		formData.setCurrentTsukinShudan(currentTsukinKbn);
		
		// 면허증 만료 플래그 설정
		formData.setCurrentMenkyoKigen(currentMenkyoKigen);
		formData.setMenkyoExpired(menkyoFlags.get("isExpired"));
		formData.setMenkyoNearExpire(menkyoFlags.get("isNearExpire"));
		
		// 차검증 만료 플래그 설정
		formData.setCurrentShakenKigen(currentShakenKigen);
		formData.setShakenExpired(shakenFlags.get("isExpired"));
		formData.setShakenNearExpire(shakenFlags.get("isNearExpire"));
		
		// 보험 만료 플래그 설정
		formData.setCurrentHokenManryo(currentHokenManryo);
		formData.setHokenExpired(hokenFlags.get("isExpired"));
		formData.setHokenNearExpire(hokenFlags.get("isNearExpire"));
		
		return formData;
	}

	// 2. 입력된 데이터를 검증하고 최종 저장(트랜잭션)
	@Transactional
	@Override
	public void saveFuzuiShoruiData(List<ShinseiDTO> shinseiList, List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList, List<ShainFuzuiShoruiDTO> shainFuzuiShoruiList) {
		// 2-1. SHINSEI 테이블 업데이트
		fuzuiShoruiMapper.updateShinsei(shinseiList);
		
		// 2-2. 경로별 부수 서류 정보 (SHINSEI_FUZUI_SHORUI) 저장/갱신
		for (ShinseiFuzuiShoruiDTO shinseiFuzuiShorui : shinseiFuzuiShoruiList) {
			if (shinseiFuzuiShorui.getKeiroSeq() > 0) {
				fuzuiShoruiMapper.updateShinseiFuzuiShorui(shinseiFuzuiShorui);
			} else {
				fuzuiShoruiMapper.insertShinseiFuzuiShorui(shinseiFuzuiShorui);
			}
		}
		
		// 2-3. 프로세스 로그 기록
		ProcessLogDTO processLog = createProcessLog(shinseiList);
		fuzuiShoruiMapper.insertProcessLog(processLog);
	}
	
	// 프로세스 로그 로직
	private ProcessLogDTO createProcessLog(List<ShinseiDTO> shinseiList) {
		ProcessLogDTO processLog = new ProcessLogDTO();

		// shinseiList에서 첫 번째 항목의 key 정보를 사용한다고 가정합니다.
		if (!shinseiList.isEmpty()) {
			ShinseiDTO mainShinsei = shinseiList.get(0);

			// --- 3-1. 핵심 정보 설정 ---

			// [SUBSYSTEM_ID]
			processLog.setSubsystemId("FUZ"); // 부수 서류 서브시스템 ID (가정)

			// [PROCESS_COL] フォーム名
			processLog.setProcessCol("SHINSEI_ENTRY"); // 폼 이름 (신청 등록 폼)

			// [KEY1] 申請番号
			processLog.setKey1(String.valueOf(mainShinsei.getShinseiNo())); 

			// [KEY2] 申請区分コード (메모 반영: DTO에서 가져옴)
			processLog.setKey2(mainShinsei.getShinseiKbn()); 

			// [KEY3] 処理区分コード(変更前) (메모 반영: '0:一時保存' 가정)
			// 이 값은 실제 DB에서 업데이트 전 상태를 조회하여 넣는 것이 가장 정확합니다. 
			// 여기서는 임시로 '0'으로 설정합니다.
			processLog.setKey3("0"); 

			// [KEY4] 処理区分コード(変更後) (메모 반영: '1:申請' 가정)
			processLog.setKey4("1");

			// [KEY5] 企業コード
			processLog.setKey5(String.valueOf(mainShinsei.getKigyoCd()));

			// --- 3-2. 사용자 정보 설정 ---

			// [USER_UID], [USER_TRACK] 은 세션에서 가져오는 로직 필요
			// processLog.setUserUid(getCurrentUserUid());
			// processLog.setUserTrack(getCurrentUserIP());
		}

		// --- 3-3. 로그 본문 (DATA CLOB) 설정 ---

		processLog.setData("申請情報 최종保存. 処理区分が 0(一時保存) から 1(申請) に変更されました.");

		return processLog;
	}

	// 4. 임시 저장 기능을 처리(트랜잭션 필요)
	@Transactional
	@Override
	public void tempSave(IchijiHozonDTO hozonData) {
	}
	
	// --------------------------------------------------------------------------
	// 💡 5. 파일 업로드 구현 (Service Interface 구현) 💡
	// --------------------------------------------------------------------------
	/**
	 * 파일을 저장소에 저장하고, 파일 메타데이터를 DB에 기록 후, 파일 UID를 반환합니다.
	 */
	@Transactional // 파일 저장과 DB 저장은 하나의 트랜잭션으로 처리
	@Override
	public String saveUploadedFile(MultipartFile uploadFile, Integer shainUid, Integer kigyoCd, String fileType, Long shinseiNo) {

		// 1. 파일 정보 추출
		String originalFileName = uploadFile.getOriginalFilename();
		if (originalFileName == null || originalFileName.isEmpty()) {
			throw new IllegalArgumentException("파일 이름이 유효하지 않습니다.");
		}
		
		// 파일 UID 랜덤 로직
		Random rand = new Random();
		StringBuilder sb = new StringBuilder();
		
		// 첫 자리 1~9 (0으로 시작하면 18자리 안됨)
		sb.append(rand.nextInt(9) + 1);
		
		// 나머지 17자리 0~9
		for (int i = 0; i < 17; i++) {
			sb.append(rand.nextInt(10));
		}
		
		String fileUidString = sb.toString();
		Long fileUid = Long.parseLong(fileUidString);

		// 2. DB 저장을 위한 DTO/VO 객체 생성
		UploadFileDTO fileDTO = new UploadFileDTO();
		
		// 2-1. 파일의 바이트 배열을 DTO의 data필드에 설정 (BLOB 저장)
		try {
			fileDTO.setData(uploadFile.getBytes());
		} catch (IOException e) {
			System.err.println("파일 데이터 읽기 오류 발생: " + e.getMessage());
			throw new RuntimeException("파일 데이터를 읽는 중 오류가 발생했습니다.", e);
		}
		
		// 2-2. 메타데이터 설정 (컬럼명 NAME 사용)
		fileDTO.setFileUid(fileUid);
		fileDTO.setName(originalFileName); // 등록 파일명 그대로(파일업로드DB 설계서)
		fileDTO.setContentType(uploadFile.getContentType());
		fileDTO.setTitle(getTitleFromType(fileType));
		
		// 2-3. UPLOAD_FILE 테이블의 복합 PK에 포함된 SEQ 설정
		fileDTO.setSeq(0);
		
		// 2-4. 관리 정보 설정 (KIGYO_CD, ADD_USER_ID)
		fileDTO.setKigyoCd(String.valueOf(kigyoCd));
		fileDTO.setAddUserId(shainUid);
		fileDTO.setUpdUserId(shainUid);
		
		// 3. Mapper 호출 (DB 저장)
		fuzuiShoruiMapper.insertFile(fileDTO);
		
		// 4. SHAIN_FUZUI_SHORUI & SHINSEI_FUZUI_SHORUI 테이블 업데이트 로직
		if (kigyoCd != null && kigyoCd.intValue() > 0 && shainUid != null && shainUid.intValue() > 0 && shinseiNo != null) {
			// SHAIN_FUZUI_SHORUI 테이블의 해당 fileType 컬럼에 fileUid 값 업데이트
			updateFuzuiShoruiFileUid(kigyoCd, shinseiNo, shainUid, fileType, fileUid);
		} else {
			// 오류 처리
			System.err.println("에러: 업데이트를 위한 복합 PK(kigyoCd, shainUid, shinseiNo 중 하나)가 유효하지 않습니다.");
			
			throw new RuntimeException("사용자/신청 식별 정보가 유효하지 않아 파일 링크 업데이트에 실패했습니다.");		}
		
		// 5. 파일 UID 반환
		return fileUidString;
	}
	
	private String getTitleFromType(String fileType) {
		// 1. NPE 방지 및 ETC_FILE_UID 처리
		if (fileType == null) {
			return "添付書類(Null)";
		}
		
		// ETC_FILE_UID는 startsWith을 사용해야 하므로 별도 처리
		if (fileType.startsWith("ETC_FILE_UID")) {
			return "その他";
		}
		
		
		
		// 2. switch 문을 사용하여 고정된 FILE_UID 값 처리
		switch (fileType) {
			case "FILE_UID_4":
				return "免許証コピー"; // 면허증 복사
			case "FILE_UID_5":
				return "車検書"; // 차검증
			case "FILE_UID_6":
				return "保険証券(期限)"; // 보험증권(기간)
			case "FILE_UID_7":
				return "保険証券(賠償内容)"; // 보험증권(배상내용)
			case "FILE_UID_1":
				return "定期券"; // 정기권
			default:
				// 3. 모든 case 및 startsWith 조건에 해당하지 않을 경우 실행되는 기본값
				System.err.println("경고: 정의되지 않은 파일 타입이 전달되었습니다: " + fileType);
				return "添付書類(不明)";
		}
	}
	
	@Override
	public FileViewDTO getFileForView(String fileUid) {
		if (fileUid == null || fileUid.isEmpty()) {
			return null;
		}
		
		FileViewDTO fileData = fuzuiShoruiMapper.selectFileByFileUid(fileUid);
		if (fileData != null && fileData.getData() != null) {
			System.out.println("DEBUG: File Data Size: " + fileData.getData().length);
		}
		
		return fileData;
	}
	
	@Transactional
	@Override
	public void updateFuzuiShoruiFileUid(Integer kigyoCd, Long shinseiNo, Integer shainUid, String fileType, Long fileUid) {
		
		// 분기 처리: ETC로 시작하는 파일 타입인 경우
		if (fileType != null && fileType.startsWith("ETC_FILE_UID")) {
			
			// 1. SHINSEI 테이블 업데이트
			int updatedEtcRows = fuzuiShoruiMapper.updateShinseiEtcFileUid(kigyoCd, shinseiNo, shainUid, fileType, fileUid);
			
			if (updatedEtcRows == 0) {
				System.err.println("경고: SHINSEI 테이블(ETC) 업데이트 실패. KIGYO_CD: " + kigyoCd + ", SHINSEI_NO: " + shinseiNo + "에 해당하는 레코드를 찾을 수 없습니다.");
			}
		} else {
			
			// 2. SHAIN_FUZUI_SHORUI 테이블 업데이트
			int updatedShainRows = fuzuiShoruiMapper.updateShainFuzuiFileUid(kigyoCd, shainUid, fileType, fileUid);
			
			if (updatedShainRows == 0) {
				System.err.println("경고: SHAIN_FUZUI_SHORUI 업데이트 실패. KIGYO_CD: " + kigyoCd + ", SHAIN_UID: " + shainUid + "에 해당하는 레코드를 찾을 수 없습니다.");
			}
			
			int updatedShinseiRows = fuzuiShoruiMapper.updateShinseiFuzuiFileUid(kigyoCd, shinseiNo, shainUid, fileType, fileUid);
			
			if (updatedShinseiRows == 0) {
				System.err.println("경고: SHINSEI_FUZUI_SHORUI 업데이트 실패. KIGYO_CD: " + kigyoCd + ", SHINSEI_NO: " + shinseiNo + "에 해당하는 레코드를 찾을 수 없습니다.");
			}
		}
	}
	
	@Override
	public void writeProcessLog(
		String subsystemId,
		String processCol,
		String key1,
		String key2,
		String key3,
		String key4,
		String key5,
		String data,
		Integer userUid,
		String userTrack
	) {
		ProcessLogDTO log = new ProcessLogDTO();
		
		// PK
		log.setProcessTimestamp(new Timestamp(System.currentTimeMillis()));
		log.setSubsystemId(subsystemId);
		log.setProcessCol(processCol);
		
		log.setKey1(key1);
		log.setKey2(key2);
		log.setKey3(key3);
		log.setKey4(key4);
		log.setKey5(key5);
		
		log.setData(data);
		log.setUserUid(userUid);
		log.setUserTrack(userTrack);
		
		fuzuiShoruiMapper.insertProcessLog(log);
	}
	
	private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyyMMdd");
	
	/**
	 * 날짜 문자열(YYYYMMDD)을 받아 만료 여부 및 1개월 임박 여부를 계산합니다.
	 * @param kigenYmd 만료일 (YYYYMMDD)
	 * @return isExpired, isNearExpire 플래그를 담은 Map
	 */
	private Map<String, Boolean> calculateExpiration(String kigenYmd) {
		Map<String, Boolean> flags = new HashMap<>(); // java.util.HashMap import 필요
		flags.put("isExpired", false);
		flags.put("isNearExpire", false);

		if (kigenYmd == null || kigenYmd.isEmpty()) {
			return flags;
		}

		try {
			LocalDate today = LocalDate.now();
			LocalDate expireDate = LocalDate.parse(kigenYmd, FORMATTER);

			// ① 만료 여부 (isExpired) 계산
			if (expireDate.isBefore(today)) {
				flags.put("isExpired", true);
				return flags; // 만료 시 임박 여부는 체크할 필요 없음
			}

			// ② 1개월 임박 여부 (isNearExpire) 계산
			// 요구사항: 1개월 미만을 30일로 계산합니다.
			LocalDate thirtyDaysLater = today.plusDays(30); 

			// 만료일이 현재 날짜 이후이고, 오늘부터 30일 후 날짜 이전이면 임박
			if (expireDate.isBefore(thirtyDaysLater) || expireDate.isEqual(thirtyDaysLater)) {
				flags.put("isNearExpire", true);
			}

		} catch (Exception e) {
			System.err.println("기한 파싱 오류: " + kigenYmd + " - " + e.getMessage());
		}

		return flags;
	}
}