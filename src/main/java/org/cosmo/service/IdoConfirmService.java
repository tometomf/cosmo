package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.NextStep;

public interface IdoConfirmService {

    /**
     * 0200
     */
    NextStep judge(AlertType alertType, boolean kinmu, boolean jusho);
    
 // [추가] 경로 정보 화면 데이터 로드
    KeiroInfoForm loadKeiroInfo(String shainUid);
    
    // [추가] 경로 정보 저장 (다음 버튼 누를 때 등)
    void saveKeiroInfo(KeiroInfoForm form);

}
