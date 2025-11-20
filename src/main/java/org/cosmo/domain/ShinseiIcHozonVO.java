package org.cosmo.domain;

import lombok.Data;

@Data
public class ShinseiIcHozonVO {
	private String hozonUid;
	private String userUid;
	private String shinseiKbn;
	private String actionNm;
	private byte[] data;
	private String addDate;
}
