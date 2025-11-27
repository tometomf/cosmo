package org.cosmo.domain;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class ShinseiViewDTO {
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

	private String keiroSeq;
	private String tsukinShudan;
	private BigDecimal shinseiKm;
	private Long tsuki;
	private String firstShikyuYmd;

	private String startPlace;
	private String endPlace;
	private String viaPlace1;
	private String viaPlace2;
	private String viaPlace3;
	private String viaPlace4;
	private String viaPlace5;

	private Long katamichi;
	private Long jitsu;
	private Integer firstTeikiTsukiSu;
	private Integer nextTeikiTsukiSu;

	private String idoShudanEtcNm;
	private String busCorpNm;
	private Integer sanshoTeikiKin1;

	private String codeNm;
	private String shinseiName;
	private String shudanName;

	private Long fileUid1;
	private String manryoYmd;
	private String taijin;
	private String taibutsu;
	private String jinshin;
	private String tojosha;
	private String tokyu;

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

	public Long getYuryo() {

		Long safeKatamichi = (katamichi == null ? 0L : katamichi);
		Long safeJitsu = (jitsu == null ? 0L : jitsu);

		return safeKatamichi * (safeJitsu * 2);
	}

	public Long getTsuki() {
		return tsuki == null ? 0L : tsuki;
	}

	public BigDecimal getShinseiKm() {
		return shinseiKm == null ? BigDecimal.ZERO : shinseiKm;
	}

	public Long getTotal() {
		return getTsuki() + getYuryo();
	}
}
