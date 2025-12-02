package org.cosmo.domain;

import java.math.BigDecimal;
import java.util.List;

import lombok.Data;

//하나
@Data
public class ShinseiKeiroVO {
	private String kigyoCd;
	private String shinseiNo;
	private Long keiroSeq;

	private String shinseiKbn;
	private String shinseiYmd;
	private String tsukinShudan;

	private BigDecimal shinseiKm;
	private Long tsuki;
	private String firstShikyuYmd;

	private String startPlace;
	private String endPlace;
	private String viaPlace1;
	private String viaPlace2;
	private String viaPlace3;
	private String viaPlace4;
	private String viaPlace5;
	
	private Long katamichi;
	private Long jitsu;
    private Integer firstTeikiTsukiSu;
    private Integer nextTeikiTsukiSu;

    private String idoShudanEtcNm;
	private String busCorpNm;
    private Integer sanshoTeikiKin1;

	private String shudanName;
	
    private List<ShinseiShoruiVO> shoruiList;

	public Long getYuryo() {

		Long safeKatamichi = (katamichi == null ? 0L : katamichi);
		Long safeJitsu = (jitsu == null ? 0L : jitsu);

		return safeKatamichi * (safeJitsu * 2);
	}

	public Long getTsuki() {
		return tsuki == null ? 0L : tsuki;
	}

	public BigDecimal getShinseiKm() {
		return shinseiKm == null ? BigDecimal.ZERO : shinseiKm;
	}

	public Long getTotal() {
		return getTsuki() + getYuryo();
	}
	
	public String getCircleNumber() {
	    int base = 9311; 
	    int seq = (this.keiroSeq != null) ? this.keiroSeq.intValue() : 1;
	    return new String(Character.toChars(base + seq));
	}


}
