package org.cosmo.service;

import org.cosmo.domain.CodeVO;
import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;

public interface KeiroInputService {

	//재환
	ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq);

	//지훈
	ShinseiDTO getShinseiAddress(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq);

	//지훈
	ShinseiDTO getShinseiKinmuAddress(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq);

	//재환
	ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid);

	//하정
	KeiroInputDenshaDTO getDenshaKeiroDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq);

	//지훈
	ShinseiStartKeiroVO getViaPlace1(Integer kigyoCd, Long shainUid);

	//하정
	ShinseiStartKeiroVO getStartKeiroOne(Integer kigyoCd, Integer shainUid, Integer shinseiNo, Integer keiroSeq);
	
    void writeProcessLog(String subsystemId,
            String processCol,
            String key1,
            String key2,
            String key3,
            String key4,
            String key5,
            String data,
            Integer userUid,
            String userTrack);
    
    CodeVO getCodeName(String codeSybtsu, String code);
}
