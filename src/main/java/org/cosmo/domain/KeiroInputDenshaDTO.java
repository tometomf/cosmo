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
    private String viaPlace1;         // 경유1
    private String viaPlace2;         // 경유2
    private String viaPlace3;         // 경유3
    private String viaPlace4;         // 경유4
    private String viaPlace5;         // 경유5
    
    private Integer shinseiKin;
    private Integer tsukiShikyuKin;
}
