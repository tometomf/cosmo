// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiEndKeiroVO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;
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
            UploadFileDTO fileDto) { 
        
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
            
            // 0. 파일 정보 먼저 저장 (FILE_UID 따기 위함)
            fileDto.setKigyoCd(String.valueOf(kigyoCd)); // 기업코드
            fileDto.setAddUserId(userId);                // 등록자
            tokureiMapper.insertUploadFile(fileDto);     // 저장
            
            Long newFileId = fileDto.getFileUid();       // 따온 파일 ID
            System.out.println(">>> 생성된 파일 ID: " + newFileId);
            
            // 1. 메인 신청 정보 저장 (SHINSEI_NO 따기 위함)
            tokureiMapper.insertShinsei(mainDto);
            Long newNo = mainDto.getShinseiNo();         // 따온 신청 번호
            System.out.println(">>> 생성된 신청 번호: " + newNo);
            
            // 2. 시작 경로 정보 저장
            if (newNo != null) {
                startVo.setShinseiNo(newNo.intValue()); // (Integer 변환)
            }
            startVo.setKigyoCd(kigyoCd);
            startVo.setAddUserId(userId);
            tokureiMapper.insertStartKeiro(startVo);

            // 3. 종료 경로 정보 저장
            if (newNo != null) {
                endVo.setShinseiNo(newNo); // (Long 가능)
            }
            endVo.setKigyoCd(kigyoCd);
            endVo.setAddUserId(userId);
            tokureiMapper.insertEndKeiro(endVo);
            
            // 4. 부수 서류 정보 저장 (파일 ID 연결)
            if (newNo != null) {
                fuzuiDto.setShinseiNo(newNo); // (Long 가능)
            }
            fuzuiDto.setKigyoCd(kigyoCd);
            fuzuiDto.setAddUserId(userId);
            
            // 아까 딴 파일 ID를 여기에 연결!
            if (newFileId != null) {
                fuzuiDto.setFileUid1(newFileId.intValue()); 
            }
            
            tokureiMapper.insertFuzuiShorui(fuzuiDto);
        }
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
