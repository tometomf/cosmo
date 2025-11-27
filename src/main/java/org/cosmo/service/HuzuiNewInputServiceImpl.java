package org.cosmo.service;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.mapper.HuzuiNewInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//김민수
@Service
public class HuzuiNewInputServiceImpl implements HuzuiNewInputService {

	@Autowired
	private HuzuiNewInputMapper huzuiNewInputMapper;

	@Override
	public ShainFuzuiShoruiVO getList(String kigyo_Cd, String shain_Uid) {

		
		
		return huzuiNewInputMapper.getList(kigyo_Cd, shain_Uid);
	}

	@Override
	public void fileUpload(String kigyo_Cd, String shain_Uid, String fileNo, Long fileUid) {

		huzuiNewInputMapper.fileUpload(kigyo_Cd, shain_Uid, fileNo, fileUid);
	}

	@Override
	public void saveAll(ShinseiDTO shinsei, ShainVO shain, ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,
			OshiraseDTO oshirase,ProcessLogDTO processLog) {
		// TODO Auto-generated method stub
		huzuiNewInputMapper.addFuzuiShorui(shinseiFuzuiShorui, shain);
		huzuiNewInputMapper.addShinsei(shinsei, shain);
		huzuiNewInputMapper.updateAlert(shinsei, shain);
		huzuiNewInputMapper.addShinseiLog(shinsei, shain);
		huzuiNewInputMapper.addFuzuiShoruiLog(shinseiFuzuiShorui, shain);
        huzuiNewInputMapper.addOshirase(oshirase, shain);
        huzuiNewInputMapper.addProcessLog(processLog, shain);
	}

	@Override
	public void saveHozon(ShainVO shain, OshiraseDTO oshirase, ProcessLogDTO processLog, IchijiHozonDTO ichiji) {
		huzuiNewInputMapper.addHozonOshirase(oshirase, shain);
		huzuiNewInputMapper.addHozonProcessLog(processLog, shain);
		huzuiNewInputMapper.addIchijiHozon(ichiji, shain);
		
	}

	@Override
	public void addFile(UploadFileDTO UploadFile, ShainVO shain) {
		// TODO Auto-generated method stub
		huzuiNewInputMapper.addFile(UploadFile, shain);
	}

	


	
	

	
	
	
}
