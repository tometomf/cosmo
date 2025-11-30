// 作成者 : 권예성

package org.cosmo.service;

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
    	
    	// 현재 form 안에 들어온 shinseiNo 기준으로 분기
        Long shinseiNo = form.getShinseiNo();

        // ① 신규: 신청번호 없음 → INSERT
        if (shinseiNo == null || shinseiNo == 0L) {

            // 1) 신청번호 채번
            Long nextNo = mapper.getNextShinseiNo(form.getKigyoCd());
            form.setShinseiNo(nextNo);

            // 2) INSERT 실행
            mapper.insertShinseiForTokurei(form);

            System.out.println(">>> 特例申請 INSERT 실행, shinseiNo = " + nextNo);

        // ② 기존: 신청번호 있음 → UPDATE
        } else {

            // 3) UPDATE 실행
            mapper.updateTokurei(form);

            System.out.println(">>> 特例申請 UPDATE 실행, shinseiNo = " + shinseiNo);
        }

    }
    
}
