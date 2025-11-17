package org.cosmo.domain;

import lombok.Data;

@Data
public class ShainVO {
	
	private String kigyo_Cd;
	private String kigyo_Nm;
	private String shain_Uid;
	private String shain_No;
	private String shain_Nm;
	
	// 신청정보용
	private String shinsei_No;
	private String shinsei_Ymd;
	private String shozoku_Nm;
	private String shinchoku_kbn;
}
