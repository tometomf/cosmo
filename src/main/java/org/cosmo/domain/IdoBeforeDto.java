// org.cosmo.domain.IdoBeforeDto
package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoBeforeDto {

    // 화면에 보여줄 현재 근무지 / 주소 정보 (필요한 것만)
    private Integer kigyoCd;
    private Integer shainUid;
    private String shainNo;
    private String shainNm;

    // 현재 근무지 (社員M.KINMU_*)
    private String kinmuZipCd;
    private String kinmuAddress1;   // 都道府県
    private String kinmuAddress2;   // 市区町村～番地
    private String kinmuAddress3;   // 建物名等

    // 현재 자택 (社員M.ZIP_CD, ADDRESS_*)
    private String zipCd;
    private String address1;        // 都道府県
    private String address2;        // 市区町村～番地
    private String address3;        // 建物名等
}
