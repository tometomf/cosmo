package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKakuninRouteVO")
public class HiwariKakuninRouteVO {

    private Integer keiroSeq;

    private String tsukinShudanKbn;

    private String tsukinShudanNm;

    private String keiroSection;

    private Integer shukkinNissuu;

    private Integer kataMichiRyokin;

    private Integer kingaku;

    private Integer kingakuMonthly;
}
