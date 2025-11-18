package org.cosmo.domain;

import lombok.Data;
import java.sql.Timestamp; // TIMESTAMP 타입 매핑

@Data
public class ProcessLogDTO {

	// Primary Keys (복합 키)
	// PK에 Timestamp가 포함되어 있어, 객체의 동일성 판단에 사용됨
	private Timestamp processTimestamp; // PROCESS_TIMESTAMP (프로세스 발생 시간)
	private String subsystemId;        // SUBSYSTEM_ID (서브시스템 ID)
	private String processCol;         // PROCESS_COL (프로세스/액션 명칭 - 원래 PROCESS였음)

	// 로그 상세 정보
	private String key1;               // KEY1 (조회/식별 키 1)
	private String key2;               // KEY2 (조회/식별 키 2)
	private String key3;               // KEY3 (조회/식별 키 3)
	private String key4;               // KEY4 (조회/식별 키 4)
	private String key5;               // KEY5 (조회/식별 키 5)
	private String data;               // DATA (로그 데이터 본문 - CLOB -> String)
	private Integer userUid;           // USER_UID (로그를 발생시킨 사용자 UID - nullable NUMBER이므로 Integer)
	private String userTrack;          // USER_TRACK (사용자 추적 정보/세션 정보 등)

	// Audit Fields (로그 테이블이므로 ADD/UPD 필드는 중복될 수 있음)
	// 로그 테이블은 보통 PROCESS_TIMESTAMP 외의 ADD/UPD 필드를 생략하는 경우도 있지만,
	// 정의된 컬럼을 그대로 DTO에 반영합니다.
	private Integer addUserId;         // ADD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp addDate;         // ADD_DATE
	private Integer updUserId;         // UPD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp updDate;         // UPD_DATE
}