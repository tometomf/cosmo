package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKeiroVO")
public class HiwariKeiroVO {

    private Integer kigyoCd;        // KIGYO_CD
    private Long shinseiNo;         // SHINSEI_NO

    private Integer shainUid;       // SHAIN_UID 
    private int keiroSeq;           // KEIRO_SEQ 

    private String tsukinShudanKbn; // TSUKIN_SHUDAN_KBN
    private String startPlace;      // START_PLACE
    private String endPlace;        // END_PLACE
    private String kekkaSelect;     // KEKKA_SELECT

    private String tsukinShudanNm;  // CODE.CODE_NM (조회용)
}
