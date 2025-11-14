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
	
	private String shudanName;
	
	
	public Long getYuryo(){
		return katamichi * (jitsu * 2);
	}
}
