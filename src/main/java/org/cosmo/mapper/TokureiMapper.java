// 作成者 : 권예성

package org.cosmo.mapper;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiStartKeiroVO;

public interface TokureiMapper {
	
	
    void insertShinsei(ShinseiDTO dto);

    void updateShinsei(ShinseiDTO dto);
    
    void insertStartKeiro(ShinseiStartKeiroVO vo);
    
    void insertEndKeiro(ShinseiEndKeiroVO vo);

}
