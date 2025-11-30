package org.cosmo.domain;

import lombok.Data;

@Data
public class ShainVO {
	
	private String kigyo_Cd;
	private String kigyo_Nm;
	private String shain_Uid;
	private String shain_No;
	private String shain_Nm;
	private String jigyosho_cd;
	private String jigyosho_Nm;
	private String shozoku_Cd;
	private String shozoku_Nm;
	
	// 신청정보용
	private String shinsei_No;
	private String shinsei_Ymd;
	private String shinchoku_kbn;
	
	private String address1;
	private String address2;
	private String address3;
	private String kinmuAddress1;
	private String kinmuAddress2;
	private String kinmuAddress3;
}
