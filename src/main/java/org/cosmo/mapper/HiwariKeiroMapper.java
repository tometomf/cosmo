package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroMapper {
    
    // ★ kigyoCd 파라미터 추가
    List<HiwariKeiroVO> findByUser(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Integer shainUid
    );
    
    // ★ kigyoCd 파라미터 추가
    int deleteByUser(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Integer shainUid
    );
    
    int insertKeiro(HiwariKeiroVO vo);
    
    // ★ kigyoCd 파라미터 추가
    int deleteOne(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Integer shainUid,
        @Param("keiroSeq") Integer keiroSeq
    );
}