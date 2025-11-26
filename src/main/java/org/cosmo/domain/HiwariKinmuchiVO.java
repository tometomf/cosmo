package org.cosmo.domain;

import lombok.Data;

/**
 * 日割勤務地 初期表示 VO
 */
@Data
public class HiwariKinmuchiVO {

    // 所属
    private String shozokuCd;     // 所属コード
    private String shozokuNm;     // 所属名

    // 現勤務地（既存：SHAIN）
    private String kinmuZipCd;    // 勤務地郵便番号
    private String kinmuPrefCd;   // 勤務地 住所（都道府県）
    private String kinmuAddress1; // 勤務地 住所（市区町村・番地）
    private String kinmuAddress2; // 勤務地 住所（建物）

    // 新勤務地（申請後のみ：SHINSEI）
    private String newKinmuAddress1; // 新勤務地 市区町村・番地
    private String newKinmuAddress2; // 新勤務地 建物

    private Long shinseiNo;       // 申請番号（申請後のみセット）
}