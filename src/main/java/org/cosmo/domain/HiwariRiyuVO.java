package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariRiyuVO") //서혜원
public class HiwariRiyuVO {


    private String shinseiriyu;         
    private String shinseigigan1;    
    private String shinseigigan2;    
    private String shukkinnissu;    

    
}