package org.cosmo.service;

import java.util.List;
import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroService {
	/**
     * 유지희
     */
    /**
     * 경로 목록 조회
     * SHINSEI_START_KEIRO 에서 해당 사원의 경로 리스트를 가져온다.
     * 
     * @param kigyoCd 기업코드
     * @param shainUid 사원UID
     * @return 경로 목록
     */
    List<HiwariKeiroVO> getKeiroList(Integer kigyoCd, Integer shainUid);
    
    /**
     * 신청 저장(本申請)
     * - SHINSEI / SHINSEI_START_KEIRO 를 확정 상태로 저장
     * 
     * @param kigyoCd 기업코드
     * @param shainUid 사원UID
     * @param keiroList 경로 목록
     */
    void saveApply(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList);
    
    /**
     * 일시보존
     * - 현재 입력 중인 경로 정보를 임시로 저장
     * 
     * @param kigyoCd 기업코드
     * @param shainUid 사원UID
     * @param keiroList 경로 목록
     */
    void saveTemp(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList);
    
    /**
     * 경로 1건 삭제
     * - 「削除する」リンク용
     * 
     * @param kigyoCd 기업코드
     * @param shainUid 사원UID
     * @param keiroSeq 경로순번
     */
    void deleteOne(Integer kigyoCd, Integer shainUid, Integer keiroSeq);
}