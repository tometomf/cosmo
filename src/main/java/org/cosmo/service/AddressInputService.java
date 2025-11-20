package org.cosmo.service;

import org.cosmo.domain.AddressInputForm;
import org.cosmo.domain.AddressViewDto;
import org.springframework.stereotype.Service;

@Service
public class AddressInputService {

    // 여기에 Mapper 들 @Autowired 해서 붙이면 됨
    // private ShainMapper shainMapper;
    // private IchijiHozonMapper ichijiHozonMapper;
    // private OshiraeMapper oshiraeMapper;
    // private ProcessLogMapper processLogMapper;

    /** 現住所 + (있다면) 이전에 입력한 新住所 불러오기 */
    public AddressViewDto loadCurrentAddress(String kigyoCd, String shainUid) {
        // TODO: DB에서 조회할 자리
        AddressViewDto dto = new AddressViewDto();
        dto.setCurZip("213-0001");
        dto.setCurPref("神奈川県");
        dto.setCurCity("川崎市高津区");
        dto.setCurStreet("下作延1-2-3");
        dto.setCurBuilding("レオパレス溝の口103");
        return dto;
    }

    /** 처음 진입할 때 사용할 폼 기본값 (지금은 비워둠) */
    public AddressInputForm initForm() {
        return new AddressInputForm();
    }

    /** 「この住所を反映」 버튼용: 現住所를 새주소에 복사 */
    public void reflectCurrentToNew(AddressViewDto view, AddressInputForm form) {
        if (view == null || form == null) {
            return;
        }

        if (view.getCurZip() != null && view.getCurZip().contains("-")) {
            String[] z = view.getCurZip().split("-");
            form.setNewZip1(z[0]);
            form.setNewZip2(z[1]);
        }
        form.setNewPref(view.getCurPref());
        form.setNewCity(view.getCurCity());
        form.setNewStreet(view.getCurStreet());
        form.setNewBuilding(view.getCurBuilding());
    }

    /** 一時保存 로직 (지금은 콘솔만 찍고 지나가게 둠) */
    public void tempSave(AddressInputForm form, String userUid) {
        // TODO: ICHIJI_HOZON / OSHIRASE / PROCESS_LOG 에 insert
        System.out.println("[0400] tempSave called. user=" + userUid + ", form=" + form);
    }

    /** 次へ 버튼 검증 */
    public void validateForNext(AddressInputForm form) {

        if (form == null) {
            throw new IllegalArgumentException("フォームが不正です。");
        }

        // newPref 가 null 이거나, 공백만 있는 경우
        if (form.getNewPref() == null || form.getNewPref().trim().isEmpty()) {
            throw new IllegalArgumentException("都道府県を入力してください。");
        }

        if (form.getNewCity() == null || form.getNewCity().trim().isEmpty()) {
            throw new IllegalArgumentException("市区町村を入力してください。");
        }

        if (form.getNewStreet() == null || form.getNewStreet().trim().isEmpty()) {
            throw new IllegalArgumentException("番地を入力してください。");
        }

        if (form.getMoveInDate() == null || form.getMoveInDate().trim().isEmpty()) {
            throw new IllegalArgumentException("転入日を入力してください。");
        }
    }
}