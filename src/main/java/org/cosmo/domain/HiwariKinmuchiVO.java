package org.cosmo.domain;

import lombok.Data;

@Data
public class HiwariKinmuchiVO {

    // ===========================
    // 申請前の所属情報
    // ===========================
    private String beforeShozokuCd;   // 申請前）社員M．所属コード
    private String beforeShozokuNm;   // 申請前）所属M．所属名

    // ===========================
    // 申請後の所属情報
    // ===========================
    private String afterShozokuCd;    // 申請後）申請T．現所属コード
    private String afterShozokuNm;    // 申請後）所属M．所属名

    // ===========================
    // 既存フィールド（勤務地・住所関連）
    // ===========================
    private String shozokuCd;         // 所属コード
    private String shozokuNm;         // 所属名

    private String kinmuZipCd;        // 現勤務地：郵便番号
    private String kinmuPrefCd;       // 現勤務地：都道府県コード
    private String kinmuAddress1;     // 現勤務地：住所1
    private String kinmuAddress2;     // 現勤務地：住所2

    private String newKinmuAddress1;  // 日割期間勤務地：住所1
    private String newKinmuAddress2;  // 日割期間勤務地：住所2

    private Long shinseiNo;           // 申請番号
}