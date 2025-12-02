package org.cosmo.domain;

import lombok.Data;

@Data
public class ShinseiIcDataVO {

	private String kigyoCd;
	private String shinseiNo;
	private String shinseiYmd;
	private String shinseiKbn;
	private String shinchokuKbn;
	private String genAddress;
	private String newAddress;
	private String genShozoku;
	private String newShozoku;
	private String genKinmuchi;
	private String newKinmuchi;
	
	private String riyu;
	private String idoYmd;
	private String itenYmd;
	private String tennyuYmd;
	private String riyoStartYmd;
	private String ssmdsYmd;
	private String moComment;
	
	private String codeNm;
	private String shinseiName;
    private ShinseiKeiroVO keiro; 
    
    private ShinseiStartKeiroVO startKeiro;
    
    private String shozokuCd;
    private String zip1;
    private String zip2;
    private String pref;
    private String address1;
    private String address2;
    private String diff;

 
}
