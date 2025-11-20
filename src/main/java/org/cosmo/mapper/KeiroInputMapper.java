package org.cosmo.mapper;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;

public interface KeiroInputMapper {

    ShainKeiroDTO selectShainKeiroWithCode(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("keiroSeq") Integer keiroSeq);

    ShinseiDTO selectAddressWithFallback(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid);
    
    ShinseiDTO selectKinmuAddressWithFallback(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid);
    
    ShainLocationVO selectShainLocationByUid(
        @Param("kigyoCd") Long kigyoCd,
        @Param("shainUid") Long shainUid
    );
    
    KeiroInputDenshaDTO selectDenshaKeiroDetail(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Integer shinseiNo,
            @Param("keiroSeq") Integer keiroSeq);
}
