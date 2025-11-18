package org.cosmo.mapper;

import java.util.List;

import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroMapper {

    List<HiwariKeiroVO> findByUser(Integer shainUid);

    int deleteByUser(Integer shainUid);

    int insertKeiro(HiwariKeiroVO vo);
}
