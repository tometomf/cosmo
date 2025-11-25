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

    @Override							//test 미완성
	public AddressViewDto loadViewData(String shainUid) {
		System.out.println("========== [디버깅 시작] loadViewData ==========");
		System.out.println("1. 조회하려는 사용자 ID: " + shainUid);

		// 1. 현주소 가져오기
		AddressViewDto view = mapper.selectCurrentAddress(shainUid);
		if (view == null) {
			System.out.println("2. [주의] 현주소(SHAIN) 데이터가 없습니다!");
			view = new AddressViewDto();
		} else {
			System.out.println("2. 현주소 조회 성공: " + view.getCurrentPref());
		}

		// 2. 중간DB 주소 가져오기 (MIDDLE_DB_TABLE)
		AddressViewDto middle = mapper.selectMiddleAddress(shainUid);

		if (middle != null) {
			System.out.println("3. [성공] 중간DB 데이터 찾음!");
			System.out.println("   - 우편번호: " + middle.getMiddleZip1());
			System.out.println("   - 도도부현: " + middle.getMiddlePref());
			System.out.println("   - 주소1: " + middle.getMiddleAddr1());

			// 뷰 객체에 데이터 담기
			view.setMiddleZip1(middle.getMiddleZip1());
			view.setMiddleZip2(middle.getMiddleZip2());
			view.setMiddlePref(middle.getMiddlePref());
			view.setMiddleAddr1(middle.getMiddleAddr1());
			view.setMiddleAddr2(middle.getMiddleAddr2());
		} else {
			System.out.println("3. [실패] 중간DB(MIDDLE_DB_TABLE)에서 데이터를 못 찾았습니다. (NULL)");
		}
		
		System.out.println("========== [디버깅 종료] ==========");
		return view;
	}

    @Override
	public void reflectMiddleAddress(AddressInputForm form, String shainUid) {
		// 1. DB에서 중간 주소 정보를 가져옴
		AddressViewDto middle = mapper.selectMiddleAddress(shainUid);

		if (middle != null) {
			
			// =========================================================
			// 1. 우편번호 처리 (하이픈 유무에 따라 쪼개기)
			// =========================================================
			String fullZip = middle.getMiddleZip1();
			if (fullZip != null && !fullZip.isEmpty()) {
				if (fullZip.contains("-")) {
					String[] parts = fullZip.split("-");
					if (parts.length >= 1) form.setZip1(parts[0]);
					if (parts.length >= 2) form.setZip2(parts[1]);
				} else if (fullZip.length() == 7) {
					form.setZip1(fullZip.substring(0, 3));
					form.setZip2(fullZip.substring(3));
				} else {
					form.setZip1(fullZip);
				}
			}

			// =========================================================
			// 2. 주소 자르기 (설계서 요구사항 반영)
			// "중간DB주소1"을 분석해서 [도도부현]과 [나머지 주소]로 나눔
			// =========================================================
			String rawAddr1 = middle.getMiddleAddr1(); // 예: "神奈川県川崎市高津区..."
			
			if (rawAddr1 != null && !rawAddr1.isEmpty()) {
				// 도, 도, 부, 현 중 어디서 잘라야 할지 위치를 찾음
				int splitIndex = -1;
				
				// 일본 주소 특성상 보통 3~4번째 글자에 현(県) 등이 위치함
				String[] suffixes = {"県", "都", "道", "府"};
				
				for (String suffix : suffixes) {
					int idx = rawAddr1.indexOf(suffix);
					// 보통 도도부현은 맨 앞에 오므로 인덱스가 2 또는 3 (0부터 시작하므로)
					// 예: [0]東[1]京[2]都 -> index 2
					// 예: [0]神[1]奈[2]川[3]県 -> index 3
					if (idx >= 2 && idx <= 3) {
						splitIndex = idx + 1; // 글자 다음부터 잘라야 하므로 +1
						break; // 찾았으면 반복 종료
					}
				}

				if (splitIndex > 0) {
					// 찾은 위치를 기준으로 앞부분은 '도도부현', 뒷부분은 '주소1'
					form.setPref(rawAddr1.substring(0, splitIndex)); // "神奈川県"
					form.setAddr1(rawAddr1.substring(splitIndex));   // "川崎市高津区..."
				} else {
					// 못 찾았으면 (혹은 이미 잘려있거나 형식이 다르면)
					// 일단 도도부현 칸에 넣을지, 주소 칸에 넣을지 결정 (여기선 도도부현이 비어있으면 도도부현으로 간주)
					if (middle.getMiddlePref() != null && !middle.getMiddlePref().isEmpty()) {
						form.setPref(middle.getMiddlePref());
						form.setAddr1(rawAddr1);
					} else {
						// 비상시: 그냥 주소1에 통째로 넣음
						form.setPref(""); 
						form.setAddr1(rawAddr1);
					}
				}
			} else {
				// 주소1이 아예 없는 경우
				form.setPref(middle.getMiddlePref()); // 혹시 PREF 컬럼에 따로 있으면 그거라도 씀
				form.setAddr1("");
			}

			// =========================================================
			// 3. 건물명 (주소2) 처리
			// =========================================================
			form.setAddr2(middle.getMiddleAddr2());
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
            // form.setPref(""); 
            // form.setAddr1("");
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