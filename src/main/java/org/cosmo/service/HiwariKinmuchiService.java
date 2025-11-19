package org.cosmo.service;

import java.util.List;
import org.cosmo.domain.HiwariKinmuchiVO;

public interface HiwariKinmuchiService {

    HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid);

    HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo);

    List<String> getShozokuNames(Integer kigyoCd);
}