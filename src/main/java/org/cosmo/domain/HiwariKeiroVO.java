package org.cosmo.domain;

public class HiwariKeiroVO {
	private int keiroSeq;         
    private String tsukinShudanNm;  
    private String startPlace;      
    private String endPlace;       
    private String kekkaSelect;     


    public int getKeiroSeq() { return keiroSeq; }
    public void setKeiroSeq(int keiroSeq) { this.keiroSeq = keiroSeq; }
    public String getTsukinShudanNm() { return tsukinShudanNm; }
    public void setTsukinShudanNm(String tsukinShudanNm) { this.tsukinShudanNm = tsukinShudanNm; }
    public String getStartPlace() { return startPlace; }
    public void setStartPlace(String startPlace) { this.startPlace = startPlace; }
    public String getEndPlace() { return endPlace; }
    public void setEndPlace(String endPlace) { this.endPlace = endPlace; }
    public String getKekkaSelect() { return kekkaSelect; }
    public void setKekkaSelect(String kekkaSelect) { this.kekkaSelect = kekkaSelect; }
}

