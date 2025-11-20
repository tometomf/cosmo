package org.cosmo.service;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;

public interface HuzuiNewInputService {
	
	ShainFuzuiShoruiVO getList(String kigyo_Cd,String shain_Uid);
	
	void fileUpload(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid,@Param ("fileNo") int fileNo, @Param("fileUid") Long fileUid);
	
	void addFuzuiShorui(@Param ("shinseiFuzuiShorui")ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,@Param ("shain")ShainVO shain);
}
