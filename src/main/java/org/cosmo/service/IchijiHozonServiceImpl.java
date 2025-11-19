package org.cosmo.service;

import java.util.HashMap;
import java.util.Map;

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
    public int saveOrUpdateCommuteTemp(IchijiHozonDTO dto) {

        // 1) 먼저 UPDATE 시도
        int updated = ichijiHozonMapper.updateByUserAndAction(dto);

        // 2) 갱신된 행이 없으면 INSERT
        if (updated == 0) {
            ichijiHozonMapper.insertIchijiHozon(dto);
        }

        // 3) USER_UID + ACTION_NM 기준으로 최종 데이터 조회
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("userUid", dto.getUserUid());
        param.put("actionNm", dto.getActionNm());

        IchijiHozonDTO latest = ichijiHozonMapper.selectLatestByUserAndAction(param);

        if (latest != null) {
            return latest.getHozonUid();
        } else {
            return 0;
        }
    }
}
