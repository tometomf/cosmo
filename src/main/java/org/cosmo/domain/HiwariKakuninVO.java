package org.cosmo.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKakuninVO")
public class HiwariKakuninVO {

    private Integer kigyoCd;
    
    private Integer shainUid;

    private String empNo;

    private String empName;

    private String empWorkplace;

    private String empAddress;

    private Long shinseiNo;

    private String shinseiKbn;

    private String shinseiKbnNm;

    private String shinseiRiyu;

    private String taishoKikanFrom;

    private String taishoKikanTo;

    private Integer shukkinNissuu;

    private Integer kingakuGokei;

    private List<HiwariKakuninRouteVO> routeList;

    private String uploadFileName;

    private Boolean uploadExists;
}
