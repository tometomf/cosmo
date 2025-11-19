package org.cosmo.service;

import org.cosmo.domain.ShainFuzuiShoruiHuzuiNewInputVO;

public interface HuzuiNewInputService {
	
	ShainFuzuiShoruiHuzuiNewInputVO getList(int kigyo_Cd,int shain_Uid);
	
}
