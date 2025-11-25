package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.mapper.HiwariKinmuchiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HiwariKinmuchiServiceImpl implements HiwariKinmuchiService {

    @Autowired
    private HiwariKinmuchiMapper mapper;

    @Override
    public HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid) {
        return mapper.getBeforeShinsei(kigyoCd, shainUid);
    }

    @Override
    public HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.getAfterShinsei(kigyoCd, shainUid, shinseiNo);
    }

    @Override
    public List<String> getShozokuNames(Integer kigyoCd) {
        return mapper.getShozokuNames(kigyoCd);
    }
    
    @Override
    public HiwariAddressVO getAddressPageData(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.getAddressPageData(kigyoCd, shainUid, shinseiNo);
    }
    
    @Override
    public HiwariAddressVO getAddressPageDataBefore(Integer kigyoCd, Long shainUid) {
        return mapper.getAddressPageDataBefore(kigyoCd, shainUid);
    }
}