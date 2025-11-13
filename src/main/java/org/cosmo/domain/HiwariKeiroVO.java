package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKeiroVO")
public class HiwariKeiroVO {

    private int keiroSeq;          
    private String tsukinShudanNm;  
    private String startPlace;      
    private String endPlace;      
    private String kekkaSelect;     
}
