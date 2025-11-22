package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKakuninRouteVO;

public interface HiwariKakuninMapper {

    HiwariKakuninVO selectKakuninHeader(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shinseiNo") Long shinseiNo);

    List<HiwariKakuninRouteVO> selectKakuninRoutes(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shinseiNo") Long shinseiNo);

int updateShinseiApproval(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shinseiNo") Long shinseiNo,
        @Param("shinchoKbn") String shinchoKbn);
}