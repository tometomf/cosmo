// 作成者 : 권예성

package org.cosmo.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.TokureiForm;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

    private final TokureiMapper mapper;

    @Override
    public void saveTokurei(TokureiForm form) {

        // 더미 데이터 생성 (신규 INSERT 테스트용)
    	ShinseiDTO dto = new ShinseiDTO();

        dto.setKigyoCd(100);
        dto.setShinseiNo(mapper.getNextShinseiNo()); // 신규 생성
        dto.setTokuShinseiRiyu(form.getTokureiReason());
        dto.setShinseiKbn("01");
        dto.setShinseiRiyu("特例申請");
        dto.setShainUid(30000001);
        dto.setShinseiYmd(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")));
        dto.setShainNo("A0001");
        dto.setShinchokuKbn("0");
        dto.setGenTsukinroEndKbn("0");
        dto.setAddressChgKbn("0");
        dto.setKinmuAddressChgKbn("0");
        dto.setKyushokuHukkiKbn("0");

        mapper.insertShinseiForTokurei(dto);  // INSERT
    }
    
}
