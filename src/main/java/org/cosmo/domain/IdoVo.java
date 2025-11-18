package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoVo {

	private String kinmu_Cd; // 기업코드
	private String Zyuusyo_Nm; // 기업명

	public IdoVo(String kinmu_Cd, String Zyuusyo_Nm) {

		this.kinmu_Cd = kinmu_Cd;
		this.Zyuusyo_Nm = Zyuusyo_Nm;
	}
}