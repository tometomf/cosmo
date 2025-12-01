// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

	private final TokureiMapper tokureiMapper;

	@Override
    public void registerShinsei(ShinseiDTO mainDto, ShinseiStartKeiroVO startVo, ShinseiEndKeiroVO endVo) {
        
        Long no = mainDto.getShinseiNo();

        if (no != null && no > 0) {
            // [수정 모드] 
            System.out.println(">>> [수정] 메인 정보만 업데이트");
            tokureiMapper.updateShinsei(mainDto);
            
        } else {
            // [신규 모드]
            System.out.println(">>> [신규] 전체 INSERT 시작");
            
            // 1. 메인 저장 (번호 채번)
            tokureiMapper.insertShinsei(mainDto);
            Long newNo = mainDto.getShinseiNo();
            
            // 2. 시작 경로 저장 (번호 연결)
            // intValue() 추가
            if (newNo != null) {
                startVo.setShinseiNo(newNo.intValue()); 
            }
            startVo.setKigyoCd(mainDto.getKigyoCd());
            startVo.setAddUserId(mainDto.getShainUid());
            tokureiMapper.insertStartKeiro(startVo);

            // 3. 종료 경로 저장 (번호 연결)
            endVo.setShinseiNo(newNo);
            endVo.setKigyoCd(mainDto.getKigyoCd());
            endVo.setAddUserId(mainDto.getShainUid());
            tokureiMapper.insertEndKeiro(endVo);
        }
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
