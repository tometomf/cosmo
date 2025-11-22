package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKinmuchiVO")
public class HiwariKinmuchiVO {

    // ===== 現勤務地 쪽 =====
    // 勤務先コード
    private String genKinmusakiCd;   // 신청 전: SHAIN.SHOZOKU_CD
                                     // 신청 후: SHINSEI.GEN_SHOZOKU_CD

    // 勤務先（소속명）
    private String genKinmusakiNm;   // SHOZOKU.SHOZOKU_NM

    // 郵便番号
    private String genKinmuZip;      // 신청 전: SHAIN.KINMU_ZIP_CD
                                     // 신청 후: SHINSEI.GEN_KINMU_ZIP_CD

    // 都道府県
    private String genKinmuAddress1; // 신청 전: SHAIN.KINMU_ADDRESS_1
                                     // 신청 후: SHINSEI.GEN_KINMU_ADDRESS_1

    // 所在地１
    private String genKinmuAddress2; // 신청 전: SHAIN.KINMU_ADDRESS_2
                                     // 신청 후: SHINSEI.GEN_KINMU_ADDRESS_2

    // 所在地２（건물명 등）
    private String genKinmuAddress3; // 신청 전: SHAIN.KINMU_ADDRESS_3
                                     // 신청 후: SHINSEI.GEN_KINMU_ADDRESS_3



    // ===== 日割期間 勤務地 쪽 =====
    // 勤務先コード
    private String hiwariKinmusakiCd;  // 신청 후: SHINSEI.NEW_SHOZOKU_CD

    // 勤務先（소속명）
    private String hiwariKinmusakiNm;  // SHOZOKU.SHOZOKU_NM

    // 郵便番号
    private String hiwariKinmuZip;     // 신청 후: SHINSEI.NEW_KINMU_ZIP_CD

    // 都道府県
    private String hiwariKinmuAddress1;// 신청 후: SHINSEI.NEW_KINMU_ADDRESS_1

    // 所在地１
    private String hiwariKinmuAddress2;// 신청 후: SHINSEI.NEW_KINMU_ADDRESS_2

    // 所在地２（건물명 등）
    private String hiwariKinmuAddress3;// 신청 후: SHINSEI.NEW_KINMU_ADDRESS_3
}


