package org.cosmo.service;

import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.KeiroInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class KeiroInputServiceImpl implements KeiroInputService {

	@Autowired
	private KeiroInputMapper mapper;
    
	//재환
    @Override
    public ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid) {
        if (kigyoCd == null || shainUid == null) {
            return null;
        }
        return mapper.selectShainLocationByUid(kigyoCd, shainUid);
    }
    
    //재환
	@Override
	public ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq) {
		return mapper.selectShainKeiroWithCode(kigyoCd, shainUid, keiroSeq);
	}

	//지훈
	@Override
	public ShinseiDTO getShinseiAddress(Integer kigyoCd, Long shainUid) {

		return mapper.selectAddressWithFallback(kigyoCd, shainUid);
	}

	//지훈
	@Override
	public ShinseiDTO getShinseiKinmuAddress(Integer kigyoCd, Long shainUid) {

		return mapper.selectKinmuAddressWithFallback(kigyoCd, shainUid);
	}

	//하정
	@Override
	public KeiroInputDenshaDTO getDenshaKeiroDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {
		
		return mapper.selectDenshaKeiroDetail(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}
	//지훈
	@Override
    public ShinseiStartKeiroVO getViaPlace1(Integer kigyoCd, Long shainUid) {
        return mapper.selectViaPlace1(kigyoCd, shainUid);
    }
	
	//하정
	  @Override
	    public ShinseiStartKeiroVO getStartKeiroOne(
	            Integer kigyoCd, Integer shainUid, Integer shinseiNo, Integer keiroSeq) {

	        return mapper.selectStartKeiro(kigyoCd, shainUid, shinseiNo, keiroSeq);
	    }
}
