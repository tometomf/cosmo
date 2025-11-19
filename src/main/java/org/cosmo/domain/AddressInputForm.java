package org.cosmo.domain;

import lombok.Data;

/**
 * 0400 住所入力 화면 폼
 */
@Data
public class AddressInputForm {

	// 화면 오른쪽 "新住所" 영역

	private String newZip1; // 郵便番号(앞 3자리)
	private String newZip2; // 郵便番号(뒤 4자리)

	private String newPref; // 都道府県
	private String newCity; // 市区町村
	private String newStreet; // 丁目・番地 등
	private String newBuilding; // 建物名 등

	private String moveInDate; // 転入日 (yyyy/MM/dd 문자열로 받기)

	// 화면 왼쪽 "現住所"는 readonly로 보여줄 거라 폼에는 안 넣어도 됨.
}
