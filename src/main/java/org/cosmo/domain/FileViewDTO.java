package org.cosmo.domain;

import lombok.Data;

@Data
public class FileViewDTO {
	private byte[] data;
	private String contentType;
	private String name;
}
