package org.cosmo.domain;

import java.util.List;

import lombok.Data;

@Data
public class KeiroInputDenshaDTO {

    private Integer kigyoCd;
    private Integer shinseiNo;
    private Integer keiroSeq;
    
    private String shinseiKbn;
    private String shinseiYmd;
    private Integer shainUid;
    private String shainNo;
    private Integer dairiShinseishaCd;
	
    private String startPlace;
    private String endPlace;
    private List<String> viaPlaces;
    
    private Integer shinseiKin;
    private Integer tsukiShikyuKin;
}
