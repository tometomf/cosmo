// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

	// 매퍼 연결 (Lombok이 생성자 만들어줌)
    private final TokureiMapper tokureiMapper;

    @Override
    public void registerShinsei(ShinseiDTO dto) {
    	// 1. DTO에 신청번호(PK)가 들어있는지 확인
        // (long 타입이라 null 체크 대신 0보다 큰지 확인하면 됩니다)
        long no = dto.getShinseiNo();

        System.out.println(">>> Service 진입. 신청번호 확인: " + no);

        // 2. 번호가 있으면 [수정], 없으면 [신규]
        if (no > 0) {
            // ------------------------------------------------
            // [CASE A] 수정 (Update)
            // ------------------------------------------------
            System.out.println(">>> 기존 번호(" + no + ")가 존재함 -> UPDATE 실행");
            tokureiMapper.updateShinsei(dto); // (Mapper에 이거 만들었죠?)
            
        } else {
            // ------------------------------------------------
            // [CASE B] 신규 (Insert)
            // ------------------------------------------------
            System.out.println(">>> 번호 없음(0) -> INSERT 실행");
            tokureiMapper.insertShinsei(dto);
        }
        
        System.out.println(">>> Service: 처리 완료!");
    }
    
}
