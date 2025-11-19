package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextStep;

public interface IdoConfirmService {

    /**
     * 설계서 3.「次へ」ボタンをクリック 분기 로직
     *
     * @param alertType      アラート種類
     * @param workPlaceChange 勤務地が 変わる(true) / 変わらない(false)
     * @param addressChange   住所が   変わる(true) / 変わらない(false)
     */
    NextStep decideNextStep(AlertType alertType,
                            boolean workPlaceChange,
                            boolean addressChange);
}
