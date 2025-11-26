package org.cosmo.service;		//조우진

import java.util.Map;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.IchijiHozonVO;
import org.cosmo.mapper.AddressInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
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

 // private final ShainMapper shainMapper; // 이건 지금 없거나 에러나니까 주석 처리 하거나 빼세요.

    @Override
    public AddressViewDto loadViewData(String shainUid) {
        AddressViewDto dto = new AddressViewDto();

        // =================================================================
        // [임시 수정] 사원 기능 연동 전까지 '가짜 데이터'로 테스트합니다.
        // 나중에 사원 기능이 완성되면 이 부분을 지우고 DB 연결 코드를 쓰세요.
        // =================================================================

        // 1. [화면 상단] 현재 주소 (가짜 데이터)
        dto.setCurrentZip("111-1111");
        dto.setCurrentPref("東京都");
        dto.setCurrentAddr1("新宿区西新宿");
        dto.setCurrentAddr2("レオパレスビル 101");

        // 2. [화면 상단] 중간 DB 주소 (여기가 핵심! 버튼 누르면 복사될 값)
        dto.setMiddleZip("9998888");       // ★ [중요] 이 값이 신주소 우편번호로 들어갑니다.
        dto.setMiddlePref("大阪府");       // 이 값이 신주소 도도부현으로 들어갑니다.
        dto.setMiddleAddr1("大阪市北区");   // 이 값이 신주소 시구정촌으로 들어갑니다.
        dto.setMiddleAddr2("梅田スカイビル"); // 이 값이 신주소 건물명으로 들어갑니다.

        /* ---------------------------------------------------------
        나중에 사원 기능(Mapper)이 생기면 아래 주석을 풀고 위 코드를 지우세요.
        ---------------------------------------------------------
        ShainVO shain = shainMapper.selectShainInfo(shainUid);
        if (shain != null) {
            dto.setCurrentZip(shain.getZipCd());
            // ... 기존 매핑 로직 ...
            
            // [핵심] DB 컬럼값을 DTO에 전달
            dto.setMiddleZip(shain.getDbZipCd()); 
        }
        */

        return dto;
    }
    
    @Override
    public void reflectMiddleAddress(AddressInputForm form, String shainUid) {
        // 1. DB에서 중간 주소(사택 주소) 정보를 가져옴
        // (기존에 만드신 selectMiddleAddress 쿼리 활용)
        AddressViewDto middle = mapper.selectMiddleAddress(shainUid);

        if (middle != null) {
            // 2. 우편번호 처리 (1234567 -> 123-4567 분리)
            String fullZip = middle.getMiddleZip1(); // Mapper에서 앞3자리만 가져왔으면 그대로 사용
            String zip2 = middle.getMiddleZip2();    // 뒤 4자리
            
            // 만약 DB에 7자리가 통으로 들어있다면 나누는 로직 필요, 
            // 현재 Mapper는 SUBSTR로 나눠서 가져오므로 그대로 세팅
            form.setZip1(middle.getMiddleZip1());
            form.setZip2(middle.getMiddleZip2());

            // 3. 주소 옮기기 (DB -> 입력폼)
            // 상단 주소창에 보이는 값을 그대로 신규 주소창에 복사
            form.setPref(middle.getMiddlePref());   // 도도부현 (예: 神奈川県)
            form.setAddr1(middle.getMiddleAddr1()); // 시구정촌 (예: 川崎市...)
            form.setAddr2(middle.getMiddleAddr2()); // 건물명 (예: レオパレス...)
            
            // 필요한 경우 입주예정일(TenyuDate) 등은 비우거나 유지
        }
    }
    @Autowired
    private AddressInputMapper addressInputMapper;

    @Override
    public void searchZipCode(AddressInputForm form) {
        // 1. 입력된 우편번호 가져오기
        String zip1 = form.getZip1();
        String zip2 = form.getZip2();

        // 2. 유효성 체크 (값이 비어있으면 조회 안 함)
        if (zip1 == null || zip1.isEmpty() || zip2 == null || zip2.isEmpty()) {
            return;
        }

        // 3. DB 조회 (Mapper 호출)
        // DB에서 '도도부현'과 '시구정촌' 정보를 가져옵니다.
        // 결과는 Map이나 별도의 DTO로 받습니다. 여기서는 Map으로 예시를 듭니다.
       Map<String, String> addressData = addressInputMapper.selectZipCode(zip1, zip2);

        // 4. 조회된 결과가 있으면 Form에 세팅
       if (addressData != null) {
          // DB 컬럼명에 맞춰서 가져옵니다 (예: PREF_NAME, ADDR_NAME)
           form.setPref(addressData.get("PREF_NAME")); 
            form.setAddr1(addressData.get("ADDR_NAME"));
        } else {
         // (선택) 조회 결과가 없을 때 처리. 예: 에러 메시지 등
           form.setPref(""); 
            form.setAddr1("");
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
            
            mapper.insertOshirase("100", shainUid,"000001", "一時保存しました。");
            System.out.println(">> ar");
            
        } catch (Exception e) {
            System.err.println("!!!!!errr!!!!!");
            e.printStackTrace();
            // 에러를 던져서 트랜잭션이 롤백되게 함 (중요)
            throw new RuntimeException("fffff", e);
        }
    }
}