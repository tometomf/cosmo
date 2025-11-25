package org.cosmo.domain;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKakuninRouteVO")
//유지희
public class HiwariKakuninRouteVO {
    // 경로 순번
    private Integer keiroSeq;          // 경로순번 (1, 2)
    
  
    private String tsukinShudanKbn;    // 通勤手段区分 (통근수단 코드)
    private String tsukinShudanNm;     // 通勤手段名 (통근수단 명칭) 👈 추가
    private String keiroSection;       // 経路区間 (경로) 👈 추가
    private Integer shukkinNissuu;     // 出勤日数 (출근일수)
    private Integer kataMichiRyokin;   // 片道料金 (편도요금)
    private Integer kingaku;           // 金額 (금액)
    private Integer kingakuMonthly;    // 金額（1ヶ月参考値）(월금액)
}