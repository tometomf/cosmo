// 作成者 : 권예성

package org.cosmo.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlertVO {
    // PK
    private Integer kigyoCd;
    private String shainNo;
    private Long alertNo;        // ★ 자동 채번 대상 (Long 권장)
    private Long alertSeq;       // ★ 순번 (Long 권장)

    // 데이터 컬럼
    private Integer shainUid;
    private String kanriId;
    private String shainNm;
    private String mailAddr;
    private String haishinKbn;
    private String haishinRiyu;
    private String keyYmd;
    
    private String syoruiKigenMenkyo;
    private String syoruiKigenShaken;
    private String syoruiKigenHoken;
    
    private String haishinHindo;
    private String shinseiYohi;
    private String haishinKaishiYmd;
    private String haishinSyuryoYmd;
    private String jikaiHaishinYmd;
    private String haishinKaisuu;
    
    private String shinseiTitle;
    private String shinseiShosai; // CLOB -> String
    
    private Long shinseiNo;       // ★ 신청 번호 연결용
    private String shinseiYmd;
    private String kigyoShoninYmd;
    private String llShoninYmd;

    // Audit
    private Integer addUserId;
    private Timestamp addDate;
    private Integer updUserId;
    private Timestamp updDate;
}