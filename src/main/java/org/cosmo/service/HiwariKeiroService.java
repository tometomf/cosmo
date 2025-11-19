package org.cosmo.service;

import java.util.List;
import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroService {

    /**
     * 경로 목록 조회
     * SHINSEI_START_KEIRO 에서 해당 사원의 경로 리스트를 가져온다.
     */
    List<HiwariKeiroVO> getKeiroList(Integer shainUid);

    /**
     * 신청 저장(本申請)
     * - 설계 기준으로 보면 나중에는 SHINSEI / SHINSEI_START_KEIRO 를
     *   확정 상태로 저장하는 처리가 들어갈 예정.
     */
    void saveApply(Integer shainUid, List<HiwariKeiroVO> keiroList);

    /**
     * 일시보존
     * - 현재 입력 중인 경로 정보를 임시로 저장하는 용도.
     */
    void saveTemp(Integer shainUid, List<HiwariKeiroVO> keiroList);

    /**
     * 경로 1건 삭제
     * - 「削除する」リンク용
     * - 해당 사원(shainUid)의 특정 경로(keiroSeq)만 삭제
     */
    void deleteOne(Integer shainUid, Integer keiroSeq);
}
