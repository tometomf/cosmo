package org.cosmo.domain;

import lombok.Data;
import java.sql.Timestamp;
import java.sql.Blob; // BLOB 타입 매핑을 위한 임포트

@Data
public class IchijiHozonDTO {

	// Primary Keys (복합 키)
	private int hozonUid;           // HOZON_UID (저장 고유 ID)
	private int userUid;            // USER_UID (사용자 고유 ID/사원 UID)

	// 기본 정보
	private String shinseiKbn;      // SHINSEI_KBN (신청 구분)
	private String shozokuCd;       // SHOZOKU_CD (소속 코드)
	private Integer alertNo;        // ALERT_NO (알림 번호 - nullable NUMBER이므로 Integer)
	private Integer alertSeq;       // ALERT_SEQ (알림 순번 - nullable NUMBER이므로 Integer)
	private String actionNm;        // ACTION_NM (액션/처리 명칭)

	// 저장 데이터
	// BLOB 타입은 java.sql.Blob 또는 byte[]로 매핑할 수 있습니다.
	// byte[]가 일반적인 직렬화/역직렬화 처리에는 더 간편합니다.
	private byte[] data;            // DATA (일시 저장 데이터 - BLOB -> byte[])

	// Audit Fields (로그/감사 필드)
	private Integer addUserId;      // ADD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp addDate;      // ADD_DATE
	private Integer updUserId;      // UPD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp updDate;      // UPD_DATE
	
	// 파일 확장자용 추가 필드
	private String fileExtension;
}