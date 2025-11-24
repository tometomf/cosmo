package org.cosmo.domain;

import lombok.Data;

@Data
public class FuzuiRequestWrapperDTO {
	private ShinseiDTO shinseiDTO;
	private ShinseiFuzuiShoruiDTO shinseiFuzuiShoruiDTO;	
	private OshiraseDTO oshiraseDTO;	
	private ProcessLogDTO processLogDTO;		
}
