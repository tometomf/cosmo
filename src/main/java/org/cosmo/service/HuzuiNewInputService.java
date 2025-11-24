package org.cosmo.service;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.springframework.transaction.annotation.Transactional;

public interface HuzuiNewInputService {
	
	ShainFuzuiShoruiVO getList(String kigyo_Cd,String shain_Uid);
	
	void fileUpload(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid,@Param ("fileNo") int fileNo, @Param("fileUid") Long fileUid);
	
    @Transactional
    public void saveAll(ShinseiDTO shinsei,ShainVO shain,ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,OshiraseDTO oshirase,ProcessLogDTO processLog); 
    
    @Transactional
    public void saveHozon(ShainVO shain,OshiraseDTO oshirase,ProcessLogDTO processLog,IchijiHozonDTO ichiji); 
}  


