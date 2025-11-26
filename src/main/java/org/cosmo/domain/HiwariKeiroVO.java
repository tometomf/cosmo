package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;
//유지희
@Data
@Alias("HiwariKeiroVO")
public class HiwariKeiroVO {
    private Integer kigyoCd;       
    private Long shinseiNo;       
    private Long shainUid;      
    private Integer keiroSeq;       
    private String tsukinShudanKbn; // 통근수단 구분 (1=전철, 2=버스, 3=자동차...)
    private String startPlace;      // 출발지
    private String endPlace;        // 도착지
    private String kekkaSelect;     
    private String tsukinShudanNm;  // 통근수단명
    
    // ★★★ 추가: 경유지 필드 (이미지처럼 상세 경로 표시하려면 필수!) ★★★
    private String viaPlace1;       // 경유지1
    private String viaPlace2;       // 경유지2
    private String viaPlace3;       // 경유지3
    private String viaPlace4;       // 경유지4
    private String viaPlace5;       // 경유지5
}