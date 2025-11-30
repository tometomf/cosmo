package org.cosmo.domain;

import lombok.Data;

//조우진

@Data
public class AddressInputForm {
    private String zip1;      
    private String zip2;      
    private String pref;      
    private String addr1;     
    private String addr2;     
    private String tenyuDate; 
    private String action;
}