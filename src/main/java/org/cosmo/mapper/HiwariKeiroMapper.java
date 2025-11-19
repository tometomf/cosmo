package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroMapper {

    List<HiwariKeiroVO> findByUser(@Param("shainUid") Integer shainUid);

    int deleteByUser(@Param("shainUid") Integer shainUid);

    int insertKeiro(HiwariKeiroVO vo);

    // ★ 추가 — 경로 1건 삭제 (「削除する」 링크 전용)
    int deleteOne(
            @Param("shainUid") Integer shainUid,
            @Param("keiroSeq") Integer keiroSeq);
}
