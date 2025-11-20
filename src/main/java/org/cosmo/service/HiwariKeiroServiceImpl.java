package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.mapper.HiwariKeiroMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HiwariKeiroServiceImpl implements HiwariKeiroService {

    @Autowired
    private HiwariKeiroMapper hiwariKeiroMapper;

    /**
     * 경로 목록 조회
     * - 지금은 KIGYO_CD=100, SHAIN_UID=9001 고정(테스트용)
     */
    @Override
    public List<HiwariKeiroVO> getKeiroList(Integer shainUid) {

        if (shainUid == null) {
            // 로그인 기능 붙기 전까지는 더미 사번으로 통일
            shainUid = 9001;
        }

        return hiwariKeiroMapper.findByUser(shainUid);
    }

    /**
     * 본신청 저장 (지금은 SHINSEI_START_KEIRO를 전부 갈아끼우는 방식)
     */
    @Override
    public void saveApply(Integer shainUid, List<HiwariKeiroVO> keiroList) {

        if (shainUid == null) {
            shainUid = 9001;
        }

        if (keiroList == null || keiroList.isEmpty()) {
            // 저장할 데이터가 없으면 아무 것도 하지 않음
            return;
        }

        // 같은 사원의 기존 경로를 모두 삭제 후
        hiwariKeiroMapper.deleteByUser(shainUid);

        // 새로 1번부터 KEIRO_SEQ 부여해서 INSERT
        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
            vo.setKigyoCd(100);       // KIGYO_CD 고정 (테스트용)
            vo.setShainUid(shainUid); // SHAIN_UID
            vo.setKeiroSeq(seq++);    // 1,2,3,...

            hiwariKeiroMapper.insertKeiro(vo);
        }
    }

    /**
     * 일시보존
     * - 지금은 본신청과 동일하게 SHINSEI_START_KEIRO에 저장하는 임시 버전
     */
    @Override
    public void saveTemp(Integer shainUid, List<HiwariKeiroVO> keiroList) {

        if (shainUid == null) {
            shainUid = 9001;
        }

        if (keiroList == null || keiroList.isEmpty()) {
            return;
        }

        hiwariKeiroMapper.deleteByUser(shainUid);

        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
            vo.setKigyoCd(100);
            vo.setShainUid(shainUid);
            vo.setKeiroSeq(seq++);

            hiwariKeiroMapper.insertKeiro(vo);
        }
    }

    /**
     * 경로 1건 삭제
     * - 「削除する」 링크 눌렀을 때 사용
     */
    @Override
    public void deleteOne(Integer shainUid, Integer keiroSeq) {

        if (shainUid == null) {
            shainUid = 9001;
        }
        if (keiroSeq == null) {
            return;
        }

        hiwariKeiroMapper.deleteOne(shainUid, keiroSeq);
    }
}
