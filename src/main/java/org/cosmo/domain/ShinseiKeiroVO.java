package org.cosmo.domain;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class ShinseiKeiroVO {
	private String kigyoCd;
	private String shinseiNo;
	private String keiroSeq;
	private String tsukinShudan;
	private Long katamichi;
	private Long jitsu;
	private Long tsuki;
	private BigDecimal shinseiKm;

	private String startPlace;
	private String endPlace;
    private String viaPlace1;
    private String viaPlace2;
    private String viaPlace3;
    private String viaPlace4;
    private String viaPlace5;

	private String shudanName;

	public Long getYuryo() {

		Long safeKatamichi = (katamichi == null ? 0L : katamichi);
		Long safeJitsu = (jitsu == null ? 0L : jitsu);

		return safeKatamichi * (safeJitsu * 2);
	}

	// 임시저장 데이터에서 null 발생 방지
	public Long getTsuki() {
		return tsuki == null ? 0L : tsuki;
	}

	public BigDecimal getShinseiKm() {
		return shinseiKm == null ? BigDecimal.ZERO : shinseiKm;
	}
}
