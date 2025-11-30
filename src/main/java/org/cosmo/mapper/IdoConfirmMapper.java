package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IdoConfirmViewDto;

@Mapper
public interface IdoConfirmMapper {

    // [신청 전] 사원 마스터(SHAIN)에서 현 근무지와 주소 조회
    IdoConfirmViewDto selectShainAddress(
            @Param("kigyoCd") String kigyoCd, 
            @Param("shainUid") String shainUid
    );

    // [신청 후] 신청 테이블(SHINSEI_TBL)에서 저장된 근무지와 주소 조회
    IdoConfirmViewDto selectShinseiAddress(
            @Param("kigyoCd") String kigyoCd, 
            @Param("shinseiNo") String shinseiNo
    );
    
}