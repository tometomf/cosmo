package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKinmuchiVO;

@Mapper
public interface HiwariKinmuchiMapper {

    /** 申請前 */
    HiwariKinmuchiVO getBeforeShinsei( //서혜원
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid);

    /** 申請後 */
    HiwariKinmuchiVO getAfterShinsei( //서혜원
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Long shinseiNo);
    
    HiwariAddressVO getAddressPageData(@Param("kigyoCd") Integer kigyoCd, //서혜원
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Long shinseiNo);

    HiwariAddressVO getAddressPageDataBefore(@Param("kigyoCd") Integer kigyoCd, //서혜원
                  @Param("shainUid") Long shainUid);

    /** 所属  */
    List<String> getShozokuNames(@Param("kigyoCd") Integer kigyoCd); //서혜원
}