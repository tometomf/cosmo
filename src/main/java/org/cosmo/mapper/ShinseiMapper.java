package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;

@Mapper
public interface ShinseiMapper {

	ShinseiJyohouVO getShinseiJyohou(@Param("shinseiNo") Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(@Param("shinseiNo") Long shinseiNo);

	ShinseiDetailVO selectShinseiDetail(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo);

	void updateShinseiToIchijihozon(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("updUserId") String updUserId);

	void updateAlertForHikimodoshi(@Param("kigyoCd") Long kigyoCd, @Param("shinseiNo") Long shinseiNo,
			@Param("updUserId") String updUserId);
}
