package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainFuzuiShoruiHuzuiNewInputVO;

@Mapper
public interface HuzuiNewInputMapper {

	ShainFuzuiShoruiHuzuiNewInputVO getList(@Param ("kigyo_Cd") int kigyo_Cd,@Param ("shain_Uid") int shain_Uid);
	
}
