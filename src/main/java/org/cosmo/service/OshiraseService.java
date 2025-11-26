package org.cosmo.service;

import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ShainVO;

public interface OshiraseService {

    /**
     * 임시저장 시 "一時保存しました。" OSHIRASE 레코드 등록
     */
    void saveTempOshirase(ShainVO shain, long setShinseiNo);
    
    void addHiwariShinseiOshirase(Integer kigyoCd,
            Long shainUid,
            String shainNo,
            Long shinseiNo);
    
}
