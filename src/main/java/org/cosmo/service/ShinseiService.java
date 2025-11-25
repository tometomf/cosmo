package org.cosmo.service;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataDTO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroDetailVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.springframework.ui.Model;

public interface ShinseiService {

	//하나
	ShinseiJyohouVO getShinseiJyohou(Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(Long shinseiNo);

	ShinseiDetailVO getShinseiDetail(Long kigyoCd, Long shinseiNo);

	String getShainUidByShinseiNo(String shinseiNo);

	ShinseiIcHozonVO getIchijiHozon(String hozonUid);

	ShainVO getShainByUid(String shainUid);

	ShinseiShoruiVO getShinseiShorui(Long shinseiNo);

	ShinseiIcDataDTO getIcData(String hozonUid);

	String getCodeNm(String code);

	String getShudanName(String code);

	String getShinseiName(String code);

	String getFileName(Long shinseiNo);

	String getShinchokuKbn(String shinseiNo);

	String getEmailByShainUid(String shainUid);

	void updateTorikesu(String shinseiNo, String tkComment, String shainUid);

	void deleteIchijiHozonByHozonUid(String hozonUid);

	void insertOshirase(ShainVO loginUser, ShainVO shinseiUser, String shinseiNo);

	void insertCancelLogs(String shinseiNo, String shinseiKbn, String shinseiYmd, ShainVO shain);

	void insertProcessLog(String shinseiNo, String userUid, String type);

	void loadShinseiDetail(Long shinseiNo, String hozonUid, Model model);

	void deleteShinseiByShinseiNo(String shinseiNo);
	
	//제교

	void clearHenkoFlags(Long kigyoCd, Long shinseiNo);

	void resubmitShinsei(Long kigyoCd, Long shinseiNo, String shinseiRiyu, String updUserId);

	void saishinsei(Long kigyoCd, Long shinseiNo, String shinseiRiyu, String newZipCd, String newAddress1,
			String newAddress2, String newAddress3, String jitsuKinmuNissu, String addressIdoKeido,
			String addressChgKbn, String kinmuAddressIdoKeido, String kinmuAddressChgKbn, String loginUserId,
			String userIp);
	
	ShinseiKeiroDetailVO getShinseiKeiroDetail(Long kigyoCd, Long shinseiNo, Integer keiroSeq);

	void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp);


}
