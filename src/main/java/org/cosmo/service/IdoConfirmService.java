package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.NextStep;

public interface IdoConfirmService {

    /**
     * 0200 조우진
     */
    NextStep judge(AlertType alertType, boolean kinmu, boolean jusho);
    
    KeiroInfoForm loadKeiroInfo(String shainUid);
    
    void saveKeiroInfo(KeiroInfoForm form);

}
