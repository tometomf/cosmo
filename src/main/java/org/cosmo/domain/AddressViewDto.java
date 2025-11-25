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
    
    private String middleZip1;
    private String middleZip2;
    private String middlePref;
    private String middleAddr1;
    private String middleAddr2;
}