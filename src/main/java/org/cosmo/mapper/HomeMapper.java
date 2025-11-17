package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainVO;

public interface HomeMapper {

	public List<ShainVO> getList(@Param ("kigyo_Cd") String kigyo_Cd, @Param ("shain_Uid") String shain_Uid);
}
