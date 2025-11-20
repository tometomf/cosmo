package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKeiroVO")
public class HiwariKeiroVO {

    private Integer kigyoCd;       
    private Long shinseiNo;       
    private Integer shainUid;      
    private Integer keiroSeq;       

    private String tsukinShudanKbn;
    private String startPlace;     
    private String endPlace;      
    private String kekkaSelect;     

    private String tsukinShudanNm;  
}
