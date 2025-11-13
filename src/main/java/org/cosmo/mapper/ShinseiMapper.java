package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;

@Mapper
public interface ShinseiMapper {

	ShinseiJyohouVO getShinseiJyohou(@Param("shinseiNo") Long shinseiNo);
	ShinseiKeiroVO getShinseiKeiro(@Param("shinseiNo") Long shinsesiNo);
}
