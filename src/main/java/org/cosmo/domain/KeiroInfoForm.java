package org.cosmo.domain;

import java.util.List;
import lombok.Data;

@Data
public class KeiroInfoForm {
    private String shainUid;           // 사원 ID
    private String changeDate;         // 경로 변경일 (화면 하단 날짜 입력)
    private List<KeiroRouteDto> routeList; // 경로 리스트 (경로1, 경로2...)
}