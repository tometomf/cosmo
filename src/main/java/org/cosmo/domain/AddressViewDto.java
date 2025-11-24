package org.cosmo.domain;

import lombok.Data;

@Data
public class AddressViewDto {
    // 현 주소 (DB에서 조회)
    private String currentZip;
    private String currentPref;
    private String currentAddr1;
    private String currentAddr2;

    // 중간 DB 주소 (상단 '이 주소를 반영' 용도)
    private String middleDbAddress; // 전체 주소 문자열
    
    // 반영 버튼 클릭 시 채워넣을 분리된 데이터 (Hidden으로 가지고 있거나 서비스에서 처리)
    private String middleZip1;
    private String middleZip2;
    private String middlePref;
    private String middleAddr1;
    private String middleAddr2;
}