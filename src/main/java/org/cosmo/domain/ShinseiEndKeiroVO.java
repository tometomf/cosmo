// 作成者 : 권예성

package org.cosmo.domain;

import lombok.Data;

@Data
public class ShinseiEndKeiroVO {
	
	private Integer kigyoCd;
    private Long shinseiNo;      // Long 으로 만듦
    private Integer keiroSeq;

    private String shinseiKbn;
    private String shinseiYmd;
    private Integer shainUid;
    private String shainNo;
    private Integer dairiShinseishaCd;
    private String tsukinShudanKbn;
    
    private String fubiUmuKbn;
    private Integer genTsukinroNo;
    private String riyoEndYmd;
    private String kikanStartYmd;
    private String kikanEndYmd;
    private Integer jitsuKinmuNissu;
    private Integer shinseiKin;
    private String jrModoshiKbn;
    private Integer modoshiKin;
    private String modoshiFileUid;

    private Integer addUserId;
    private java.sql.Timestamp addDate;
    private Integer updUserId;
    private java.sql.Timestamp updDate;

}
