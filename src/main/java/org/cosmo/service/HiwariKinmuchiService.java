package org.cosmo.service;

import org.cosmo.domain.HiwariKinmuchiVO;

public interface HiwariKinmuchiService {

    HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid);

    HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo);
}