package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariKinmuchiVO;

@Mapper
public interface HiwariKinmuchiMapper {

    /** 申請前 */
    HiwariKinmuchiVO getBeforeShinsei(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid);

    /** 申請後 */
    HiwariKinmuchiVO getAfterShinsei(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Long shinseiNo);

    /** 所属  */
    List<String> getShozokuNames(@Param("kigyoCd") Integer kigyoCd);
}