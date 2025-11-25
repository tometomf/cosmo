package org.cosmo.service;

import java.util.List;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.mapper.HiwariKeiroMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 유지희
 */
@Service
public class HiwariKeiroServiceImpl implements HiwariKeiroService {

    @Autowired
    private HiwariKeiroMapper hiwariKeiroMapper;

    @Override
    public List<HiwariKeiroVO> getKeiroList(Integer kigyoCd, Integer shainUid) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001;
        }
        
        return hiwariKeiroMapper.findByUser(kigyoCd, shainUid);
    }

    @Override
    @Transactional
    public void saveApply(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001;
        }
        
        if (keiroList == null || keiroList.isEmpty()) {
            return;
        }
        
        // 기존 경로 삭제
        hiwariKeiroMapper.deleteByUser(kigyoCd, shainUid);
        
        // 새 경로 등록
        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
            vo.setKigyoCd(kigyoCd);
            vo.setShainUid(shainUid);
            vo.setKeiroSeq(seq++);
            hiwariKeiroMapper.insertKeiro(vo);
        }
    }

    @Override
    @Transactional
    public void saveTemp(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001;
        }
        
        if (keiroList == null || keiroList.isEmpty()) {
            return;
        }
        
        hiwariKeiroMapper.deleteByUser(kigyoCd, shainUid);
        
        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
            vo.setKigyoCd(kigyoCd);
            vo.setShainUid(shainUid);
            vo.setKeiroSeq(seq++);
            hiwariKeiroMapper.insertKeiro(vo);
        }
    }

    @Override
    @Transactional
    public void deleteOne(Integer kigyoCd, Integer shainUid, Integer keiroSeq) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001;
        }
        
        if (keiroSeq == null) {
            return;
        }
        
        hiwariKeiroMapper.deleteOne(kigyoCd, shainUid, keiroSeq);
    }
}