package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.NextStep;

public interface IdoConfirmService {

    /**
     * 0200
     */
    NextStep judge(AlertType alertType, boolean kinmu, boolean jusho);

}
