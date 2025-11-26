package org.cosmo.domain;

import lombok.Data;

@Data
public class ShainLocationVO {

    // PK
    private Long kigyoCd;          // KIGYO_CD
    private Long shainUid;         // SHAIN_UID

    // 자택 정보(현재 주소)
    private String zipCd;          // ZIP_CD
    private String address1;       // ADDRESS_1
    private String address2;       // ADDRESS_2
    private String address3;       // ADDRESS_3
    private String addressIdoKeido; // ADDRESS_IDO_KEIDO (위도/경도)

    // 근무지 정보
    private String kinmuZipCd;         // KINMU_ZIP_CD
    private String kinmuAddress1;      // KINMU_ADDRESS_1
    private String kinmuAddress2;      // KINMU_ADDRESS_2
    private String kinmuAddress3;      // KINMU_ADDRESS_3
    private String kinmuAddressIdoKeido; // KINMU_ADDRESS_IDO_KEIDO (위도/경도)
}
