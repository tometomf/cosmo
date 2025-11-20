package org.cosmo.service;

import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HuzuiNewInputServiceImpl implements HuzuiNewInputService {

	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@Override
	public ShainFuzuiShoruiVO getList(String kigyo_Cd, String shain_Uid) {

		
		
		return huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
	}

	@Override
	public void fileUpload(String kigyo_Cd, String shain_Uid, int fileNo, Long fileUid) {

		huzuiNewInputMapper.fileUpload(kigyo_Cd, shain_Uid, fileNo, fileUid);
	}

	@Override
	public void addFuzuiShorui(ShinseiFuzuiShoruiDTO shinseiFuzuiShorui, ShainVO shain) {

		huzuiNewInputMapper.addFuzuiShorui(shinseiFuzuiShorui, shain);
	}


	
	

	
	
	
}
