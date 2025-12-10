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
    
    private String viaPlace1;       // 경유지1
    private String viaPlace2;       // 경유지2
    private String viaPlace3;       // 경유지3
    private String viaPlace4;       // 경유지4
    private String viaPlace5;       // 경유지5

    private String kikanStartYmd;     // KIKAN_START_YMD
    private String kikanEndYmd;       // KIKAN_END_YMD
    private Integer shukkinNissuu;    // JITSU_KINMU_NISSU
    private Integer kataMichiKin;     // KATAMICHI_KIN
    private Integer shinseiKin;       // SHINSEI_KIN (정기권 금액 등)
    private Integer firstTeikiTsukiSu; // FIRST_TEIKI_TSUKI_SU (支給単位: 1/3/6)
    private Integer tsukiShikyuKin;   // TSUKI_SHIKYU_KIN (월액)
    private Integer hiwariAto;        // HIWARI_ATO (일할 금액 총액)
    private Integer shinseiKm;        // 申請距離(km)
    private String yuryoIcStart; // 有料道路IC 乗り口
    private String yuryoIcEnd;   // 有料道路IC 降り口
    private Integer yuryoKataMichiRyokin;
   }