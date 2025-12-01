// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;

public interface TokureiService {
	
	void registerShinsei(ShinseiDTO mainDto, ShinseiStartKeiroVO startVo, ShinseiEndKeiroVO endVo, ShinseiFuzuiShoruiDTO fuzuiDto);

}
