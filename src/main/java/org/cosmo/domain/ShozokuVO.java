package org.cosmo.domain;

import lombok.Data;

@Data
public class ShozokuVO {

    private Integer kigyoCd;         // 기업 코드
    private String jigyoshoCd;       // 사업소 코드
    private String shozokuCd;        // 소속 코드
    private String shozokuNm;        // 소속 이름
    private String shozokuZipCd;     // 우편번호
    private String shozokuAddress;   // 주소
}