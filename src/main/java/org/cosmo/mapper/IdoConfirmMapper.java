package org.cosmo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.KeiroRouteDto;

@Mapper
public interface IdoConfirmMapper {
    
    // 사원의 경로 변경일 정보 조회
    KeiroInfoForm selectKeiroHeader(String shainUid);

    // 사원의 모든 경로 리스트 조회
    List<KeiroRouteDto> selectRouteList(String shainUid);
    
    // (필요시) 전철 상세 경로 조회 - MyBatis ResultMap으로 한 번에 가져오는 것을 추천하지만 별도 메서드 예시
    // List<KeiroDetailDto> selectRouteDetails(int routeId);
    
    // 저장 관련 (참고용)
    void insertKeiroHeader(KeiroInfoForm form);
    void insertRoute(KeiroRouteDto route);
}