// org.cosmo.domain.IdoAfterDto
package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoAfterDto {

    private Integer kigyoCd;
    private Long   shinseiNo;
    private Integer shainUid;
    private String shainNo;

    // 申請T の現住所／新住所
    private String genZipCd;
    private String genAddress1;
    private String genAddress2;
    private String genAddress3;

    private String newZipCd;
    private String newAddress1;
    private String newAddress2;
    private String newAddress3;

    // 住所変更区分・勤務先変更区分 등 플래그
    private String addressChgKbn;       // ADDRESS_CHG_KBN
    private String kinmuAddressChgKbn;  // KINMU_ADDRESS_CHG_KBN
}
