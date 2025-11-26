// 作成者 : 권예성

package org.cosmo.mapper;

import org.cosmo.domain.ShinseiDTO;

public interface TokureiMapper {
	
	int insertShinseiForTokurei(ShinseiDTO dto);

    Integer getNextShinseiNo();


}
