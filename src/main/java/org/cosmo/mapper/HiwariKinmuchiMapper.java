package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.HiwariKinmuchiVO;

@Mapper
public interface HiwariKinmuchiMapper {

    HiwariKinmuchiVO selectBeforeShinsei(Integer kigyoCd, Long shainUid);

    HiwariKinmuchiVO selectAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo);
}