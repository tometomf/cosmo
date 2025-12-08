package org.cosmo.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;

@Mapper
public interface AddressInputMapper {
    
    // 1. 신청 전 조회
    AddressViewDto selectShainAddress(@Param("shainUid") String shainUid);

    // 2. 신청 후 조회 (추가됨)
    AddressViewDto selectShinseiData(@Param("shinseiNo") String shinseiNo);

    // 3. 저장 및 알림
    void saveIchijiHozon(IchijiHozonVO vo);
    
    void insertOshirase(@Param("kigyoCd") String kigyoCd, 
                        @Param("shainUid") String shainUid, 
                        @Param("shainNo") String shainNo, 
                        @Param("message") String message);

    // 4. 로그 등 (필요시)
    // void insertProcessLog(...);
}