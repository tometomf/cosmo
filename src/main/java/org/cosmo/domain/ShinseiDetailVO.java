package org.cosmo.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShinseiDetailVO {


	private Long shinseiNo;
	private String shinchokuKbn;
	private String joutaiName;
	private String shinseiYmd;
	private String sashimodoshiYmd;
	private Date saishinseiDate;
	private Date shoninDate;
	private Date shikyuuKaishiDate;
	private String honninComment;
	private String shinseiKbn;
	private String tsukinShudanKbn;


	private String genAddress;
	private String newAddress;

	private String shozokuBeforeNm;
	private String shozokuAfterNm;

	private String kinmuchiBefore;
	private String kinmuchiAfter;


	private String genShozokuCd;
	private String newShozokuCd;

	private String genAddress1;
	private String genAddress2;
	private String genAddress3;
	private String newZipCd;
	private String newAddress1;
	private String newAddress2;
	private String newAddress3;

	private String genKinmuAddress1;
	private String genKinmuAddress2;
	private String genKinmuAddress3;
	private String newKinmuAddress1;
	private String newKinmuAddress2;
	private String newKinmuAddress3;


	private String tsukinShudanName;
	private String keiro;

	private BigDecimal kyori;
	private BigDecimal kingakuMonth;
	private BigDecimal yuryodouroMonth;

	private String fuzuiFileTitle;
	private Date hokenManryoDate;

	private String taijinBaisho;
	private String taibutsuBaisho;
	private String jinshinShogai;
	private String tojoshaShogai;
	private Integer tokyu;


	private String shinseiKbnName;
	private String shinseiRiyu;
	private Date idouDate;
	private Date tennyuDate;
	private Date kaishiDate;


	private String keiroHenkoYmd;
	private String itenYmd;
	private String ssmdsYmd;
	private String shinseiKigenYmd;
	private String moComment;
	private String torikeshiYmd;
	private String riyoStartYmd;
	private String idoYmd;
	private String tennyuYmd;

	private String etcFileTitle;

	private List<ShinseiKeiroDetailVO> keiroList;

	private Long kigyoCd;

	private Integer keiroSeq;

	private String shudanName;

	private String startPlace;
	private String endPlace;

	private BigDecimal shinseiKm;

	private BigDecimal katamichi;
	private BigDecimal tsuki;

	private String yuryoIcS;
	private String yuryoIcE;

	private String firstTeikiKikan;
	private String nextTeikiKikan;

	private String sanshoTeikiTsukiSu1;
	private String sanshoTeikiTsukiSu2;
	private String sanshoTeikiTsukiSu3;

	private String sanshoTeikiKin1;
	private String sanshoTeikiKin2;
	private String sanshoTeikiKin3;

	private Integer shainUid;
	private String shainNo;
	private Integer dairiShinseishaCd;

	private String yuryoTokurei;
	private String kyoriKagenTokurei;
	private String jougenKingakuTokurei;
	private String jougenCut;
	private String fubiUmuKbn;

	private String kikanStartYmd;
	private String kikanEndYmd;
	private Integer jitsuKinmuNissu;

	private String busCorpNm;
	private String idoShudanKbn;
	private String idoShudanEtcNm;

	private String viaPlace1;
	private String viaPlace2;
	private String viaPlace3;
	private String viaPlace4;
	private String viaPlace5;

	private String startIdoKeido;
	private String startEkicd;
	private String endEkicd;
	private String viaPlaceEkicd1;
	private String viaPlaceEkicd2;
	private String viaPlaceEkicd3;
	private String viaPlaceEkicd4;
	private String viaPlaceEkicd5;

	private String kekkaUrl;

	private Integer shinseiKin;
	private Integer firstTeikiTsukiSu;
	private String firstShikyuYmd;
	private Integer firstShikyuKin;
	private Integer nextTeikiTsukiSu;
	private Integer regularShikyuKin;
	private Integer tsukiShikyuKin;
	private Integer katamichiKin;

	private String shinkansenRiyoKbn;
	private String tokkyuRiyoKbn;
	private String yuryoRiyoKbn;
	private String kekkaSelect;

	private String yuryoOfukuKbn;
	private Integer yuryoKatamichiKin;

	private String betsuRouteRiyu;
	private String yuryoRiyoRiyu;
	private String viaPlaceRiyu;

	private BigDecimal nenpi;
	private Integer gasorinDaiMae;
	private Integer yuryoDaiMae;
	private Integer goukeiMae;
	private Integer hiwariMae;
	private Integer gasorinDaiAto;
	private Integer yuryoDaiAto;
	private Integer goukeiAto;
	private Integer hiwariAto;

	private Integer addUserId;
	private java.sql.Timestamp addDate;
	private Integer updUserId;
	private java.sql.Timestamp updDate;

	private Long fileUid1;
	private Long fileUid2;
	private Long fileUid3;
	private Long fileUid4;
	private Long fileUid5;

	private Date menkyoYukoKigen;
	private String menkyoNo;
	private String shashu;
	private String torokuNo;
	private String haikiryo;
	private Date shakenYukoKigen;
}