package org.cosmo.mapper;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainKeiroDTO;

public interface KeiroInputMapper {

    ShainKeiroDTO selectShainKeiroWithCode(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("keiroSeq") Integer keiroSeq);

}
