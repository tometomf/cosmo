package org.cosmo.domain;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class KigyoKiteiDTO {

	// PK
	private int kigyoCd;            // KIGYO_CD (기업 코드)
	private String komokuSybtsu;    // KOMOKU_SYBTSU (항목 구분 - CHAR(3))
	private String code;            // CODE (코드 - CHAR(4))
	private int nengetsu;           // NENGETSU (적용 연월 - NUMBER)

	// 기본 설정 정보
	private int dispNum;            // DISP_NUM (표시 순번)
	private String writableFlg;     // WRITABLE_FLG (쓰기 가능 플래그)
	private String setNaiyo;        // SET_NAIYO (설정 내용)
	private String meisyo;          // MEISYO (명칭)
	private Integer setSu;          // SET_SU (설정 수 - nullable NUMBER이므로 Integer)

	// 규정 상세 값 (범용 필드)
	private String kitei1;          // KITEI1 (규정 1)
	private String kitei2;          // KITEI2 (규정 2)
	private String kitei3;          // KITEI3 (규정 3)
	private String kitei4;          // KITEI4 (규정 4)
	private String kitei5;          // KITEI5 (규정 5)
	private String kitei6;          // KITEI6 (규정 6)
	private String kitei7;          // KITEI7 (규정 7)
	private String kitei8;          // KITEI8 (규정 8)
	private String kitei9;          // KITEI9 (규정 9)
	private String kitei10;         // KITEI10 (규정 10)
	private String biko;            // BIKO (비고)

	// Audit Fields (로그/감사 필드)
	private Integer addUserId;      // ADD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp addDate;      // ADD_DATE
	private Integer updUserId;      // UPD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp updDate;      // UPD_DATE
}