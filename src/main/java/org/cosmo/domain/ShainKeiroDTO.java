package org.cosmo.domain;

import java.math.BigDecimal;
import lombok.Data;

/**
 * 사원 통근 경로 + 통근수단명 JOIN 결과 DTO
 */
@Data
public class ShainKeiroDTO {

    private Integer kigyoCd;          // 회사코드 (KIGYO_CD)
    private Long shainUid;            // 사원 UID
    private Integer keiroSeq;         // 경로 번호

    private String tsukinShudanKbn;   // 통근수단 구분 코드
    private String tsukinShudanNm;    // 통근수단명 (CODE_NM)

    private String startPlace;        // 출발지
    private String endPlace;          // 도착지
    private String viaPlace1;         // 경유1
    private String viaPlace2;         // 경유2
    private String viaPlace3;         // 경유3
    private String viaPlace4;         // 경유4
    private String viaPlace5;         // 경유5

    private BigDecimal shinseiKm;     // 거리
    private BigDecimal shikyuKin;     // 지급 금액
}
