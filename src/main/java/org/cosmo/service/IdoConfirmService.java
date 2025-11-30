package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.IdoConfirmViewDto; // ★ 1. 이 import가 추가되어야 함
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.NextStep;

public interface IdoConfirmService {

    /**
     * 0200 조우진
     */
    NextStep judge(AlertType alertType, boolean kinmu, boolean jusho);
    
    KeiroInfoForm loadKeiroInfo(String shainUid);
    
    void saveKeiroInfo(KeiroInfoForm form);

    // ★ 2. 이 줄이 반드시 추가되어야 컨트롤러 에러가 사라집니다.
    IdoConfirmViewDto loadDisplayData(String kigyoCd, String shainUid, String shinseiNo);

}