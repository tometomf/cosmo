package org.cosmo.service;

import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;

public interface ShinseiService {
    ShinseiJyohouVO getShinseiJyohou(Long shinseiNo);
    ShinseiKeiroVO getShinseiKeiro(Long shinseiNo);
}
