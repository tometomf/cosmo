package org.cosmo.domain;

import lombok.Data;

/**
 * 조회 조건 및 키 값을 전달하기 위한 DTO
 * (신청 기본 키인 KIGYO_CD, SHINSEI_NO 등을 담습니다.)
 */
@Data
public class SearchCriteriaDTO {
    
    // 필수 키 값
    private int kigyoCd;    // KIGYO_CD (기업 코드)
    private int shinseiNo;  // SHINSEI_NO (신청 번호)
    
    // 기타 조회 조건 (필요에 따라 추가)
    private String shainNo;      // SHAIN_NO (사원 번호)
    private String shinseiKbn;  // SHINSEI_KBN (신청 구분)
    private String shinseiYmd;  // SHINSEI_YMD (신청일)
    
    // 페이징 처리를 위한 필드 (선택적)
    // private int pageNum;
    // private int amount;
}