package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.mapper.HiwariKakuninMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HiwariKakuninServiceImpl implements HiwariKakuninService {

    @Autowired
    private HiwariKakuninMapper hiwariKakuninMapper;

    /**
     * 確認画面 ヘッダー情報取得
     *  - 社員番号・社員名
     *  - 勤務地・住所
     *  - 申請区分／理由／期間／金額合計
     */
    @Override
    public HiwariKakuninVO getHeader(Integer kigyoCd, Long shinseiNo) {

        // Mapper のヘッダー取得 SQL をそのまま呼び出し
        return hiwariKakuninMapper.selectKakuninHeader(kigyoCd, shinseiNo);
    }

    /**
     * 確認画面 経路一覧取得
     *  - 通勤経路①, 通勤経路② … のリスト
     */
    @Override
    public List<HiwariKakuninRouteVO> getRoutes(Integer kigyoCd, Long shinseiNo) {

        // Mapper の経路一覧取得 SQL をそのまま呼び出し
        return hiwariKakuninMapper.selectKakuninRoutes(kigyoCd, shinseiNo);
    }
        /**
         * 申請を承認する
         *  - 進捗区分を '2' (承認) に更新
         *  - TODO: お知らせ/メール送信処理
         */
        @Override
        public void submitApplication(Integer kigyoCd, Long shinseiNo) {
            // 承認状態('2')で更新
            hiwariKakuninMapper.updateShinseiApproval(kigyoCd, shinseiNo, "2");
            
            // TODO: お知らせ/メール送信処理が必要な場合ここに追加
        }
    }