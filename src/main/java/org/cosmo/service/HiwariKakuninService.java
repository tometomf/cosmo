package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;

public interface HiwariKakuninService {

    /**
     * 確認画面用 ヘッダー情報取得
     *  - 社員情報
     *  - 勤務地／住所
     *  - 申請区分・理由・期間・金額合計 など
     */
    HiwariKakuninVO getHeader(Integer kigyoCd, Long shinseiNo);

    /**
     * 確認画面用 経路一覧取得
     *  - 通勤経路①〜②（以降）
     */
    List<HiwariKakuninRouteVO> getRoutes(Integer kigyoCd, Long shinseiNo);
    /**
     * 申請を承認する
     * @param kigyoCd 企業コード
     * @param shinseiNo 申請番号
     */
    void submitApplication(Integer kigyoCd, Long shinseiNo);
}
