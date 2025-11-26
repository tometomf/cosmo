package org.cosmo.mapper;
//조우진

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;

@Mapper
public interface AddressInputMapper {
    
    AddressViewDto selectCurrentAddress(String shainUid);

    AddressViewDto selectMiddleAddress(String shainUid);

    Map<String, String> selectZipCode(@Param("zip1") String zip1, @Param("zip2") String zip2);
    
    void saveIchijiHozon(IchijiHozonVO vo);
    
    void insertOshirase(
    	    @Param("kigyoCd") String kigyoCd, 
    	    @Param("shainUid") String shainUid, 
    	    @Param("shainNo") String shainNo,   // <--- 이거 추가
    	    @Param("message") String message
    	);
    
}