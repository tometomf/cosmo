package org.cosmo.domain;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class ShinseiStartKeiroVO {

    private Integer kigyoCd;
    private Integer shinseiNo;
    private Integer keiroSeq;

    private String shinseiKbn;
    private String shinseiYmd;
    private Integer shainUid;
    private String shainNo;
    private Integer dairiShinseishaCd;

    private String tsukinShudanKbn;
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

    private String startPlace;
    private String endPlace;
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

    private Integer sanshoTeikiTsukiSu1;
    private Integer sanshoTeikiKin1;
    private Integer sanshoTeikiTsukiSu2;
    private Integer sanshoTeikiKin2;
    private Integer sanshoTeikiTsukiSu3;
    private Integer sanshoTeikiKin3;

    private BigDecimal shinseiKm;

    private String yuryoIcS;
    private String yuryoIcE;
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

}
