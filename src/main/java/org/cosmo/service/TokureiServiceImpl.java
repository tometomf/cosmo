// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.TokureiMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokureiServiceImpl implements TokureiService {

	private final TokureiMapper tokureiMapper;

	@Override
    public void registerShinsei(
            ShinseiDTO mainDto, 
            ShinseiStartKeiroVO startVo, 
            ShinseiEndKeiroVO endVo,
            ShinseiFuzuiShoruiDTO fuzuiDto) { // ★ 파라미터 4개
        
        Long no = mainDto.getShinseiNo();

        // [수정 모드]
        if (no != null && no > 0) {
            System.out.println(">>> [수정] 메인 정보만 업데이트");
            tokureiMapper.updateShinsei(mainDto);
            
        } else {
        // [신규 모드]
            System.out.println(">>> [신규] 전체 INSERT 시작");
            
            // 1. 메인 신청 정보 저장 (번호 채번됨)
            tokureiMapper.insertShinsei(mainDto);
            Long newNo = mainDto.getShinseiNo(); 
            
            // 공통 정보 (기업코드, 유저ID) 꺼내기
            int kigyoCd = mainDto.getKigyoCd();
            int userId = mainDto.getShainUid();
            
            // 2. 시작 경로 정보 저장 
            if (newNo != null) {
                startVo.setShinseiNo(newNo.intValue()); // 형변환 필요
            }
            startVo.setKigyoCd(kigyoCd);
            startVo.setAddUserId(userId);
            tokureiMapper.insertStartKeiro(startVo);

            // 3. 종료 경로 정보 저장
            if (newNo != null) {
                endVo.setShinseiNo(newNo);
            }
            endVo.setKigyoCd(kigyoCd);
            endVo.setAddUserId(userId);
            tokureiMapper.insertEndKeiro(endVo);
            
            // 4. 부수 서류 정보 저장 
            if (newNo != null) {
                fuzuiDto.setShinseiNo(newNo); 
            }
            fuzuiDto.setKigyoCd(kigyoCd);
            fuzuiDto.setAddUserId(userId);
            tokureiMapper.insertFuzuiShorui(fuzuiDto);
        }
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
