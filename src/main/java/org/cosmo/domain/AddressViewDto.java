package org.cosmo.domain;

import lombok.Data;

/**
 * 0400 화면에 표시할 주소 정보 (현재/신청후)
 */
@Data
public class AddressViewDto {

    // 現住所 (신청 전: 社員M 등)
    private String curZip;       // 213-0001
    private String curPref;      // 神奈川県
    private String curCity;      // 川崎市中原区
    private String curStreet;    // 上小田中1-2-3
    private String curBuilding;  // レオパレス清の103

    // 新住所 (신청 후: 申請T or 一時保存)
    // 여기 값은 AddressInputForm으로 옮겨서 input value로 쓸 거라
    // 꼭 있어야 하는 건 아님. 필요하면 추가로 사용.
}
