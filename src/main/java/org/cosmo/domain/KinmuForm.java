// 作成者 : 권예성

package org.cosmo.domain;

import lombok.Data;

@Data
public class KinmuForm {
	
	// 3번 화면에서 입력하는 값
    private String newAddress;      // 신근무지주소
    private String addressChange;   // "1" = 住所が変わる, "0" = 変わらない

    // NAVITIME/Google 등에서 받아온 결과
    private Double lat;             // 위도
    private Double lng;             // 경도

}
