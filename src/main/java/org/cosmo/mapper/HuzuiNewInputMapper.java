package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;

@Mapper
public interface HuzuiNewInputMapper {

	ShainFuzuiShoruiVO getList(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid);
	
	void fileUpload(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid,@Param ("fileNo") int fileNo, @Param("fileUid") Long uniqueId);
	
	void addFuzuiShorui(@Param ("shinseiFuzuiShorui")ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,@Param ("shain")ShainVO shain);
}
