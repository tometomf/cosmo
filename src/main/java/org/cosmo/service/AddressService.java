package org.cosmo.service;

import org.cosmo.domain.KinmuForm;
import org.springframework.stereotype.Service;

@Service
public class AddressService {
	
	 /**
     * 「住所入力PG設計書」の「次へ遷移前の処理」에 해당하는 부분
     * 지금은 스텁(비워놓거나 로그만 찍어도 됨)
     */
    public void runPreNextProcess(KinmuForm form) {
        // TODO: 나중에 설계서 住所入力PG 부분 보고 실제 로직 채우기
        System.out.println("住所入力PGの『次へ遷移前の処理』を実行しました");
    }

}
