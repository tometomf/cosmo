// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.AlertVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
import org.cosmo.domain.ShinseiLogDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.domain.UploadFileDTO;
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
            ShinseiFuzuiShoruiDTO fuzuiDto,
            UploadFileDTO fileDto,
            AlertVO alertVo,
            ShinseiLogDTO shinseiLogDto) { 
        
        Long no = mainDto.getShinseiNo();

        // 공통 정보 미리 꺼내기
        int kigyoCd = mainDto.getKigyoCd();
        int userId = mainDto.getShainUid();

        // [수정]
        if (no != null && no > 0) {
            System.out.println(">>> [수정] 메인 정보만 업데이트");
            tokureiMapper.updateShinsei(mainDto);
            
        } else {
        // [신규]
            System.out.println(">>> [신규] 전체 INSERT 시작");
            
            // 1. 파일 저장 (ID 확보용)
            fileDto.setKigyoCd(String.valueOf(kigyoCd)); // 기업코드
            fileDto.setAddUserId(userId);                // 등록자
            tokureiMapper.insertUploadFile(fileDto);     // 저장
            
            Long newFileId = fileDto.getFileUid();       // 따온 파일 ID
            System.out.println(">>> 생성된 파일 ID: " + newFileId);
            
            // 2. 메인 신청서 저장 (번호 채번)
            tokureiMapper.insertShinsei(mainDto);
            Long newNo = mainDto.getShinseiNo();         // 따온 신청 번호
            System.out.println(">>> 생성된 신청 번호: " + newNo);
            
            // [시작 경로]
            if (newNo != null) {
                startVo.setShinseiNo(newNo.intValue()); // (Integer 변환)
            }
            startVo.setKigyoCd(kigyoCd);
            startVo.setAddUserId(userId);           

            // [종료 경로]
            if (newNo != null) {
                endVo.setShinseiNo(newNo); // (Long 가능)
            }
            endVo.setKigyoCd(kigyoCd);
            endVo.setAddUserId(userId);
            
            // [부수 서류]
            if (newNo != null) fuzuiDto.setShinseiNo(newNo);
            if (newFileId != null) fuzuiDto.setFileUid1(newFileId.intValue()); 
            fuzuiDto.setKigyoCd(kigyoCd);
            fuzuiDto.setAddUserId(userId);
            
            // [알림]
            if (newNo != null) {
                alertVo.setShinseiNo(newNo); // 신청번호 연결
            }
            alertVo.setKigyoCd(kigyoCd);
            alertVo.setShainUid(userId);
            alertVo.setShainNo(mainDto.getShainNo()); // 사원번호 필수
            
            alertVo.setAddUserId(userId);
            alertVo.setUpdUserId(userId);
            
            // [신청 로그]
            if (newNo != null) shinseiLogDto.setShinseiNo(newNo); 
            shinseiLogDto.setKigyoCd(kigyoCd);
            shinseiLogDto.setAddUserId(userId);
            
            
            // 4. 저장 실행
            tokureiMapper.insertStartKeiro(startVo);
            tokureiMapper.insertEndKeiro(endVo);
            tokureiMapper.insertFuzuiShorui(fuzuiDto);
            tokureiMapper.insertAlert(alertVo);
            tokureiMapper.insertShinseiLog(shinseiLogDto);
        
        }        
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
