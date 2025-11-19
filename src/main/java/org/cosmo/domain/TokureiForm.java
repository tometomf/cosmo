package org.cosmo.domain;

import lombok.Data;

@Data
public class TokureiForm {
	
	// 숨겨진 값 (신청 번호)
	private String shinseiNo;
	
	// 특례 타입 (A or B)
	private String tokureiType;
	
	// 라디오 체크 (1이 들어옴)
	private String agree;
	
	// textarea에 입력한 특례 사유
	private String tokureiReason;

}
