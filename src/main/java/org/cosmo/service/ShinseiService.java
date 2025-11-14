package org.cosmo.service;


import org.cosmo.domain.ShinseiDetailVO;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShinseiIcHozonVO;

import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;

public interface ShinseiService {

	ShinseiJyohouVO getShinseiJyohou(Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(Long shinseiNo);

	ShinseiDetailVO getShinseiDetail(Long kigyoCd, Long shinseiNo);

	void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp);

    ShinseiJyohouVO getShinseiJyohou(String shinseiNo);
    ShinseiKeiroVO getShinseiKeiro(String shinseiNo);
	ShinseiShoruiVO getShinseiShorui(@Param("shinseiNo") String shinseiNo);
    ShinseiIcHozonVO getShinseiIcHozon(String hozonUid);
    
    String getCodeNm(String code);
    String getShudanName(String code);
    String getShinseiName(String code);
    
    void updateTorikesu(String shinseiNo, String tkComment, String shainUid);

}
