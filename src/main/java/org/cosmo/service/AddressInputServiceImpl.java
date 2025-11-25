package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;
import org.cosmo.mapper.AddressInputMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper; // JSON 변환용

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressInputServiceImpl implements AddressInputService {

    private final AddressInputMapper mapper;

    @Override
    public AddressInputForm initForm() {
        return new AddressInputForm();
    }

    @Override
    public AddressViewDto loadViewData(String shainUid) {
        // 현 주소 조회
        AddressViewDto view = mapper.selectCurrentAddress(shainUid);
        if (view == null) view = new AddressViewDto();

        // 중간 DB(사택 등) 주소 조회 - '반영' 버튼용
        AddressViewDto middle = mapper.selectMiddleAddress(shainUid);
        if (middle != null) {
            view.setMiddleDbAddress(middle.getMiddleDbAddress());
            // 필요한 경우 상세 필드도 view에 세팅
        } else {
            // 더미 데이터 (테스트용)
            view.setMiddleDbAddress("大阪府大阪市東淀川区瑞光1－1－1ハイツ瑞光３０２");
        }
        
        return view;
    }

    @Override
    public void reflectMiddleAddress(AddressInputForm form, String shainUid) {
        // DB에서 반영할 주소 정보를 다시 가져오거나, ViewDto에서 가져온 값을 사용
        // 여기서는 DB 조회 가정
        AddressViewDto middle = mapper.selectMiddleAddress(shainUid);
        if (middle != null) {
            form.setZip1(middle.getMiddleZip1());
            form.setZip2(middle.getMiddleZip2());
            form.setPref(middle.getMiddlePref());
            form.setAddr1(middle.getMiddleAddr1());
            form.setAddr2(middle.getMiddleAddr2());
        } else {
            // 테스트용 하드코딩 (설계서 예시)
            form.setZip1("533");
            form.setZip2("0005");
            form.setPref("大阪府");
            form.setAddr1("大阪市東淀川区瑞光1－1－1");
            form.setAddr2("ハイツ瑞光３０２");
        }
    }

    @Override
    public void searchZipCode(AddressInputForm form) {
        // 실제로는 DB나 API를 조회해야 함. 여기서는 Mock 처리
        if ("211".equals(form.getZip1()) && "0001".equals(form.getZip2())) {
            form.setPref("神奈川県");
            form.setAddr1("川崎市中原区新丸子");
        }
    }

    @Override
    public boolean validateAndCheckRoute(AddressInputForm form) {
        // 1. 필수 입력 체크
        if (form.getZip1() == null || form.getZip2() == null || 
            form.getPref() == null || form.getAddr1() == null || 
            form.getTenyuDate() == null || form.getTenyuDate().isEmpty()) {
            return false; // 에러
        }

        // 2. 설계서 로직: Navitime API 위도경도 취득 (Mock)
        // 3. 설계서 로직: 거리 제한 체크 (1.2km 미만 등)
        
        // 통과라 가정
        return true;
    }

    @Transactional
    @Override
    public void tempSave(AddressInputForm form, String shainUid) {
        try {
            System.out.println("===== test save=== ");
            System.out.println("user: " + shainUid);
            
            // 1. JSON 변환
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(form);
            System.out.println("date: " + json);

            // 2. VO 생성
            IchijiHozonVO vo = new IchijiHozonVO();
            vo.setUserUid(shainUid);
            vo.setActionNm("0400");
            vo.setData(json);
            
            // 3. Mapper 호출
            mapper.saveIchijiHozon(vo);
            System.out.println(">> ICHIJI_HOZON save");

            // 4. 알림 등록
            mapper.insertOshirase(shainUid, "一時保存しました。");
            System.out.println(">> ar");
            
        } catch (Exception e) {
            System.err.println("!!!!!errr!!!!!");
            e.printStackTrace();
            // 에러를 던져서 트랜잭션이 롤백되게 함 (중요)
            throw new RuntimeException("fffff", e);
        }
    }
}