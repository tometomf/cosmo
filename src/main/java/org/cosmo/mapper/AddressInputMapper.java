package org.cosmo.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;

@Mapper
public interface AddressInputMapper {
    
    // [신청 전] 사원 정보 조회
    AddressViewDto selectShainAddress(@Param("shainUid") String shainUid);

    // [신청 후] 신청 정보 조회
    AddressViewDto selectShinseiData(@Param("shinseiNo") String shinseiNo);

    // 저장 관련
    void saveIchijiHozon(IchijiHozonVO vo);
    void insertOshirase(@Param("kigyoCd") String kigyoCd, @Param("shainUid") String shainUid, @Param("shainNo") String shainNo, @Param("message") String message);
    void insertProcessLog(@Param("kigyoCd") String kigyoCd,
            @Param("userUid") String userUid,
            @Param("shinseiKbn") String shinseiKbn,
            @Param("userIp") String userIp);
}