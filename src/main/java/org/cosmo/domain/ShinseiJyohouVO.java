package org.cosmo.domain;

import lombok.Data;

@Data
public class ShinseiJyohouVO {
	private Integer kigyoCd;
	private Long shinseiNo;
	private String shinseiYmd;
	private String shinseiKbn;
	private String shinchokuKbn;
	private String genAddress1;
	private String genAddress2;
	private String genAddress3;
	private String newAddress1;
	private String newAddress2;
	private String newAddress3;
	private String genShozoku;
	private String newShozoku;
	private String genKinmuchi1;
	private String genKinmuchi2;
	private String genKinmuchi3;
	private String newKinmuchi1;
	private String newKinmuchi2;
	private String newKinmuchi3;

	private String riyu;
	private String idoYmd;
	private String itenYmd;
	private String tennyuYmd;
	private String riyoStartYmd;
	private String ssmdsYmd;
	private String moComment;

	private String codeNm;
	private String shinseiName;

	public String getGenAddress() {
		StringBuilder sb = new StringBuilder();

		if (genAddress1 != null && !genAddress1.trim().isEmpty()) {
			sb.append(genAddress1.trim());
		}
		if (genAddress2 != null && !genAddress2.trim().isEmpty()) {
			sb.append(genAddress2.trim());
		}
		if (genAddress3 != null && !genAddress3.trim().isEmpty()) {
			sb.append(genAddress3.trim());
		}

		return sb.toString();
	}

	public String getNewAddress() {
		StringBuilder sb = new StringBuilder();

		if (newAddress1 != null && !newAddress1.trim().isEmpty())
			sb.append(newAddress1.trim());
		if (newAddress2 != null && !newAddress2.trim().isEmpty())
			sb.append(newAddress2.trim());
		if (newAddress3 != null && !newAddress3.trim().isEmpty())
			sb.append(newAddress3.trim());

		return sb.toString();
	}

	public String getGenKinmuchi() {
		StringBuilder sb = new StringBuilder();

		if (genKinmuchi1 != null && !genKinmuchi1.trim().isEmpty())
			sb.append(genKinmuchi1.trim());
		if (genKinmuchi2 != null && !genKinmuchi2.trim().isEmpty())
			sb.append(genKinmuchi2.trim());
		if (genKinmuchi3 != null && !genKinmuchi3.trim().isEmpty())
			sb.append(genKinmuchi3.trim());

		return sb.toString();
	}

	public String getNewKinmuchi() {
		StringBuilder sb = new StringBuilder();

		if (newKinmuchi1 != null && !newKinmuchi1.trim().isEmpty())
			sb.append(newKinmuchi1.trim());
		if (newKinmuchi2 != null && !newKinmuchi2.trim().isEmpty())
			sb.append(newKinmuchi2.trim());
		if (newKinmuchi3 != null && !newKinmuchi3.trim().isEmpty())
			sb.append(newKinmuchi3.trim());

		return sb.toString();
	}

}
