package org.cosmo.domain;

import lombok.Data;

//조우진

@Data
public class AddressViewDto {
    private String currentZip;
    private String currentPref;
    private String currentAddr1;
    private String currentAddr2;

    private String middleDbAddress; 
    
    // [추가] DB의 우편번호 원본(7자리)을 담을 변수입니다.
    // JSP에서 ${view.middleZip}으로 꺼내 쓰기 위함입니다.
    private String middleZip; 
    
    private String middleZip1;
    private String middleZip2;
    private String middlePref;
    private String middleAddr1;
    private String middleAddr2;
}