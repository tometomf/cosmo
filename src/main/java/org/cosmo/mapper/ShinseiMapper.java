package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;

@Mapper
public interface ShinseiMapper {

	ShinseiJyohouVO getShinseiJyohou(@Param("shinseiNo") String shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(@Param("shinseiNo") String shinsesiNo);

	ShinseiIcHozonVO getShinseiIcHozon(@Param("hozonUid") String hozonUid);

	ShinseiShoruiVO getShinseiShorui(@Param("shinseiNo") String shinseiNo);

	String getCodeNm(@Param("code") String code);

	String getShudanName(@Param("code") String code);

	String getShinseiName(@Param("code") String code);

	void updateTorikesu(@Param("shinseiNo") String shinseiNo, @Param("tkComment") String tkComment,
			@Param("shainUid") String shainUid);
}
