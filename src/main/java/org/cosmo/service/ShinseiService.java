package org.cosmo.service;


import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiFileVO;
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
	ShinseiShoruiVO getShinseiShorui(String shinseiNo);
    ShinseiIcHozonVO getShinseiIcHozon(String hozonUid);
    
    String getCodeNm(String code);
    String getShudanName(String code);
    String getShinseiName(String code);
    String getFileName(String shinseiNo);
    String getShinchokuKbn(String shinseiNo);
    
    void updateTorikesu(String shinseiNo, String tkComment, String shainUid);
    
    void deleteIchijiHozonByHozonUid(String hozonUid);
    
	void insertOshirase(ShainVO shain);
	
	void insertCancelLogs(String shinseiNo, String shinseiKbn, String shinseiYmd, ShainVO shain);

	void insertProcessLog(String shinseiNo, String userUid, String type);


}
