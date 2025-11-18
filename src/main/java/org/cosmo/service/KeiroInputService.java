package org.cosmo.service;

import org.cosmo.domain.ShainKeiroDTO;

public interface KeiroInputService {

    ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq);

}
