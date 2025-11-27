package org.cosmo.domain;

import java.util.List;
import lombok.Data;

@Data
public class KeiroRouteDto {
    private int routeId;        // 경로 ID (PK)
    private int routeNo;        // 경로 번호 (1, 2, 3...)
    private String transportType; // 통근수단 (CAR, BUS, TRAIN 등) - 화면의 '通勤手段'
    
    // 단순 경로용 (자동차, 버스 등: 출발지 -> 도착지)
    private String startPoint;  // 출발지 (또는 승차역)
    private String endPoint;    // 도착지 (또는 하차역)
    
    // 복합 경로용 (전철: 역 -> 노선 -> 역 -> 노선...)
    // 전철인 경우 아래 리스트에 상세 환승 정보를 담습니다.
    private List<KeiroDetailDto> detailList; 
}