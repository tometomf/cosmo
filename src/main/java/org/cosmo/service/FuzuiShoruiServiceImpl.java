package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.*; // 필요한 DTO들을 임포트해야 합니다.
import org.cosmo.mapper.FuzuiShoruiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션을 위해 필요

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
		
		// 1-1. 신청 기본 정보 (SHINSEI 조회)
		List<ShinseiDTO> shinseiList = fuzuiShoruiMapper.selectShinseiList(kigyoCd, shinseiNo);
		
		// 1-2. 경로별 부수 서류 목록 (SHINSEI_FUZUI_SHORUI) 조회
		List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList = fuzuiShoruiMapper.selectShinseiFuzuiShoruiList(kigyoCd, shinseiNo, keiroSeq);
		
		// 1-3. 기업 규정 (KIGYO_KITEI) 조회
		List<KigyoKiteiDTO> kigyoKiteiList = fuzuiShoruiMapper.selectKigyoKiteiList(kigyoCd, komokuSybtsu, code, nengetsu, shinseiYmd);
		
		// 1-4. 현재 통근 수단 구분 (Current TSUKIN_SHUDAN_KBN) 별도 조회
		// (직전 신청 정보 또는 직원 마스터 테이블 조회 필요)
		String currentTsukinKbn = fuzuiShoruiMapper.selectCurrentTsukinShudanKbn(shainUid);
		
		// 1-5. 모든 데이터를 래퍼 DTO에 담아 반환
		FuzuiShoruiFormDTO formData = new FuzuiShoruiFormDTO(shinseiList, shinseiFuzuiShoruiList, kigyoKiteiList);
		formData.setCurrentTsukinShudan(currentTsukinKbn);
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
}