package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.springframework.stereotype.Service;

@Service
public class IdoConfirmServiceImpl implements IdoConfirmService {

    @Override
    public NextStep decideNextStep(AlertType alertType,
                                   boolean workPlaceChange,
                                   boolean addressChange) {

        switch (alertType) {
            case IDOU_ITEN:
                return handleIdouIten(workPlaceChange, addressChange);
            case SONOTA:
                return handleSonota(workPlaceChange, addressChange);
            case JISHIN:
                return handleJishin(workPlaceChange, addressChange);
            default:
                // 안전용
                return new NextStep(NextScreen.COMMUTE_INFO, false);
        }
    }

    /**
     * アラート「異動」「移転」から遷移した場合
     *
     * ① 勤務地:変わる 住所:変わる      → (3) → (4) → (5)  → 첫 화면은 (3)
     * ② 勤務地:変わる 住所:変わらない → (3) → (5)        → 첫 화면은 (3)
     * ③④는 화면에서 선택 불가이므로 여기서 들어오면 예외로 처리
     */
    private NextStep handleIdouIten(boolean workPlaceChange, boolean addressChange) {
        if (!workPlaceChange) {
            // 설계서상 발생하면 안되는 패턴 → 방어코드
            throw new IllegalArgumentException("Invalid pattern for IDOU_ITEN: 勤務地が変わらない");
        }

        // ①, ② 모두 첫 화면은 勤務地入力画面(3)
        return new NextStep(NextScreen.WORK_INPUT, false);
    }

    /**
     * アラート「その他」から遷移した場合
     *
     * ① 勤務地:変わる 住所:変わる      → (3) → (4) → (5)  → 첫 화면 (3)
     * ② 勤務地:変わる 住所:変わらない → (3) → (5)        → 첫 화면 (3)
     * ③ 勤務地:変わらない 住所:変わる → (4) → (5)        → 첫 화면 (4)
     * ④ 勤務地:変わらない 住所:変わらない → (5)          → 첫 화면 (5)
     */
    private NextStep handleSonota(boolean workPlaceChange, boolean addressChange) {
        if (workPlaceChange && addressChange) {           // ①
            return new NextStep(NextScreen.WORK_INPUT, false);
        } else if (workPlaceChange && !addressChange) {   // ②
            return new NextStep(NextScreen.WORK_INPUT, false);
        } else if (!workPlaceChange && addressChange) {   // ③
            return new NextStep(NextScreen.ADDRESS_INPUT, false);
        } else {                                          // ④
            return new NextStep(NextScreen.COMMUTE_INFO, false);
        }
    }

    /**
     * アラート「自ら申請を行う」から遷移した場合
     *
     * ① 勤務地:変わる 住所:変わる      → (19) 申請エラー
     * ② 勤務地:変わる 住所:変わらない → (19) 申請エラー
     * ③ 勤務地:変わらない 住所:変わる → (4) → (5)  → 첫 화면 (4)
     * ④ 勤務地:変わらない 住所:変わらない → (5) → 통근경로는 반드시 변함
     *
     * ④の場合、通勤経路は必ず変わる。
     * ①〜③の場合、通勤経路は変わらない可能性もあるが、確認のため(5)へ遷移。
     */
    private NextStep handleJishin(boolean workPlaceChange, boolean addressChange) {
        if (workPlaceChange) {                            // ①, ②
            return new NextStep(NextScreen.APPLICATION_ERROR, false);
        } else if (!workPlaceChange && addressChange) {   // ③
            return new NextStep(NextScreen.ADDRESS_INPUT, false);
        } else {                                          // ④
            return new NextStep(NextScreen.COMMUTE_INFO, true); // mustChangeRoute = true
        }
    }
}