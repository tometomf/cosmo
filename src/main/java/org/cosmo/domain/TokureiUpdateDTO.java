// 作成者 : 권예성

package org.cosmo.domain;

import lombok.Data;

@Data
public class TokureiUpdateDTO {
	
	// PK
    private int kigyoCd;        // KIGYO_CD
    private int shinseiNo;      // SHINSEI_NO

    // 특례 사유
    private String tokuShinseiRiyu; // TOKU_SHINSEI_RIYU

    // (선택) 누가 수정했는지
    private Integer updUserId;  // UPD_USER_ID

}
