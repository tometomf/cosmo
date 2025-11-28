package org.cosmo.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShinseiDetailVO {

	// ===== 상태 정보 =====
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

	// ===== 申請前 / 申請後 (쿼리에 추가된 항목) =====
	private String genAddress;
	private String newAddress;

	private String shozokuBeforeNm;
	private String shozokuAfterNm;

	private String kinmuchiBefore;
	private String kinmuchiAfter;

	// 쿼리에 있었던 원본 주소/소속 코드 필드
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

	// ===== 経路情報 =====
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

	// ===== 申請情報 =====
	private String shinseiKbnName;
	private String shinseiRiyu;
	private Date idouDate;
	private Date tennyuDate;
	private Date kaishiDate;

	// 쿼리에 있었던 추가 날짜 필드
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


	private Long etcFileUid1;
	private Long etcFileUid2;
	private Long etcFileUid3;
	private Long etcFileUid4;
	private Long etcFileUid5;
	
			
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

	private String shinseiName;

	private String newKinmuZipCd; // 근무지 우편번호
	private String addressIdoKeido; // 집 주소 위도경도
	private String addressChgKbn; // 집 주소변경구분
	private String kinmuAddressIdoKeido; // 근무지 주소 위도경도
	private String kinmuAddressChgKbn; // 근무지 주소변경구분



	private String genKinmuchi; // 申請前 勤務地 (결합)
	private String newKinmuchi; // 申請後 勤務地 (결합)


	private String codeNm; // 진행상태명

	private String genShozoku; // 申請前 所属명
	private String newShozoku; // 申請後 所属명

	// etc_comment 필드 추가
	private String etcComment1;
	private String etcComment2;
	private String etcComment3;
	private String etcComment4;
	private String etcComment5;
}