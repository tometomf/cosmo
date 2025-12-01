// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

	private final TokureiMapper tokureiMapper;

    @Override
public void registerShinsei(ShinseiDTO mainDto, ShinseiStartKeiroVO keiroVo) {
        
        // 1. 번호 확인 (수정/신규 판단용)
        Long no = mainDto.getShinseiNo();
        System.out.println(">>> [Service] 전달받은 번호: " + no);

        if (no != null && no > 0) {
            // [수정 모드] (UPDATE)
            System.out.println(">>> 기존 번호 존재 -> UPDATE 실행");
            tokureiMapper.updateShinsei(mainDto);
            
            // (경로 정보 수정 로직은 나중에... 일단 패스)

        } else {
            // INSERT
            System.out.println(">>> 번호 없음(0) -> INSERT 실행");
            
            // 1) 신청 정보 저장 (번호 자동 채번)
            tokureiMapper.insertShinsei(mainDto);
            
            // 2) 채번된 번호 꺼내기
            Long newNo = mainDto.getShinseiNo();
            System.out.println(">>> 채번된 새 번호: " + newNo);
            
            // 3) ★ 경로 정보에 번호 심어주기 (연결)
            // (만약 VO의 shinseiNo가 Integer면 .intValue() 붙이세요)
            if (newNo != null) {
                keiroVo.setShinseiNo(newNo.intValue()); 
            }
            
            keiroVo.setKigyoCd(mainDto.getKigyoCd());
            keiroVo.setAddUserId(mainDto.getShainUid());
            
            // 4) ★ 경로 정보 저장 명령! (이게 있어야 함)
            tokureiMapper.insertStartKeiro(keiroVo);
        }
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
