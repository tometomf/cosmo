package org.cosmo.service;

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
        return mapper.selectBeforeShinsei(kigyoCd, shainUid);
    }

    @Override
    public HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.selectAfterShinsei(kigyoCd, shainUid, shinseiNo);
    }
}