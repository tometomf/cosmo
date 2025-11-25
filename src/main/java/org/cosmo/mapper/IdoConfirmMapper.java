package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.KeiroRouteDto;
					//조우진
@Mapper
public interface IdoConfirmMapper {
    
    KeiroInfoForm selectKeiroHeader(String shainUid);

    List<KeiroRouteDto> selectRouteList(String shainUid);
    
    void insertKeiroHeader(KeiroInfoForm form);
    void insertRoute(KeiroRouteDto route);
}