// 作成者 : 권예성

package org.cosmo.service;

import org.cosmo.domain.AlertVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.OshiraseDTO;
import org.cosmo.domain.ProcessLogDTO;
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
            ShinseiLogDTO shinseiLogDto,
            OshiraseDTO oshiraseDto,
            ProcessLogDTO processLogDto,
            IchijiHozonDTO ichijiDto) { 
        
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
            
            // 1. 파일 저장 (ID 확보)
            fileDto.setKigyoCd(String.valueOf(kigyoCd)); // 기업코드
            fileDto.setAddUserId(userId);                // 등록자
            tokureiMapper.insertUploadFile(fileDto);     // 저장
            
            Long newFileId = fileDto.getFileUid();       // 따온 파일 ID
            System.out.println(">>> 생성된 파일 ID: " + newFileId);
            
            // 2. 메인 신청서 저장 (번호 채번)
            tokureiMapper.insertShinsei(mainDto);
            Long newNo = mainDto.getShinseiNo();         // 따온 신청 번호
            System.out.println(">>> 생성된 신청 번호: " + newNo);
            
            // 공통 데이터 세팅
            if (newNo != null) {
                // 번호 연결 (VO 타입에 따라 형변환)
                startVo.setShinseiNo(newNo.intValue()); // (Integer)
                endVo.setShinseiNo(newNo);              // (Long)
                fuzuiDto.setShinseiNo(newNo);           // (Long)
                alertVo.setShinseiNo(newNo);            // (Long)
                shinseiLogDto.setShinseiNo(newNo);      // (Long)
                oshiraseDto.setShinseiNo(newNo);        // (Long)
                processLogDto.setKey3(String.valueOf(newNo)); // KEY3에 신청번호 저장
            }

            // 기업코드 & 유저ID 연결
            startVo.setKigyoCd(kigyoCd);    startVo.setAddUserId(userId);
            endVo.setKigyoCd(kigyoCd);      endVo.setAddUserId(userId);
            fuzuiDto.setKigyoCd(kigyoCd);   fuzuiDto.setAddUserId(userId);
            alertVo.setKigyoCd(kigyoCd);    alertVo.setAddUserId(userId);
            shinseiLogDto.setKigyoCd(kigyoCd); shinseiLogDto.setAddUserId(userId);
            oshiraseDto.setKigyoCd(kigyoCd); oshiraseDto.setAddUserId(userId);
            processLogDto.setKey1(String.valueOf(kigyoCd)); processLogDto.setUserUid(userId);
            ichijiDto.setUserUid(userId); // PK 설정
            
            // 경고 전용 추가 세팅
            alertVo.setShainUid(userId);    
            alertVo.setShainNo(mainDto.getShainNo());
            
            // 통지 전용 추가 세팅
            oshiraseDto.setShainUid(userId); 
            oshiraseDto.setShainNo(mainDto.getShainNo());
            oshiraseDto.setUpdUserId(userId);

            // 파일 ID 연결
            if (newFileId != null) {
                fuzuiDto.setFileUid1(newFileId.intValue());
            }
            
            // BLOB 데이터 더미로 생성 (문자열 -> byte[])
            String dummyContent = "This is dummy blob data.";
            ichijiDto.setData(dummyContent.getBytes());
            
            // 3. 저장 실행
            tokureiMapper.insertStartKeiro(startVo);
            tokureiMapper.insertEndKeiro(endVo);
            tokureiMapper.insertFuzuiShorui(fuzuiDto);
            tokureiMapper.insertAlert(alertVo);
            tokureiMapper.insertShinseiLog(shinseiLogDto);
            tokureiMapper.insertOshirase(oshiraseDto);
            tokureiMapper.insertProcessLog(processLogDto);
            tokureiMapper.insertIchijiHozon(ichijiDto);
        
        }        
        
        System.out.println(">>> Service 처리 완료!");
    }
    
}
