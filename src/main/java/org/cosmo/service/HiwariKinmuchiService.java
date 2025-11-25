package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKinmuchiVO;

public interface HiwariKinmuchiService {

	//서혜원 시작
    HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid);

    HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo);
    
    HiwariAddressVO getAddressPageData(Integer kigyoCd, Long shainUid, Long shinseiNo);
    
    HiwariAddressVO getAddressPageDataBefore(Integer kigyoCd, Long shainUid);

    List<String> getShozokuNames(Integer kigyoCd);
    //서혜원 끝
}