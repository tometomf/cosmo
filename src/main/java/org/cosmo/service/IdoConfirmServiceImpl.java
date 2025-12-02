package org.cosmo.service;

import org.cosmo.domain.AlertType;
import org.cosmo.domain.IdoConfirmViewDto;
import org.cosmo.domain.KeiroInfoForm;
import org.cosmo.domain.NextScreen;
import org.cosmo.domain.NextStep;
import org.cosmo.mapper.IdoConfirmMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class IdoConfirmServiceImpl implements IdoConfirmService {

    private final IdoConfirmMapper idoConfirmMapper;

    // =========================================================
    // ★ [수정됨] 화면 표시용 데이터 조회 (신청 전/후 분기 처리)
    // =========================================================
    @Override
    public IdoConfirmViewDto loadDisplayData(String kigyoCd, String shainUid, String shinseiNo) {
        
        IdoConfirmViewDto dto = null;

        // ========================================================
        // ★ 설계서 로직 적용
        // 신청번호(shinseiNo)가 있으면 -> [신청 후] 데이터 (SHINSEI 테이블)
        // 신청번호(shinseiNo)가 없으면 -> [신청 전] 데이터 (SHAIN 테이블)
        // ========================================================
        
        if (shinseiNo != null && !shinseiNo.isEmpty() && !"null".equals(shinseiNo)) {
            // [신청 후]
            System.out.println(">>> [Service] 신청 후 데이터 조회 (신청번호: " + shinseiNo + ")");
            dto = idoConfirmMapper.selectShinseiAddress(kigyoCd, shinseiNo);
        } else {
            // [신청 전]
            System.out.println(">>> [Service] 신청 전 마스터 조회 (사원ID: " + shainUid + ")");
            dto = idoConfirmMapper.selectShainAddress(kigyoCd, shainUid);
        }

        // 데이터가 없을 경우 방어 로직 (Null Pointer 방지)
        if (dto == null) {
            dto = new IdoConfirmViewDto();
            dto.setCurKinmuPlace("データなし (該当データがありません)");
            dto.setCurAddress("データなし (該当データがありません)");
        }

        return dto;
    }

    // ... (아래 judge, loadKeiroInfo 등의 다른 메서드는 기존 코드 그대로 유지) ...
    
    @Override
    public NextStep judge(AlertType alertType, boolean kinmu, boolean jusho) {
        if (alertType == AlertType.IDOU_ITEN) {
            if (kinmu) return new NextStep(NextScreen.WORK_INPUT, false);
            else return new NextStep(NextScreen.APPLICATION_ERROR, false);
        }
        if (alertType == AlertType.SONOHOKA) {
            if (kinmu) return new NextStep(NextScreen.WORK_INPUT, false);
            if (!kinmu && jusho) return new NextStep(NextScreen.ADDRESS_INPUT, false);
            if (!kinmu && !jusho) return new NextStep(NextScreen.COMMUTE_INFO, false);
        }
        if (alertType == AlertType.JISHIN) {
            if (kinmu) return new NextStep(NextScreen.APPLICATION_ERROR, false);
            if (jusho) return new NextStep(NextScreen.ADDRESS_INPUT, false);
            return new NextStep(NextScreen.COMMUTE_INFO, true);
        }
        return new NextStep(NextScreen.APPLICATION_ERROR, false);
    }

    @Override
    public KeiroInfoForm loadKeiroInfo(String shainUid) {
        // (기존 코드 유지 - 생략)
        return null; 
    }

    @Override
    @Transactional
    public void saveKeiroInfo(KeiroInfoForm form) {
        // (기존 코드 유지)
    }
}