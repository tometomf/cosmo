package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.mapper.HiwariKeiroMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HiwariKeiroServiceImpl implements HiwariKeiroService {

    @Autowired
    private HiwariKeiroMapper hiwariKeiroMapper;


    @Override
    public List<HiwariKeiroVO> getKeiroList(Integer shainUid) {

        if (shainUid == null) {
            shainUid = 1;   
        }

        return hiwariKeiroMapper.findByUser(shainUid);
    }

  
 
    @Override
    public void saveApply(Integer shainUid, List<HiwariKeiroVO> keiroList) {

        if (shainUid == null) {
            shainUid = 1;   
        }

        hiwariKeiroMapper.deleteByUser(shainUid);

        int seq = 1;    
        for (HiwariKeiroVO vo : keiroList) {
            vo.setShinseiNo(1L);     
            vo.setKigyoCd(1);       
            vo.setShainUid(shainUid);
            vo.setKeiroSeq(seq++);

            hiwariKeiroMapper.insertKeiro(vo);
        }
    }

   
    @Override
    public void saveTemp(Integer shainUid, List<HiwariKeiroVO> keiroList) {

        if (shainUid == null) {
            shainUid = 1;   
        }

        hiwariKeiroMapper.deleteByUser(shainUid);

        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
            vo.setShinseiNo(1L);     
            vo.setKigyoCd(1);        
            vo.setShainUid(shainUid);
            vo.setKeiroSeq(seq++);

            hiwariKeiroMapper.insertKeiro(vo);
        }
    }
}
