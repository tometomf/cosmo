package org.cosmo.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

//제교
@Data
public class ShinseiDetailVO {

	// ===== 상태 정보 =====
	private Long shinseiNo; // 申請番号
	private String shinchokuKbn;
	private String joutaiName; // 状況(承認待ち 등)
	private String shinseiYmd; // 申請日 (yyyyMMdd -> JSP에서 그대로 출력)
	private String sashimodoshiYmd; // 差戻し日
	private Date saishinseiDate; // 再申請日
	private Date shoninDate; // 承認日
	private Date shikyuuKaishiDate; // 支給開始日
	private String honninComment; // 本人申し送りコメント
	private String shinseiKbn;
	private String tsukinShudanKbn;

	// ===== 申請前 / 申請後 =====
	private String genAddress; // 住所(申請前)
	private String newAddress; // 住所(申請後)

	private String shozokuBeforeNm; // 勤務先(申請前)
	private String shozokuAfterNm; // 勤務先(申請後)

	private String kinmuchiBefore; // 勤務地(申請前)
	private String kinmuchiAfter; // 勤務地(申請後)

	// ===== 経路情報 =====
	private String tsukinShudanName; // 通勤手段名 (自動車(一般) 등)
	private String keiro; // 経路（新丸子駅 → 自由が丘駅）

	private BigDecimal kyori; // 距離(km)
	private BigDecimal kingakuMonth; // 金額1ヶ月
	private BigDecimal yuryodouroMonth;// 有料道路1ヶ月

	private String fuzuiFileTitle; // 付随書類 제목 (링크 텍스트)
	private Date hokenManryoDate; // 保険満了日
	

	private String taijinBaisho; // 対人賠償
	private String taibutsuBaisho; // 対物賠償
	private String jinshinShogai; // 人身障害
	private String tojoshaShogai; // 搭乗者障害
	private Integer tokyu; // 等級

	// ===== 申請情報 =====
	private String shinseiKbnName; // 申請区分名(異動 등)
	private String shinseiRiyu; // 申請理由
	private Date idouDate; // 異動日/移動日
	private Date tennyuDate; // 転入日
	private Date kaishiDate; // 開始日

	private String etcFileTitle;

	private List<ShinseiKeiroDetailVO> keiroList;

	private Long kigyoCd;

	private Integer keiroSeq;

	private String shudanName; // 통근수단 이름(CODE 테이블에서 조인)

	private String startPlace; // START_PLACE
	private String endPlace; // END_PLACE

	private BigDecimal shinseiKm; // SHINSEI_KM

	private BigDecimal katamichi; // YURYO_KATAMICHI_KIN or KATAMICHI_KIN
	private BigDecimal tsuki; // TSUKI_SHIKYU_KIN

	private String yuryoIcS; // YURYO_IC_S
	private String yuryoIcE; // YURYO_IC_E

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