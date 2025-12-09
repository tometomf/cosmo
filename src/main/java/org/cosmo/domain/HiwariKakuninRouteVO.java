package org.cosmo.domain;

import java.math.BigDecimal;          //거리 km용
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariKakuninRouteVO")
// 유지희
public class HiwariKakuninRouteVO {

    // 1. 기본 경로 정보
    private Integer keiroSeq;          // 경로순번 (1, 2) / 経路順番

    private String tsukinShudanKbn;    // 통근수단 구분코드 / 通勤手段区分
    private String tsukinShudanNm;     // 통근수단명 / 通勤手段名
    private String keiroSection;       // 경로 구간 (출발~도착) / 経路区間

    private Integer shukkinNissuu;     // 출근일수 / 出勤日数
    private Integer kataMichiRyokin;   // 편도요금 / 片道料金
    private Integer kingaku;           // 일할 금액 / 金額（日割り）
    private Integer kingakuMonthly;    // 월 기준 금액 / 金額（1ヶ月参考値）

    // 2. 특급/신칸센/유료도로 사용 여부 
    private String shinkansenRiyoKbn;  // 신칸센 이용 여부 / 新幹線利用区分
    private String tokkyuRiyoKbn;      // 특급 이용 여부 / 特急利用区分
    private String yuryoRiyoKbn;       // 유료도로 이용 여부 / 有料道路利用区分

    private String kekkaSelect;        // 선택 결과 플래그 / 結果選択フラグ

    // 3.설계서 28~30번 추가 필드

    // 28. 距離（km）
    // DB가 NUMBER(5,1) 같이 소수점 가능성이 있어서 BigDecimal 사용
    private BigDecimal shinseiKm;      // 신청 거리(km) / 申請距離（km）

    // 29. 有料道路 IC（乗り口～降り口）
    private String yuryoIcStart;       // 유료도로 IC(탑승) / 有料道路IC（乗り口）
    private String yuryoIcEnd;         // 유료도로 IC(하차) / 有料道路IC（降り口）

    // 30. 有料道路 片道料金
    private Integer yuryoKataMichiRyokin; // 유료도로 편도요금 / 有料道路片道料金
}
