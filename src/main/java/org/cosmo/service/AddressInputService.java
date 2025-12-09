package org.cosmo.service;		//조우진

import org.cosmo.domain.AddressInputForm;
//조우진
import org.cosmo.domain.AddressViewDto;

public interface AddressInputService {
    AddressInputForm initForm();
    AddressViewDto loadViewData(String shainUid, String shinseiNo);
    
    void reflectMiddleAddress(AddressInputForm form, String shainUid);
    
    void searchZipCode(AddressInputForm form);
    
    boolean validateAndCheckRoute(AddressInputForm form);
    
    void tempSave(AddressInputForm form, String shainUid, String kigyoCd, String shainNo, String shozokuCd);
}