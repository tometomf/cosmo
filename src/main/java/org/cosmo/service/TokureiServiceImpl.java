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

    	int kigyoCd = 100; // 임시 (로그인 후 session 값으로 대체 예정)
    	
    	 int shinseiNo;
    	    if (form.getShinseiNo() == null || form.getShinseiNo().trim().isEmpty()) {
    	        shinseiNo = 1; // ← 테스트용 기본값
    	    } else {
    	        shinseiNo = Integer.parseInt(form.getShinseiNo());
    	    }
        
        String reason = form.getTokureiReason();

        System.out.println(">>> TokureiServiceImpl.saveTokurei()");
        System.out.println(" kigyoCd      = " + kigyoCd);
        System.out.println(" shinseiNo    = " + shinseiNo);
        System.out.println(" reason       = " + reason);

        int result = mapper.updateTokurei(kigyoCd, shinseiNo, reason);

        if (result == 0) {
            throw new RuntimeException("SHINSEI 테이블 업데이트 실패!");
        }
    }
    
    
}
