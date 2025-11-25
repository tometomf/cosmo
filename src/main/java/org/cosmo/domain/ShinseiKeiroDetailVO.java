package org.cosmo.domain;

import java.math.BigDecimal;

import lombok.Data;


@Data
public class ShinseiKeiroDetailVO {
    private Long kigyoCd;
    private Long shinseiNo;
    private Integer keiroSeq;

    private String tsukinShudanKbn; // 통근수단 코드
    private String shudanName;      // 통근수단 이름(CODE 테이블에서 조인)

    private String startPlace;      // START_PLACE
    private String endPlace;        // END_PLACE

    private BigDecimal shinseiKm;   // SHINSEI_KM

    private BigDecimal katamichi;   // YURYO_KATAMICHI_KIN or KATAMICHI_KIN
    private BigDecimal tsuki;       // TSUKI_SHIKYU_KIN

    private String yuryoIcS;        // YURYO_IC_S
    private String yuryoIcE;        // YURYO_IC_E

    // 버스/전철용 정기권 정보
    private Integer sanshoTeikiTsukiSu1; // SANSHO_TEIKI_TSUKI_SU_1
    private Integer sanshoTeikiTsukiSu2;
    private Integer sanshoTeikiTsukiSu3;
    private BigDecimal sanshoTeikiKin1;  // SANSHO_TEIKI_KIN_1
    private BigDecimal sanshoTeikiKin2;
    private BigDecimal sanshoTeikiKin3;

}
