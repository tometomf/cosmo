// 作成者 : 권예성

package org.cosmo.mapper;

import org.cosmo.domain.AlertVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiLogDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.domain.UploadFileDTO;

public interface TokureiMapper {
	
	
    void insertShinsei(ShinseiDTO dto);

    void updateShinsei(ShinseiDTO dto);
    
    void insertStartKeiro(ShinseiStartKeiroVO vo);
    
    void insertEndKeiro(ShinseiEndKeiroVO vo);
    
    void insertFuzuiShorui(ShinseiFuzuiShoruiDTO dto);
    
    void insertUploadFile(UploadFileDTO dto);
    
    void insertAlert(AlertVO vo);
    
    void insertShinseiLog(ShinseiLogDTO dto);
    
    void insertOshirase(OshiraseDTO dto);
    
    void insertProcessLog(ProcessLogDTO dto);
    
    void insertIchijiHozon(IchijiHozonDTO dto);

}
