package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.*; // 필요한 DTO들을 임포트해야 합니다.
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션을 위해 필요

import lombok.Setter;

@Service
public class FuzuiShoruiServiceImpl implements FuzuiShoruiService {
	
	@Setter(onMethod_ = @Autowired)
	private ShinseiMapper shinseiMapper; // 실제로는 FuzuiShoruiMapper가 더 적절합니다.

	// 1. [필수 구현] 화면 초기 로딩에 필요한 모든 데이터를 조회합니다.
    @Override
	public FuzuiShoruiFormDTO getInitialData(SearchCriteriaDTO criteria) {
        
        // TODO: ShinseiMapper를 사용하여 필요한 데이터를 조회하고 FuzuiShoruiFormDTO에 담아 반환해야 합니다.
        // 예시: 
        // ShinseiDTO shinsei = shinseiMapper.selectShinseiDetail(criteria.getKigyoCd(), criteria.getShinseiNo());
        // List<ShinseiFuzuiShoruiDTO> fuzuiList = shinseiMapper.selectFuzuiShoruiList(criteria.getKigyoCd(), criteria.getShinseiNo());
        
        // 임시 반환 (실제 로직 구현 필요)
		return new FuzuiShoruiFormDTO(null, null, null); 
	}
    
    // 2. [필수 구현] 입력된 데이터를 검증하고 최종 저장합니다. (트랜잭션 필요)
    @Transactional
    @Override
    public void saveFuzuiShoruiData(ShinseiDTO shinsei, List<ShinseiFuzuiShoruiDTO> fuzuiList) {
        // TODO: SHINSEI 테이블 업데이트 및 SHINSEI_FUZUI_SHORUI 저장 로직 구현
    }

    // 3. [필수 구현] 임시 저장 기능을 처리합니다. (트랜잭션 필요)
    @Transactional
    @Override
    public void tempSave(IchijiHozonDTO hozonData) {
        // TODO: ICHIJI_HOZON, PROCESS_LOG, OSHIRASE 테이블 저장 로직 구현
    }

    // 기존의 getList()는 인터페이스에 없으므로 삭제하거나 이름을 변경해야 합니다.
    // public List<ShinseiDTO> selectShinseiList() {
    //     return shinseiMapper.selectShinseiList();
    // }
}