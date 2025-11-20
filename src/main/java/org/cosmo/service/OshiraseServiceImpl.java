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
    public void saveTempOshirase(ShainVO shain) {

        if (shain == null) {
            return; // 세션에 사원 정보가 없으면 아무 것도 안 함
        }

        // 세션 값 매핑 (필드명은 기존 ShainVO 사용 패턴에 맞게)
        Integer kigyoCd  = null;
        Integer shainUid = null;
        String  shainNo  = null;

        try {
            // 예: shain.getKigyo_Cd(), shain.getShain_Uid(), shain.getShain_No()
            if (shain.getKigyo_Cd() != null) {
                kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
            }
            if (shain.getShain_Uid() != null) {
                shainUid = Integer.parseInt(shain.getShain_Uid());
            }
            shainNo = shain.getShain_No();
        } catch (NumberFormatException e) {
            // 파싱 오류 시 그냥 리턴 or 로깅만 하고 넘어가도 됨
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

        // 통지자 = 자기 자신 (요구사항대로)
        dto.setTsuchishaKigyoCd(kigyoCd);
        dto.setTsuchishaCd(shainNo);

        dto.setShinseiNo(null);                       // 임시저장 시 NULL
        dto.setOshiraseNaiyo("一時保存しました。");     // 고정메시지
        dto.setKengen(null);                         // 요구사항상 NULL
        dto.setHaishinKbn(null);                     // 필요 시 "0" 등 값 설정

        dto.setAddUserId(shainUid);
        dto.setAddDate(nowTs);
        dto.setUpdUserId(shainUid);
        dto.setUpdDate(nowTs);

        oshiraseMapper.insertOshirase(dto);
    }
}
