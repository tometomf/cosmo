package org.cosmo.domain;

import lombok.Data;

@Data
public class IchijiHozonVO {
    // DB 컬럼명 HOZON_ID에 맞춰서 변수명 변경
    private Long hozonId;        // 기존 String uid -> Long hozonId (시퀀스 쓰므로 Long/int 권장)
    
    private String userUid;      // USER_UID
    private String shinseiKbn;
    private String shozokuCd;
    private String actionNm;     // ACTION_NM
    private String data;         // DATA (CLOB)
    private String addUserId;
    private String updUserId;
}