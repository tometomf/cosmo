package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.IchijiHozonVO;
import org.cosmo.mapper.AddressInputMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressInputServiceImpl implements AddressInputService {

    private final AddressInputMapper mapper;
    private final GeoService geoService;

    @Override
    public AddressInputForm initForm() {
        return new AddressInputForm();
    }

    @Override
    public AddressViewDto loadViewData(String shainUid, String shinseiNo) {
        AddressViewDto dto = null;

        // =========================================================
        // ★ [핵심] 신청 전/후 분기 로직
        // =========================================================
        if (shinseiNo != null && !shinseiNo.isEmpty() && !"0".equals(shinseiNo)) {
            // 1. [신청 후] 번호가 있음 -> 신청 테이블(SHINSEI) 조회
            dto = mapper.selectShinseiData(shinseiNo);
        } else {
            // 2. [신청 전] 번호가 없음 -> 사원 마스터(SHAIN) 조회
            dto = mapper.selectShainAddress(shainUid);
        }

        // 3. (공통) 중간 DB 주소 텍스트 생성 (화면 표시용)
        if (dto != null) {
            String fullMiddleAddr = 
                (dto.getMiddlePref() == null ? "" : dto.getMiddlePref()) + " " +
                (dto.getMiddleAddr1() == null ? "" : dto.getMiddleAddr1()) + " " +
                (dto.getMiddleAddr2() == null ? "" : dto.getMiddleAddr2());
            
            dto.setMiddleDbAddress(fullMiddleAddr.trim());
        } else {
            dto = new AddressViewDto(); // Null 방지
        }
        
        return dto;
    }

    // ... (나머지 메서드는 기존과 동일) ...
    @Override public void reflectMiddleAddress(AddressInputForm form, String shainUid) {}
    @Override public void searchZipCode(AddressInputForm form) {}

    @Override
    public boolean validateAndCheckRoute(AddressInputForm form) {
        if (form.getZip1() == null || form.getZip1().isEmpty()) return false;
        if (form.getPref() == null || form.getPref().isEmpty()) return false;
        
        String fullAddress = form.getPref() + form.getAddr1() + (form.getAddr2() == null ? "" : form.getAddr2());
        GeoPoint point = geoService.getLatLng(fullAddress);
        return point != null;
    }

    @Override
    @Transactional
    // ★ [수정 포인트] 괄호 안에 변수 5개를 모두 적어줘야 합니다!
    public void tempSave(AddressInputForm form, String shainUid, String kigyoCd, String shainNo, String shozokuCd) {
        try {
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(form);
            
            IchijiHozonVO vo = new IchijiHozonVO();
            vo.setUserUid(shainUid);
            vo.setActionNm("0400");
            vo.setData(json);
            
            // ★ 받아온 소속코드 사용 (이제 에러 안 남)
            vo.setShozokuCd(shozokuCd); 
            
            // 신청구분 로직
            if (form.getZip1() != null && !form.getZip1().isEmpty()) {
                vo.setShinseiKbn("3");
            } else {
                vo.setShinseiKbn("4");
            }
            
            // 1. 일시저장
            mapper.saveIchijiHozon(vo);

            // 2. 알림 등록
            // ★ 받아온 기업코드, 사원번호 사용 (이제 에러 안 남)
            mapper.insertOshirase(kigyoCd, shainUid, shainNo, "一時保存しました。");
            
            // 3. 로그 등록
            // ★ 받아온 기업코드 사용 (이제 에러 안 남)
            mapper.insertProcessLog(kigyoCd, shainUid, vo.getShinseiKbn(), "127.0.0.1");
            
            System.out.println(">> 일시저장 완료");

        } catch (Exception e) {
            throw new RuntimeException("Temp Save Failed", e);
        }
    }
}