package org.cosmo.domain;

import lombok.Data;

@Data
public class HiwariKakuninVO {


    private String empNo;         
    private String empName;       
    private String empWorkplace;  
    private String empAddress;    
    
    private String route1Transport;    
    private String route1Route;         
    private String route1WorkDays;     
    private String route1OneWayFee;    
    private String route1Amount;        
    private String route1AmountMonthly; 
    
    private String route2Transport;
    private String route2Route;
    private String route2WorkDays;
    private String route2OneWayFee;
    private String route2Amount;
    private String route2AmountMonthly;

    private String applyKind;        
    private String applyReason;      
    private String applyPeriodText;  
    private String applyWorkDays;   
    private String applyTotalAmount;
}
