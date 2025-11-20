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
	private String seq;
	private String shinsei_No;
	private String shinsei_Naiyou;
	private String shinsei_Ymd;
	private String ll_Shonin_Ymd;
	private String first_Shikyu_Ymd;
	private String jutaku_Kbn;	
	private String shinchoku_Kbn;
	private String shinchoku_Kbnnm;
}