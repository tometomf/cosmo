package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.HiwariRiyuVO;

public interface HiwariKinmuchiService {

	//서혜원 시작
    HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid);

    HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo);
    
    HiwariAddressVO getAddressPageData(Integer kigyoCd, Long shainUid, Long shinseiNo);
    
    HiwariAddressVO getAddressPageDataBefore(Integer kigyoCd, Long shainUid);
    
    HiwariRiyuVO getRiyuPageAfter(Integer kigyoCd, Long shainUid, Long shinseiNo);
    
    List<String> getShozokuNames(Integer kigyoCd);
    //서혜원 끝
    
    
    
    //유지희 시작
    HiwariKakuninVO getHeader(Integer kigyoCd, Long shinseiNo);
    
    List<HiwariKakuninRouteVO> getRoutes(Integer kigyoCd, Long shinseiNo);
    
    void submitApplication(Integer kigyoCd, Long shinseiNo);
    
    List<HiwariKeiroVO> getKeiroList(Integer kigyoCd, Long shainUid);
    
    void saveApply(Integer kigyoCd, Long shainUid, List<HiwariKeiroVO> keiroList);
    
    void saveTemp(Integer kigyoCd, Long shainUid, List<HiwariKeiroVO> keiroList);
    
    void deleteOne(Integer kigyoCd, Long shainUid, Integer keiroSeq);
    


  //유지희 끝

}