package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;
import org.cosmo.mapper.AddressInputMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressInputServiceImpl implements AddressInputService {

    // 기존에 가지고 계신 매퍼 하나만 사용합니다.
    private final AddressInputMapper mapper; 

    @Override
    public AddressInputForm initForm() {
        return new AddressInputForm();
    }

    @Override
    public AddressViewDto loadViewData(String shainUid) {
        // 1. ★수정됨★ ShainMapper 대신 기존 mapper를 사용해 DTO를 바로 조회합니다.
        // (AddressInputMapper.xml에 selectShainAddress 쿼리를 추가했어야 합니다)
        AddressViewDto dto = mapper.selectShainAddress(shainUid);

        if (dto != null) {
            // 2. [화면 상단] 중간 DB 주소 텍스트 만들기
            // (이미 Mapper에서 컬럼 매핑을 다 해서 가져왔으므로, 합치기만 하면 됩니다)
            String fullMiddleAddr = 
                (dto.getMiddlePref() == null ? "" : dto.getMiddlePref()) + " " +
                (dto.getMiddleAddr1() == null ? "" : dto.getMiddleAddr1()) + " " +
                (dto.getMiddleAddr2() == null ? "" : dto.getMiddleAddr2());
            
            // 화면에 보여줄 텍스트 세팅
            dto.setMiddleDbAddress(fullMiddleAddr.trim());
            
            // 참고: 나머지 필드(currentZip, middleZip 등)는 
            // XML 쿼리에서 이미 DTO 필드명과 매칭시켜 가져왔으므로 별도 세팅 불필요
            
        } else {
            // 데이터가 없을 경우 빈 객체 리턴하여 NullPointerException 방지
            dto = new AddressViewDto();
            dto.setCurrentZip("");
            dto.setMiddleZip("");
        }

        return dto;
    }
    
    @Override
    public void reflectMiddleAddress(AddressInputForm form, String shainUid) {
        // (사용 안 함: JSP 자바스크립트에서 처리)
    }

    @Override
    public void searchZipCode(AddressInputForm form) {
        // (사용 안 함: JSP AjaxZip3 라이브러리에서 처리)
    }

    @Override
    public boolean validateAndCheckRoute(AddressInputForm form) {
        if (form.getZip1() == null || form.getZip1().isEmpty()) return false;
        if (form.getPref() == null || form.getPref().isEmpty()) return false;
        return true;
    }

    @Override
    @Transactional
    public void tempSave(AddressInputForm form, String shainUid) {
        try {
            System.out.println("===== [Service] 일시저장 시작 =====");
            System.out.println("User: " + shainUid);
            
            // 1. JSON 변환
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(form);
            
            // 2. VO 생성 및 데이터 세팅
            IchijiHozonVO vo = new IchijiHozonVO();
            vo.setUserUid(shainUid);
            vo.setActionNm("0400"); // 화면 ID
            vo.setData(json);       // JSON 데이터
            // 필요한 경우 ShozokuCd, ShinseiKbn 등 추가 세팅
            
            // 3. DB 저장 (기존 mapper 사용)
            mapper.saveIchijiHozon(vo);
            System.out.println(">> ICHIJI_HOZON 저장 완료");

            // 4. 알림 등록 (기존 mapper 사용)
            // 파라미터 순서나 개수는 AddressInputMapper 인터페이스 정의에 맞춰주세요.
            mapper.insertOshirase("100", shainUid, "000001", "一時保存しました。");
            System.out.println(">> 알림 등록 완료");
            
        } catch (Exception e) {
            System.err.println("!!!!! 저장 중 에러 발생 !!!!!");
            e.printStackTrace();
            // 트랜잭션 롤백을 위해 런타임 예외 발생
            throw new RuntimeException("일시저장 실패", e);
        }
    }
}