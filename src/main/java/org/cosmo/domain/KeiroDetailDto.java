package org.cosmo.domain;

import lombok.Data;

@Data
public class KeiroDetailDto {
    private String stationName; // 역 이름 (예: 시부야역)
    private String lineName;    // 노선 이름 (예: 도큐 덴엔토시선) - 노선이 없으면 단순 경유지
    private int seq;            // 순서
    private boolean isTransfer; // 환승 지점 여부 (화면 UI 구분용)
}