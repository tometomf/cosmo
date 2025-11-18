package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.FuzuiShoruiFormDTO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.SearchCriteriaDTO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiFuzuiShoruiDTO;

public interface FuzuiShoruiService {
	
	// 1. 화면 초기 로딩에 필요한 모든 데이터를 조회합니다.
	FuzuiShoruiFormDTO getInitialData(SearchCriteriaDTO criteria); // 💡 화면에 필요한 DTO를 하나로 묶는 방법

    // 2. 입력된 데이터를 검증하고 최종 저장합니다. (트랜잭션 필요)
    void saveFuzuiShoruiData(ShinseiDTO shinsei, List<ShinseiFuzuiShoruiDTO> fuzuiList);

    // 3. 임시 저장 기능을 처리합니다. (트랜잭션 필요)
    void tempSave(IchijiHozonDTO hozonData); 
    
    // 4. 기타 마스터 데이터 조회 (선택적)
    // List<KigyoKiteiDTO> getKiteiOptions(String komokuSybtsu);
}