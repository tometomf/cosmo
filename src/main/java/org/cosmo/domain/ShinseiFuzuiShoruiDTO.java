package org.cosmo.domain;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class ShinseiFuzuiShoruiDTO {

	// PK
	private int kigyoCd;            // KIGYO_CD (기업 코드)
	private int shinseiNo;          // SHINSEI_NO (신청 번호)
	private int keiroSeq;           // KEIRO_SEQ (경로 순번)

	// 신청/사원 기본 정보 (신청 테이블에서 복제된 값으로 보임)
	private String shinseiKbn;      // SHINSEI_KBN (신청 구분)
	private String shinseiYmd;      // SHINSEI_YMD (신청 연월일)
	private Integer shainUid;       // SHAIN_UID (사원 고유 ID - nullable)
	private String shainNo;         // SHAIN_NO (사원 번호)
	private Integer dairiShinseishaCd; // DAIRI_SHINSEISHA_CD (대리 신청자 코드 - nullable)
	private String tsukinShudanKbn; // TSUKIN_SHUDAN_KBN (통근 수단 구분)

	// 첨부 파일 관련 정보
	private Integer fileUid1;       // FILE_UID_1 (파일 UID 1 - nullable)
	private Integer fileUid2;       // FILE_UID_2
	private Integer fileUid3;       // FILE_UID_3
	private Integer fileUid4;       // FILE_UID_4
	private Integer fileUid5;       // FILE_UID_5

	// 운전 면허 및 차량 정보
	private String menkyoYukoKigen; // MENKYO_YUKO_KIGEN (면허 유효 기한)
	private String menkyoNo;        // MENKYO_NO (면허 번호)
	private String shashu;          // SHASHU (차종)
	private String torokuNo;        // TOROKU_NO (등록 번호/차량 번호)
	private Integer haikiryo;       // HAIKIRYO (배기량 - nullable NUMBER)
	private String shakenYukoKigen; // SHAKEN_YUKO_KIGEN (차량 검사 유효 기한)
	private Double nenpi;           // NENPI (연비 - NUMBER(3, 1)이므로 Double)

	// 보험 정보
	private String hokenManryoYmd;  // HOKEN_MANRYO_YMD (보험 만료 연월일)
	private String taijinBaisho;    // TAIJIN_BAISHO (대인 배상)
	private String taibutsuBaisho;  // TAIBUTSU_BAISHO (대물 배상)
	private String jinshinShogai;   // JINSHIN_SHOGAI (자손/인신 상해)
	private String tojoshaShogai;   // TOJOSHA_SHOGAI (탑승자 상해)
	private Integer tokyu;          // TOKYU (보험 등급 - nullable NUMBER)

	// 기타 정보
	private String firstTeikiKikan; // FIRST_TEIKI_KIKAN (최초 정기 기간)
	private String nextTeikiKikan;  // NEXT_TEIKI_KIKAN (다음 정기 기간)

	// Audit Fields (로그/감사 필드)
	private Integer addUserId;      // ADD_USER_ID
	private Timestamp addDate;      // ADD_DATE
	private Integer updUserId;      // UPD_USER_ID
	private Timestamp updDate;      // UPD_DATE
}