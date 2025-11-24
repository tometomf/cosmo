package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;

@Mapper
public interface AddressInputMapper {
    // 사원의 현재 주소 조회
    AddressViewDto selectCurrentAddress(String shainUid);

    // 사원의 중간 DB 주소(사택 등) 조회
    AddressViewDto selectMiddleAddress(String shainUid);

    // 임시 저장 (Merge: 있으면 Update, 없으면 Insert)
    void saveIchijiHozon(IchijiHozonVO vo);
    
    // 알림 테이블 저장 (설계서 16번 테이블)
    void insertOshirase(String shainUid, String message);
}