package org.cosmo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IchijiHozonDTO;

public interface IchijiHozonMapper {

    int updateByUserAndAction(IchijiHozonDTO dto);

    void insertIchijiHozon(IchijiHozonDTO dto);

    IchijiHozonDTO selectLatestByUserAndAction(Map<String, Object> param);
    
    IchijiHozonDTO selectLatestTemp(@Param("userUid") Integer userUid,
            @Param("actionNm") String actionNm);
}
