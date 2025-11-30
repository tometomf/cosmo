package org.cosmo.domain;

import lombok.Data;

@Data
public class IchijiHozonVO {		//조우진	
    private Long hozonId;        
    
    private String userUid;      
    private String shinseiKbn;
    private String shozokuCd;
    private String actionNm;     
    private String data;         
    private String addUserId;
    private String updUserId;		//미완성
}