package org.cosmo.domain;

import java.math.BigDecimal;

import lombok.Data;

//제교
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


    private String firstTeikiKikan;
	private String nextTeikiKikan;
	
	private String sanshoTeikiTsukiSu1;
	private String sanshoTeikiTsukiSu2;
	private String sanshoTeikiTsukiSu3;
	
	private String sanshoTeikiKin1;
	private String sanshoTeikiKin2;
	private String sanshoTeikiKin3;
	
	

}
