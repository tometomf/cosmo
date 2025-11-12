package org.cosmo.service;

import org.cosmo.domain.ShinseiDetailVO;

public interface ShinseiService {

    
    ShinseiDetailVO getShinseiDetail(int kigyoCd, int shinseiNo);
}
