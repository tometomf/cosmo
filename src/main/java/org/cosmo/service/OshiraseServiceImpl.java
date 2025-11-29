package org.cosmo.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.mapper.OshiraseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OshiraseServiceImpl implements OshiraseService {

    @Autowired
    private OshiraseMapper oshiraseMapper;

    @Override
    public void saveTempOshirase(ShainVO shain, long setShinseiNo) {

        if (shain == null) {
            return; 
        }

  
        Integer kigyoCd  = null;
        Integer shainUid = null;
        String  shainNo  = null;

        try {
           
            if (shain.getKigyo_Cd() != null) {
                kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
            }
            if (shain.getShain_Uid() != null) {
                shainUid = Integer.parseInt(shain.getShain_Uid());
            }
            shainNo = shain.getShain_No();
        } catch (NumberFormatException e) {
          
            return;
        }

        LocalDateTime now = LocalDateTime.now();
        String tsuchiYmd = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String tsuchiHm  = now.format(DateTimeFormatter.ofPattern("HHmm"));
        Timestamp nowTs  = Timestamp.valueOf(now);

        OshiraseDTO dto = new OshiraseDTO();
        dto.setKigyoCd(kigyoCd);
        dto.setShainUid(shainUid);
        dto.setShainNo(shainNo);

        dto.setTsuchiYmd(tsuchiYmd);
        dto.setTsuchiHm(tsuchiHm);

  
        dto.setTsuchishaKigyoCd(kigyoCd);
        dto.setTsuchishaCd(shainNo);

        dto.setShinseiNo(setShinseiNo);                    
        dto.setOshiraseNaiyo("一時保存しました。");  
        dto.setKengen(null);                        
        dto.setHaishinKbn(null);                    

        dto.setAddUserId(shainUid);
        dto.setAddDate(nowTs);
        dto.setUpdUserId(shainUid);
        dto.setUpdDate(nowTs);

        oshiraseMapper.insertOshirase(dto);
    }
        
        @Override
        public void addHiwariShinseiOshirase(Integer kigyoCd,
                                             Long shainUid,
                                             String shainNo,
                                             Long shinseiNo) {

            if (kigyoCd == null || shainUid == null || shainNo == null) {
                return; 
            }

            LocalDateTime now = LocalDateTime.now();
            String tsuchiYmd = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String tsuchiHm  = now.format(DateTimeFormatter.ofPattern("HHmm"));
            Timestamp nowTs  = Timestamp.valueOf(now);

            OshiraseDTO dto = new OshiraseDTO();
            dto.setKigyoCd(kigyoCd);
            dto.setShainUid(shainUid.intValue());   // DTO가 int라서
            dto.setShainNo(shainNo);

            dto.setTsuchiYmd(tsuchiYmd);
            dto.setTsuchiHm(tsuchiHm);

            // 통지자 = 본인
            dto.setTsuchishaKigyoCd(kigyoCd);
            dto.setTsuchishaCd(shainNo);

            dto.setShinseiNo(shinseiNo);                 
            dto.setOshiraseNaiyo("日割申請が完了しました。"); 
            dto.setKengen(null);
            dto.setHaishinKbn(null);

            dto.setAddUserId(shainUid.intValue());
            dto.setAddDate(nowTs);
            dto.setUpdUserId(shainUid.intValue());
            dto.setUpdDate(nowTs);

            oshiraseMapper.insertOshirase(dto);
        }
        
     // 유지희
        @Override
        public void registHiwariTempSave(Integer kigyoCd,
                                         Long shainUid,
                                         Long shinseiNo) {

            if (kigyoCd == null || shainUid == null || shinseiNo == null) {
                return;   
            }

            LocalDateTime now = LocalDateTime.now();
            String tsuchiYmd = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String tsuchiHm  = now.format(DateTimeFormatter.ofPattern("HHmm"));
            Timestamp nowTs  = Timestamp.valueOf(now);

            OshiraseDTO dto = new OshiraseDTO();
            dto.setKigyoCd(kigyoCd);
            dto.setShainUid(shainUid.intValue()); 

         
            dto.setShainNo(null);

            dto.setTsuchiYmd(tsuchiYmd);
            dto.setTsuchiHm(tsuchiHm);

            dto.setTsuchishaKigyoCd(kigyoCd);
            dto.setTsuchishaCd(dto.getShainNo());  
            dto.setShinseiNo(shinseiNo);
            dto.setOshiraseNaiyo("通勤経路を一時保存しました。");  
            dto.setKengen(null);
            dto.setHaishinKbn(null);

            dto.setAddUserId(shainUid.intValue());
            dto.setAddDate(nowTs);
            dto.setUpdUserId(shainUid.intValue());
            dto.setUpdDate(nowTs);

            oshiraseMapper.insertOshirase(dto);
        }
}