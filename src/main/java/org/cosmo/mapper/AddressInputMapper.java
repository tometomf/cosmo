package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;

@Mapper
public interface AddressInputMapper {	//조우진
    AddressViewDto selectCurrentAddress(String shainUid);

    AddressViewDto selectMiddleAddress(String shainUid);

    void saveIchijiHozon(IchijiHozonVO vo);
    
    void insertOshirase(String shainUid, String message);
}