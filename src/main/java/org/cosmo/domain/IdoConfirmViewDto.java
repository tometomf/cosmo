package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoConfirmViewDto {
    // 화면 표시용 (현 근무지) - 마스터 혹은 신청테이블에서 가져온 값
    private String curKinmuPlace; 
    
    // 화면 표시용 (현 주소) - 마스터 혹은 신청테이블에서 가져온 값
    private String curAddress;      
    
    // 변경 여부 자동 체크용 (신청 후에만 값 있음)
    private boolean kinmuChanged;
    private boolean addressChanged;
}