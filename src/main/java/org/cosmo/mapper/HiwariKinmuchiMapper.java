package org.cosmo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.HiwariRiyuVO;

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
    
    HiwariRiyuVO shinseiRiyuPage(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shainUid") Long shainUid,
            @Param("shinseiNo") Long shinseiNo
    ); //서혜원

    /** 所属  */
    List<String> getShozokuNames(@Param("kigyoCd") Integer kigyoCd); //서혜원
    
    // 유지희
    List<HiwariKeiroVO> findByUser(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Long shainUid
    );
    
    int deleteByUser(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Long shainUid
    );
    
    int insertKeiro(HiwariKeiroVO vo);
    
    int deleteOne(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shainUid") Long shainUid,
        @Param("keiroSeq") Integer keiroSeq
 );
    // 유지희
    HiwariKakuninVO selectKakuninHeader(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shinseiNo") Long shinseiNo);

    List<HiwariKakuninRouteVO> selectKakuninRoutes(
            @Param("kigyoCd") Integer kigyoCd,
            @Param("shinseiNo") Long shinseiNo);
    // 유지희
int updateShinseiApproval(
        @Param("kigyoCd") Integer kigyoCd,
        @Param("shinseiNo") Long shinseiNo,
        @Param("shinchoKbn") String shinchoKbn);
}


