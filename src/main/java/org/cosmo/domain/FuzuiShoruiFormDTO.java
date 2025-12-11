package org.cosmo.domain;

import lombok.Data;
import java.util.List;

// 윤종운
/**
 * 부수 서류 입력 화면(0800)의 초기 로딩 데이터를 모두 담는 래퍼 DTO
 */
@Data
public class FuzuiShoruiFormDTO {
	
	// 1. 신청 기본 정보 (SHINSEI 테이블)
	private List<ShinseiDTO> shinseiList;

	// 2. 경로별 부수 서류 목록 (SHINSEI_FUZUI_SHORUI 테이블)
	// 화면에 경로가 여러 개 표시되므로 List 형태입니다.
	private List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList;
	
	// 3. 사원 부수 서류 목록 (SHAIN_FUZUI_SHORUI 테이블)
	private List<ShainFuzuiShoruiDTO> shainFuzuiShoruiList;

	// 4. 기업 규정 마스터 데이터 (KIGYO_KITEI 테이블)
	// 예: 정기 기간 선택 옵션, 보험 등급 옵션 등
	private List<KigyoKiteiDTO> kigyoKiteiList; 
	
	// 5. (옵션) 임시 저장 데이터 존재 여부
	// ICHIJI_HOZON 테이블에 저장된 데이터가 있으면 이 플래그를 통해 처리합니다.
	private boolean isTempSaved;
	
	// 6. (옵션) 기타 화면에서 필요한 정보
	private String currentTsukinShudan; // 현재 통근수단 구분 (JSP: currentCommute)
	
	// 6-1. 면허유효기간
	private String currentMenkyoKigen; // 현재 면허증 만료일 (JSP: currentMenkyoKigen)
	private boolean isMenkyoExpired; // 만료 여부 플래그 (Service에서 계산)
	private boolean isMenkyoNearExpire;
	
	// 6-2. 차검유효기간
	private String currentShakenKigen;
	private boolean isShakenExpired;
	private boolean isShakenNearExpire;
	
	// 6-3. 보험만료일
	private String currentHokenManryo;
	private boolean isHokenExpired;
	private boolean isHokenNearExpire;

	// 생성자 (필요한 데이터를 쉽게 담기 위함)
	public FuzuiShoruiFormDTO(
		List<ShinseiDTO> shinseiList, 
		List<ShinseiFuzuiShoruiDTO> shinseiFuzuiShoruiList, 
		List<ShainFuzuiShoruiDTO> shainFuzuiShoruiList,
		List<KigyoKiteiDTO> kigyoKiteiList
	) {
		this.shinseiList = shinseiList;
		this.shinseiFuzuiShoruiList = shinseiFuzuiShoruiList;
		this.shainFuzuiShoruiList = shainFuzuiShoruiList;
		this.kigyoKiteiList = kigyoKiteiList;
	}
}