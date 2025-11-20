package org.cosmo.service;

import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;
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
    @Transactional
    public void saveViaPlace1(Integer kigyoCd, Integer shinseiNo, Integer keiroSeq, String viaPlace1) {
    	System.out.println("saveViaPlace1 Service >>> viaPlace1=" + viaPlace1
                + ", shinseiNo=" + shinseiNo
                + ", keiroSeq=" + keiroSeq);
        mapper.updateViaPlace1(kigyoCd, shinseiNo, keiroSeq, viaPlace1);
    }
    
    @Override
    public ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid) {
        if (kigyoCd == null || shainUid == null) {
            return null;
        }
        return mapper.selectShainLocationByUid(kigyoCd, shainUid);
    }
}
