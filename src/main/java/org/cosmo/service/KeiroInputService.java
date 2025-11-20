package org.cosmo.service;

import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;

public interface KeiroInputService {

	ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq);

    ShinseiDTO getShinseiAddress(Integer kigyoCd, Long shainUid);
    
    ShinseiDTO getShinseiKinmuAddress(Integer kigyoCd, Long shainUid);
    
    ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid);

	KeiroInputDenshaDTO getDenshaKeiroDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq);
}
