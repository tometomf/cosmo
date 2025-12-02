package org.cosmo.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ShainFuzuiShoruiVO implements Serializable{

	private Integer kigyo_Cd;
	private Integer shain_Uid;
	private String shain_No;
	private String menkyo_Yuko_Kigen;
	private String menkyo_No;
	private String shashu;
	private String toroku_No;
	private Integer haikiryo;
	private String shaken_Yuko_Kigen;
	private String hoken_Manryo_Ymd;
	private String taijin_Baisho;
	private String taibutsu_Baisho;
	private String jinshin_Shogai;
	private String tojosha_Shogai;
	private Integer tokyu;
	private Long file_Uid_1;
	private Long file_Uid_2;
	private Long file_Uid_3;
	private Long file_Uid_4;
	private Long file_Uid_5;
	private Long file_Uid_6;
	private Long file_Uid_7;
	private Long etc_File_Uid_1;
	private Long etc_File_Uid_2;
	private Long etc_File_Uid_3;
	private Long etc_File_Uid_4;
	private Long etc_File_Uid_5;
	private String etc_Comment_1;
	private String etc_Comment_2;
	private String etc_Comment_3;
	private String etc_Comment_4;
	private String etc_Comment_5;
	private String add_User_Id;
	private String add_Date;
	private String upd_User_Id;
	private String upd_Date;
	
	
}
