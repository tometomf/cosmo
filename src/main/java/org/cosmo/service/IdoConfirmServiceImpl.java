package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.springframework.stereotype.Service;

@Service
public class IdoConfirmServiceImpl implements IdoConfirmService {

    @Override
    public NextStep judge(AlertType alertType, boolean kinmu, boolean jusho) {

        // ============================================================
        // Case 1: IDOU(이동) / ITEN(이전)에서 천이된 경우
        // 설계서: 근무지는 '변한다'가 고정 상태여야 함 (변하지 않음 선택 시 에러)
        // ============================================================
        if (alertType == AlertType.IDOU_ITEN) {
            // ① 근무:변함 / 주소:변함 => (3) 근무지입력 -> (4) 주소 -> (5) 경로
            if (kinmu && jusho) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            // ② 근무:변함 / 주소:안변함 => (3) 근무지입력 -> (5) 경로
            if (kinmu && !jusho) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            // ③, ④ 근무:안변함 => 선택 불가 (에러 처리)
            if (!kinmu) {
                // 설계서상 선택 불가능한 조합이 들어온 경우
                return new NextStep(NextScreen.APPLICATION_ERROR, false);
            }
        }

        // ============================================================
        // Case 2: SONOTA(그 외)에서 천이된 경우
        // ============================================================
        if (alertType == AlertType.SONOTA) {
            // ① 근무:변함 / 주소:변함 => (3) 근무지입력
            // ② 근무:변함 / 주소:안변함 => (3) 근무지입력
            if (kinmu) {
                return new NextStep(NextScreen.WORK_INPUT, false);
            }
            
            // ③ 근무:안변함 / 주소:변함 => (4) 주소입력
            if (!kinmu && jusho) {
                return new NextStep(NextScreen.ADDRESS_INPUT, false);
            }

            // ④ 근무:안변함 / 주소:안변함 => (5) 경로정보
            if (!kinmu && !jusho) {
                return new NextStep(NextScreen.COMMUTE_INFO, false);
            }
        }

        // ============================================================
        // Case 3: JISHIN(자신/자율신청) - 통근교통비신청
        // 설계서: "근무지=변한다"를 선택하고 다음 클릭 시 (19) 에러 화면
        // ============================================================
        if (alertType == AlertType.JISHIN) {
            // ①, ② 근무:변함 => (19) 신청 에러 화면
            if (kinmu) {
                return new NextStep(NextScreen.APPLICATION_ERROR, false);
            }

            // ③ 근무:안변함 / 주소:변함 => (4) 주소입력
            if (!kinmu && jusho) {
                return new NextStep(NextScreen.ADDRESS_INPUT, false);
            }

            // ④ 근무:안변함 / 주소:안변함 => (5) 경로정보
            // *단, 이 경우 통근경로는 반드시 변함 (mustChangeRoute = true)
            if (!kinmu && !jusho) {
                return new NextStep(NextScreen.COMMUTE_INFO, true);
            }
        }

        // 그 외 예기치 못한 케이스는 에러 처리
        return new NextStep(NextScreen.APPLICATION_ERROR, false);
    }
}