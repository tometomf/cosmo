package org.cosmo.domain;

import lombok.Data;

@Data
public class ShinseiShoruiVO {

	private String kigyoCd;
	private String shinseiNo;
	private String keiroSeq;
	private String manryoYmd;
	private String taijin;
	private String taibutsu;
	private String jinshin;
	private String tojosha;
	private String tokyu;

	private String shinseiKbn;
	private String shinseiYmd;
	private Long shainUid;
	private String shainNo;
	private Integer dairiShinseishaCd;
	private String tsukinShudanKbn;

	private Long fileUid1;
	private Long fileUid2;
	private Long fileUid3;
	private Long fileUid4;
	private Long fileUid5;

	private String menkyoYukoKigen;
	private String menkyoNo;

	private String shashu;
	private String torokuNo;
	private Integer haikiryo;
	private String shakenYukoKigen;
	private java.math.BigDecimal nenpi;

	private String hokenManryoYmd;
	private String taijinBaisho;
	private String taibutsuBaisho;
	private String jinshinShogai;
	private String tojoshaShogai;

	private String firstTeikiKikan;
	private String nextTeikiKikan;

	private Long addUserId;
	private String addDate;
	private Long updUserId;
	private String updDate;

	private Long etcFileUid1;
	private Long etcFileUid2;
	private Long etcFileUid3;
	private Long etcFileUid4;
	private Long etcFileUid5;

	private String etcComment1;
	private String etcComment2;
	private String etcComment3;
	private String etcComment4;
	private String etcComment5;

}
