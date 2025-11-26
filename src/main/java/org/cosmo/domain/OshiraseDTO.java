package org.cosmo.domain;

import lombok.Data;
import java.sql.Timestamp; // TIMESTAMP 타입 매핑

@Data
public class OshiraseDTO {

	// Primary Keys (복합 키)
	private int kigyoCd;            // KIGYO_CD (기업 코드)
	private int shainUid;           // SHAIN_UID (사원 고유 ID)
	private String tsuchiYmd;       // TSUCHI_YMD (통지 연월일 - CHAR(8))
	private String tsuchiHm;        // TSUCHI_HM (통지 시분 - CHAR(4))
	private Timestamp updDate;      // UPD_DATE (수정 일시 - PK에 포함됨)

	// 기본 정보
	private String shainNo;         // SHAIN_NO (사원 번호)
	private Integer tsuchishaKigyoCd; // TSUCHISHA_KIGYO_CD (통지자 기업 코드 - nullable NUMBER)
	private String tsuchishaCd;     // TSUCHISHA_CD (통지자 코드)
	private Long shinseiNo;      // SHINSEI_NO (신청 번호 - nullable NUMBER)
	private String oshiraseNaiyo;   // OSHIRASE_NAIYO (알림 내용 - CLOB -> String)
	private String kengen;          // KENGEN (권한)
	private String haishinKbn;      // HAISHIN_KBN (배신/배포 구분)

	// Audit Fields (로그/감사 필드)
	private Integer addUserId;      // ADD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp addDate;      // ADD_DATE
	private Integer updUserId;      // UPD_USER_ID (nullable NUMBER이므로 Integer)
	// private Timestamp updDate;    // UPD_DATE는 이미 Primary Key에 포함되어 있어 중복 작성하지 않습니다.
}