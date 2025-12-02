package org.cosmo.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UploadFileDTO {

    private Long fileUid;
    private Integer seq;
    private String title;
    private String name;
    private String contentType;
    private byte[] data;

    private String kigyoCd;
    private Integer addUserId;         // ADD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp addDate;         // ADD_DATE
	private Integer updUserId;         // UPD_USER_ID (nullable NUMBER이므로 Integer)
	private Timestamp updDate; 
	
	private String fileName1;
	private String fileName2;
	private String fileName3;
	private String fileName4;
	private String etcFileName1;
	private String etcFileName2;
	private String etcFileName3;
	private String etcFileName4;
	private String etcFileName5;
	
	
}
