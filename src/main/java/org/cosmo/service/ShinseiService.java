package org.cosmo.service;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;

public interface ShinseiService {
    ShinseiJyohouVO getShinseiJyohou(String shinseiNo);
    ShinseiKeiroVO getShinseiKeiro(String shinseiNo);
	ShinseiShoruiVO getShinseiShorui(@Param("shinseiNo") String shinseiNo);
    ShinseiIcHozonVO getShinseiIcHozon(String hozonUid);
    
    String getCodeNm(String code);
    String getShudanName(String code);
    String getShinseiName(String code);
    
    void updateTorikesu(String shinseiNo, String tkComment, String shainUid);
}
