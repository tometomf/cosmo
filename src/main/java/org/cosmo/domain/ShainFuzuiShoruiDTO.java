package org.cosmo.domain;

import java.sql.Timestamp;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

/**
 * SHAIN_FUZUI_SHORUI 테이블의 DTO (사원 부수 서류 정보)
 */
@Data // Getter, Setter, ToString, Equals, HashCode 자동 생성
@NoArgsConstructor // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 포함하는 생성자 자동 생성
public class ShainFuzuiShoruiDTO {

	// 1. Primary Key 및 기본 정보
	private int kigyoCd;        // KIGYO_CD (기업 코드)
	private Integer shainUid;       // SHAIN_UID (사원 UID) nullable
	private String shainNo;         // SHAIN_NO (사원 번호)
	private Integer dairiShinseishaCd; // DAIRI_SHINSEISHA_CD (대리 신청자 코드) nullable
	private String tsukinShudanKbn; // TSUKIN_SHUDAN_KBN (통근 수단 구분)

	// 2. 파일 정보
	// 파일 참조 UID (FILE_UID_1 ~ 7)
	private Long fileUid1;
	private Long fileUid2;
	private Long fileUid3;
	private Long fileUid4;
	private Long fileUid5;
	private Long fileUid6;
	private Long fileUid7;
	// 기타 파일 참조 UID (ETC_FILE_UID_1 ~ 5)
	private Long etcFileUid1;
	private Long etcFileUid2;
	private Long etcFileUid3;
	private Long etcFileUid4;
	private Long etcFileUid5;

	// 3. 기타 코멘트 (CLOB 타입은 String으로 매핑)
	private String etcComment1; // ETC_COMMENT_1
	private String etcComment2; // ETC_COMMENT_2
	private String etcComment3; // ETC_COMMENT_3
	private String etcComment4; // ETC_COMMENT_4
	private String etcComment5; // ETC_COMMENT_5

	// 4. 운전 면허 및 차량 정보
	private String menkyoYukoKigen; // MENKYO_YUKO_KIGEN (면허 유효 기한)
	private String menkyoNo;        // MENKYO_NO (면허 번호)
	private String shashu;          // SHASHU (차종)
	private String torokuNo;        // TOROKU_NO (등록 번호)
	private Integer haikiryo;       // HAIKIRYO (배기량) nullable
	private String shakenYukoKigen; // SHAKEN_YUKO_KIGEN (차량 검사 유효 기한)
	private Double nenpi;           // NENPI (연비 - NUMBER(3, 1)이므로 Double 사용)

	// 5. 보험 정보
	private String hokenManryoYmd;   // HOKEN_MANRYO_YMD (보험 만료 일자)
	private String taijinBaisho;    // TAIJIN_BAISHO (대인 배상)
	private String taibutsuBaisho;  // TAIBUTSU_BAISHO (대물 배상)
	private String jinshinShogai;   // JINSHIN_SHOGAI (인신 상해)
	private String tojoshaShogai;   // TOJOSHA_SHOGAI (탑승자 상해)
	private Integer tokyu;          // TOKYU (보험 등급) nullable

	// 6. 정기권 정보
	private String firstTeikiKikan; // FIRST_TEIKI_KIKAN (첫 정기 기간)
	private String nextTeikiKikan;  // NEXT_TEIKI_KIKAN (다음 정기 기간)

	// 7. 감사 (Audit) 필드
	private Integer addUserId;      // ADD_USER_ID (등록 사용자 ID) nullable
	private Timestamp addDate;      // ADD_DATE (등록 일시)
	private Integer updUserId;      // UPD_USER_ID (갱신 사용자 ID) nullable
	private Timestamp updDate;      // UPD_DATE (갱신 일시)
}