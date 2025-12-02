package org.cosmo.domain;

import lombok.Builder;
import lombok.Data;

// 윤종운

@Data
@Builder
public class UploadResult {
	//요청 처리 성공/실패 여부
	private boolean success;
	// 서버에 저장된 파일의 고유 식별자 (DB PK 값)
	private String fileUid;
	// 사용자에게 보여줄 메시지 (예: "업로드 성공")
	private String message;
}
