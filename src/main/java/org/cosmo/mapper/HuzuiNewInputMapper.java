package org.cosmo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;

//김민수
@Mapper
public interface HuzuiNewInputMapper {

	ShainFuzuiShoruiVO getList(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid);
	
	
	void addFuzuiShorui(@Param ("shinseiFuzuiShorui")ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,@Param ("shain")ShainVO shain);

	void addShinsei(@Param ("shinsei")ShinseiDTO shinsei,@Param ("shain")ShainVO shain);
	
	void updateAlert(@Param ("shinsei")ShinseiDTO shinsei,@Param ("shain")ShainVO shain);
	
	void addShinseiLog(@Param ("shinsei")ShinseiDTO shinsei,@Param ("shain")ShainVO shain);
	
	void addFuzuiShoruiLog(@Param ("shinseiFuzuiShorui")ShinseiFuzuiShoruiDTO shinsei,@Param ("shain")ShainVO shain);
	
	void addOshirase(@Param ("oshirase")OshiraseDTO oshirase,@Param ("shain")ShainVO shain);
	
	void addHozonOshirase(@Param ("oshirase")OshiraseDTO oshirase,@Param ("shain")ShainVO shain);
	
	void addProcessLog(@Param ("processLog")ProcessLogDTO processLog,@Param ("shain")ShainVO shain);
	
	void addHozonProcessLog(@Param ("processLog")ProcessLogDTO processLog,@Param ("shain")ShainVO shain);
	
	void addIchijiHozon(@Param ("ichiji")IchijiHozonDTO ichiji,@Param ("shain")ShainVO shain);
	
	void addFile(@Param ("UploadFile")UploadFileDTO UploadFile,@Param ("shain")ShainVO shain);
	
	void fileUpdate(@Param ("UploadFile")UploadFileDTO UploadFile,@Param ("fNo")String fNo,@Param ("shain")ShainVO shain);
	
}
