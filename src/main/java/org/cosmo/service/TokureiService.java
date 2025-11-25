package org.cosmo.service;

import org.cosmo.domain.TokureiForm;

public interface TokureiService {
	
	/**
     * 특례 신청 내용을 SHINSEI 테이블에 반영
     */
    void saveTokurei(TokureiForm form);

}
