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
    
    @Override
    public ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid) {
        if (kigyoCd == null || shainUid == null) {
            return null;
        }
        return mapper.selectShainLocationByUid(kigyoCd, shainUid);
    }
    
	@Override
	public ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq) {
		return mapper.selectShainKeiroWithCode(kigyoCd, shainUid, keiroSeq);
	}

	@Override
	public ShinseiDTO getShinseiAddress(Integer kigyoCd, Long shainUid) {

		return mapper.selectAddressWithFallback(kigyoCd, shainUid);
	}

	@Override
	public ShinseiDTO getShinseiKinmuAddress(Integer kigyoCd, Long shainUid) {

		return mapper.selectKinmuAddressWithFallback(kigyoCd, shainUid);
	}

	@Override
	public KeiroInputDenshaDTO getDenshaKeiroDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {
		
		return mapper.selectDenshaKeiroDetail(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}
	
	@Override
    public ShinseiStartKeiroVO getViaPlace1(Integer kigyoCd, Long shainUid) {
        return mapper.selectViaPlace1(kigyoCd, shainUid);
    }
	
	  @Override
	    public ShinseiStartKeiroVO getStartKeiroOne(
	            Integer kigyoCd, Integer shainUid, Integer shinseiNo, Integer keiroSeq) {

	        return mapper.selectStartKeiro(kigyoCd, shainUid, shinseiNo, keiroSeq);
	    }
}
