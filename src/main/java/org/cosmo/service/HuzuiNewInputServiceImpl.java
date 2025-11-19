package org.cosmo.service;

import org.cosmo.domain.ShainFuzuiShoruiHuzuiNewInputVO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HuzuiNewInputServiceImpl implements HuzuiNewInputService {

	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@Override
	public ShainFuzuiShoruiHuzuiNewInputVO getList(int kigyo_Cd, int shain_Uid) {

		
		
		return huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
	}
	
}
