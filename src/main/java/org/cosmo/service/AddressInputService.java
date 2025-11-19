package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;

public interface AddressInputService {

    /**
     * 現住所 표시용 데이터 조회
     */
    AddressViewDto loadCurrentAddress(String kigyoCd, String shainUid);

    /**
     * 화면 최초 표시용 신규 주소 폼 초기값
     */
    AddressInputForm initForm();

    /**
     * 「一時保存」 버튼 처리
     *  실제 설계서상은 OSHIRASE, ICHIJI_HOZON, PROCESS_LOG 에 등록하지만
     *  지금은 스텁(더미) 구현만 해둔다.
     */
    void saveTemporary(AddressInputForm form, String kigyoCd, String shainUid);

    /**
     * 「次へ」 버튼 시 신규 주소를 본 신청 데이터에 반영.
     * 지금은 더미 구현.
     */
    void reflectAddress(AddressInputForm form, String kigyoCd, String shainUid);
}
