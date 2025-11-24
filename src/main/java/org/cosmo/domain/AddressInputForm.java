package org.cosmo.domain;

import lombok.Data;

@Data
public class AddressInputForm {
    // 입력 필드 (新住所)
    private String zip1;      // 우편번호 앞 3자리
    private String zip2;      // 우편번호 뒤 4자리
    private String pref;      // 도도부현
    private String addr1;     // 시구정촌~번지
    private String addr2;     // 건물명~호실
    private String tenyuDate; // 전입일 (yyyy/MM/dd)

    // 버튼 동작 구분용 (reflect, next, tempsave, back 등)
    private String action;
}