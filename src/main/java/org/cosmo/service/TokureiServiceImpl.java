// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

	private final TokureiMapper tokureiMapper;

    @Override
    // (인터페이스도 파라미터 1개로 다시 돌려놓으세요: void registerShinsei(ShinseiDTO dto);)
    public void registerShinsei(ShinseiDTO dto) {
        
        Long no = dto.getShinseiNo();
        System.out.println(">>> [Service] 전달받은 번호: " + no);

        if (no != null && no > 0) {
            // [수정] 번호가 있다 -> UPDATE
            System.out.println(">>> 기존 번호 존재 -> UPDATE 실행");
            tokureiMapper.updateShinsei(dto);
            
        } else {
            // [신규] 번호가 없다(0) -> INSERT
            System.out.println(">>> 번호 없음(0) -> INSERT 실행");
            tokureiMapper.insertShinsei(dto);
            
            System.out.println(">>> 채번된 새 번호: " + dto.getShinseiNo());
        }
    }
    
}
