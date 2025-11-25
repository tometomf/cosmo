package org.cosmo.domain;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("HiwariAddressVO") //서혜원
public class HiwariAddressVO {

    // ===== 上部 주소 바 (社宅住所 → 이 화면으로 복사되는 주소) =====
    private String fullAddress;  


    // ===== 現住所 (변경 전 주소) =====
    private String genZip;         // 7자리 우편번호
    private String genAddress1;    // 도도부현
    private String genAddress2;    // 주소1
    private String genAddress3;    // 주소2 (건물명)

    // ===== 日割期間住所 (변경 대상 주소) =====
    private String newZip;         // 7자리 우편번호
    private String newAddress1;    // 도도부현
    private String newAddress2;    // 주소1
    private String newAddress3;    // 주소2 (건물명)
    
    private String dbZip;
    private String dbAddress1;
    private String dbAddress2;
    
    
}