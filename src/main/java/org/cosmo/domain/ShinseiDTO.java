package org.cosmo.domain;

import java.sql.Timestamp;

import lombok.Data;

//제교
@Data
public class ShinseiDTO {
	
	// PK
	private int kigyoCd; // KIGYO_CD (기업 코드)
	private int shinseiNo; // SHINSEI_NO (신청 번호)
	
	// 신청 기본 정보
	private String shinseiKbn; // SHINSEI_KBN (신청 구분)
	private String shinseiYmd; // SHINSEI_YMD (신청 연월일)
	private String shinseiRiyu; // SHINSEI_RIYU (신청 사유 - CLOB)
	private String tokuShinseiRiyu; // TOKU_SHINSEI_RIYU (특례 신청 사유 - CLOB)
	private Integer shainUid; // SHAIN_UID (사원 고유 ID)
	private String shainNo; // SHAIN_NO (사원 번호)
	private Integer dairiShinseishaCd; // DAIRI_SHINSEISHA_CD (대리 신청자 코드)
	private String shinchokuKbn; // SHINCHOKU_KBN (신청 진행 구분)
	private String genTsukinroEndKbn; // GEN_TSUKINRO_END_KBN (기존 통근로 종료 구분)
	
	// 변경/이동 정보 (주소 및 근무지)
	private String addressChgKbn; // ADDRESS_CHG_KBN (주소 변경 구분)
	private String kinmuAddressChgKbn; // KINMU_ADDRESS_CHG_KBN (근무지 주소 변경 구분)
	private String kyushokuHukkiKbn; // KYUSHOKU_HUKKI_KBN (휴직/복직 구분)
	
	// 현재 주소/소속
	private String genShozokuCd; // GEN_SHOZOKU_CD (현 소속 코드)
	private String genZipCd; // GEN_ZIP_CD (현 우편번호)
	private String genAddress1; // GEN_ADDRESS_1 (현 주소 1)
	private String genAddress2; // GEN_ADDRESS_2 (현 주소 2)
	private String genAddress3; // GEN_ADDRESS_3 (현 주소 3)
	
	// 신규 주소/소속
	private String newShozokuCd; // NEW_SHOZOKU_CD (신규 소속 코드)
	private String newZipCd; // NEW_ZIP_CD (신규 우편번호)
	private String newAddress1; // NEW_ADDRESS_1 (신규 주소 1)
	private String newAddress2; // NEW_ADDRESS_2 (신규 주소 2)
	private String newAddress3; // NEW_ADDRESS_3 (신규 주소 3)
	private String addressIdoKeido; // ADDRESS_IDO_KEIDO (주소 위도/경도)
	private String addressCorrect; // ADDRESS_CORRECT (주소 보정 여부)
	
	// 현재 근무지 주소
	private String genKinmuZipCd; // GEN_KINMU_ZIP_CD (현 근무지 우편번호)
	private String genKinmuAddress1; // GEN_KINMU_ADDRESS_1 (현 근무지 주소 1)
	private String genKinmuAddress2; // GEN_KINMU_ADDRESS_2 (현 근무지 주소 2)
	private String genKinmuAddress3; // GEN_KINMU_ADDRESS_3 (현 근무지 주소 3)
	private String genKinmuPrefCd; // GEN_KINMU_PREF_CD (현 근무지 현/도 코드)
	
	// 신규 근무지 주소
	private String newKinmuZipCd; // NEW_KINMU_ZIP_CD (신규 근무지 우편번호)
	private String newKinmuAddress1; // NEW_KINMU_ADDRESS_1 (신규 근무지 주소 1)
	private String newKinmuAddress2; // NEW_KINMU_ADDRESS_2 (신규 근무지 주소 2)
	private String newKinmuAddress3; // NEW_KINMU_ADDRESS_3 (신규 근무지 주소 3)
	private String kinmuAddressIdoKeido; // KINMU_ADDRESS_IDO_KEIDO (근무지 주소 위도/경도)
	private String kinmuAddressCorrect; // KINMU_ADDRESS_CORRECT (근무지 주소 보정 여부)
	private String newKinmuPrefCd; // NEW_KINMU_PREF_CD (신규 근무지 현/도 코드)
	private String jutakuKbn; // JUTAKU_KBN (주택 구분)
	
	// 부속 정보 (첨부 파일 및 코멘트)
	private Integer etcFileUid1; // ETC_FILE_UID_1
	private Integer etcFileUid2; // ETC_FILE_UID_2
	private Integer etcFileUid3; // ETC_FILE_UID_3
	private Integer etcFileUid4; // ETC_FILE_UID_4
	private Integer etcFileUid5; // ETC_FILE_UID_5
	private String etcComment1; // ETC_COMMENT_1 (CLOB)
	private String etcComment2; // ETC_COMMENT_2 (CLOB)
	private String etcComment3; // ETC_COMMENT_3 (CLOB)
	private String etcComment4; // ETC_COMMENT_4 (CLOB)
	private String etcComment5; // ETC_COMMENT_5 (CLOB)
	
	// 날짜/상태 정보
	private String riyoStartYmd; // RIYO_START_YMD (이용 시작 연월일)
	private String riyoEndYmd; // RIYO_END_YMD (이용 종료 연월일)
	private String shikyTeishiKbn; // SHIKYU_TEISHI_KBN (지급 정지 구분)
	private String kanriId; // KANRIID (관리 ID)
	private String idoYmd; // IDO_YMD (이동 연월일)
	private String itenYmd; // ITEN_YMD (이전 연월일)
	private String tennyuYmd; // TENNYU_YMD (전입 연월일)
	private String haishinYmd; // HAISHIN_YMD (배신 연월일)
	private String keiroHenkoYmd; // KEIRO_HENKO_YMD (경로 변경 연월일)
	private String firstShinseiYmd; // FIRST_SHINSEI_YMD (최초 신청 연월일)
	private String kigyoShoninYmd; // KIGYO_SHONIN_YMD (기업 승인 연월일)
	private String llShoninYmd; // LL_SHONIN_YMD (LL 승인 연월일)
	private Integer tsukinroNo; // TSUKINRO_NO (통근로 번호)
	private String sashimodoshiYmd; // SASHIMODOSHI_YMD (반려 연월일)
	private String shinseiKigenYmd; // SHINSEI_KIGEN_YMD (신청 기한 연월일)
	private String moshiokuriComment; // MOSHIOKURI_COMMENT (인수인계 코멘트 - CLOB)
	private String biboComment; // BIBO_COMMENT (비고 코멘트 - CLOB)
	private String alertUmu; // ALERT_UMU (알림 유무)
	private String torikeshiYmd; // TORIKESHI_YMD (취소 연월일)
	private String torikeshiRiyu; // TORIKESHI_RIYU (취소 사유 - CLOB)
	private String ichijiHozonId; // ICHIJI_HOZON_ID (일시 저장 ID)
	private Double jitsuKm; // JITSU_KM (실제 KM - NUMBER(4, 1)이므로 Double)
	private Integer navitimeViewCnt; // NAVITIME_VIEW_CNT (NaviTime 조회 횟수)
	
	// Audit Fields (로그/감사 필드)
	private Integer addUserId; // ADD_USER_ID
	private Timestamp addDate; // ADD_DATE
	private Integer updUserId; // UPD_USER_ID
	private Timestamp updDate; // UPD_DATE
	
}