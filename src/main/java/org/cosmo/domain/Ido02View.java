// org.cosmo.domain.Ido0200View
package org.cosmo.domain;

import lombok.Data;

@Data
public class Ido02View {

    // 신청 전 / 후 어느쪽으로 나왔는지
    private boolean shinseiExists;

    // 신청 전 데이터
    private IdoBeforeDto before;

    // 신청 후 데이터
    private IdoAfterDto after;

    // 라디오 선택값 (勤務地が変わる／変わらない, 住所が変わる／変わらない)
    private boolean kinmuChange;   // true: 変わる, false: 変わらない
    private boolean jushoChange;   // true: 変わる, false: 変わらない
}
