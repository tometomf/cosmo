package org.cosmo.domain;

import lombok.Data;

@Data
public class ShainVO {
	
	public ShainVO(String kigyo_Cd, String kigyo_Nm, String shain_Uid, String shain_No, String shain_Nm) {
		this.kigyo_Cd = kigyo_Cd;
		this.kigyo_Nm = kigyo_Nm;
		this.shain_Uid = shain_Uid;
		this.shain_No = shain_No;
		this.shain_Nm = shain_Nm;
	}
	
	private String kigyo_Cd;
	private String kigyo_Nm;
	private String shain_Uid;
	private String shain_No;
	private String shain_Nm;
}
