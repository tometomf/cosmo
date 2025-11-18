package org.cosmo.service;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.mapper.IchijiHozonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IchijiHozonServiceImpl implements IchijiHozonService {

    @Autowired
    private IchijiHozonMapper ichijiHozonMapper;

    @Override
    @Transactional
    public int saveTemp(IchijiHozonDTO dto) {

        // INSERT 실행 (selectKey로 dto.hozonUid 세팅됨)
        ichijiHozonMapper.insertIchijiHozon(dto);

        // 생성된 HOZON_UID 반환
        return dto.getHozonUid();
    }
}
