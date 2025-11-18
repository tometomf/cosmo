package org.cosmo.service;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.springframework.ui.Model;

public interface ShinseiService {

	ShinseiJyohouVO getShinseiJyohou(Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(Long shinseiNo);

	ShinseiDetailVO getShinseiDetail(Long kigyoCd, Long shinseiNo);

	void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp);

	ShinseiShoruiVO getShinseiShorui(Long shinseiNo);

	ShinseiIcDataVO getIcData(String hozonUid);

	String getCodeNm(String code);

	String getShudanName(String code);

	String getShinseiName(String code);

	String getFileName(Long shinseiNo);

	String getShinchokuKbn(String shinseiNo);

	void updateTorikesu(String shinseiNo, String tkComment, String shainUid);

	void deleteIchijiHozonByHozonUid(String hozonUid);

	void insertOshirase(ShainVO shain, String shinseiNo);

	void insertCancelLogs(String shinseiNo, String shinseiKbn, String shinseiYmd, ShainVO shain);

	void insertProcessLog(String shinseiNo, String userUid, String type);

	void loadShinseiDetail(Long shinseiNo, String hozonUid, Model model);
	
	void deleteShinseiByShinseiNo(String shinseiNo);
		
}
