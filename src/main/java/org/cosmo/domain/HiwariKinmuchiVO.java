package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKinmuchiVO")
public class HiwariKinmuchiVO {

    // 기본키
    private Integer kigyoCd;     // KIGYO_CD
    private Long shainUid;       // SHAIN_UID
    private String kinmuPrefNm;   // 都道府県名（例：東京都）

    // 所属 (신청 전/후 공통)
    private String beforeShozokuCd;   // DB_SHOZOKU_CD 또는 NEW_SHOZOKU_CD
    private String beforeShozokuNm;   // SHOZOKU.SHOZOKU_NM

    // 勤務地 주소 (신청 전/후 공통)
    private String kinmuZipCd;        // KINMU_ZIP_CD 또는 NEW_KINMU_ZIP_CD
    private String kinmuPrefCd;       // KINMU_PREF_CD 또는 NEW_KINMU_PREF_CD
    private String kinmuAddress1;     // KINMU_ADDRESS_1 또는 NEW_KINMU_ADDRESS_1
    private String kinmuAddress2;     // KINMU_ADDRESS_2 또는 NEW_KINMU_ADDRESS_2
    private String kinmuAddress3; 
}



