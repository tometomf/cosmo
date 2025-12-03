package org.cosmo.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainFuzuiShoruiVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.UploadFileDTO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//김민수
public interface HuzuiNewInputService {
	
	ShainFuzuiShoruiVO getList(String kigyo_Cd,String shain_Uid);
	
	UploadFileDTO getFileList(@Param ("kigyo_Cd") String kigyo_Cd,@Param ("shain_Uid") String shain_Uid);
	
    @Transactional
    public void saveAll(ShinseiDTO shinsei,ShainVO shain,ShinseiFuzuiShoruiDTO shinseiFuzuiShorui,OshiraseDTO oshirase,ProcessLogDTO processLog); 
    
    @Transactional
    public void saveHozon(ShainVO shain,OshiraseDTO oshirase,ProcessLogDTO processLog,IchijiHozonDTO ichiji); 
    
    @Transactional
    public void addFile(UploadFileDTO UploadFile,String fNo,ShainVO shain,ShinseiDTO shinsei, Long findShinseiNo);
    
    public UploadFileDTO saveTempFile(MultipartFile file,String fileNo,String fNo,HttpSession session) throws IOException;
    
    public Long findShinseiNo(@Param ("shain")ShainVO shain);
    
    public UploadFileDTO getFile(@RequestParam("fileUid") Long fileUid);
    
    void removeShainFuzuiFile(@Param ("fNo")String fNo,@Param ("shain")ShainVO shain);
    
    boolean confirmFileUid(@Param("fileUid") Long fileUid);
}  


