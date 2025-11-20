package org.cosmo.service;

import org.cosmo.domain.ShainKeiroDTO;
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
}
