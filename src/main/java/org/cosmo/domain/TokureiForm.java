// 作成者 : 권예성

package org.cosmo.domain;

import lombok.Data;

@Data
public class TokureiForm {
	
	// ====== 화면에서 넘어오는 값 ======

    // 특례 타입 (A or B) - hidden or model 에서 내려줌
    private String tokureiType;

    // 라디오 체크 (1이면 체크) - "1" or null
    private String agree;

    // textarea에 입력한 특례 사유
    private String tokureiReason;


    // ====== 서버에서 세팅하는 값 (form 에서 안 넘어옴) ======

    // 기업 코드 (세션)
    private Integer kigyoCd;

    // 사원 UID (세션)
    private Integer shainUid;

    // 사원 번호 (세션)
    private String shainNo;

    // 신청 번호 (DB에서 채번)
    private Long shinseiNo;
}
