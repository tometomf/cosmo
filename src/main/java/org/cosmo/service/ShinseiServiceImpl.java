package org.cosmo.service;

import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class ShinseiServiceImpl implements ShinseiService {

    @Autowired
    private ShinseiMapper shinseiMapper;

    @Override
    public ShinseiJyohouVO getShinseiJyohou(Long shinseiNo) {
        return shinseiMapper.getShinseiJyohou(shinseiNo);
    }
    
    @Override
    public ShinseiKeiroVO getShinseiKeiro(Long shinseiNo) {
    	return shinseiMapper.getShinseiKeiro(shinseiNo);
    }
    
}
