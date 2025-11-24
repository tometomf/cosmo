package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;

public interface AddressInputService {
    AddressInputForm initForm();
    AddressViewDto loadViewData(String shainUid);
    
    // 반영 버튼 로직
    void reflectMiddleAddress(AddressInputForm form, String shainUid);
    
    // 우편번호 검색 로직
    void searchZipCode(AddressInputForm form);
    
    // 유효성 검사 및 네비타임 체크 (Next 버튼용)
    boolean validateAndCheckRoute(AddressInputForm form);
    
    // 임시 저장
    void tempSave(AddressInputForm form, String shainUid);
}