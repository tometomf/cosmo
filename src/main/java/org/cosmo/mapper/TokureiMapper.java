// 作成者 : 권예성

package org.cosmo.mapper;

import org.cosmo.domain.TokureiForm;

public interface TokureiMapper {
	
	Long getNextShinseiNo(Integer kigyoCd);

    int insertShinseiForTokurei(TokureiForm form);

    int updateTokurei(TokureiForm form);

}
