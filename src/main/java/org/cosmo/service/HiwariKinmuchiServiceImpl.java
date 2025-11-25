package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.AddressViewDto;
import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.mapper.HiwariKinmuchiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HiwariKinmuchiServiceImpl implements HiwariKinmuchiService {

	
	//서혜원 시작
    @Autowired
    private HiwariKinmuchiMapper mapper;

    @Override
    public HiwariKinmuchiVO getBeforeShinsei(Integer kigyoCd, Long shainUid) {
        return mapper.getBeforeShinsei(kigyoCd, shainUid);
    }

    @Override
    public HiwariKinmuchiVO getAfterShinsei(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.getAfterShinsei(kigyoCd, shainUid, shinseiNo);
    }

    @Override
    public List<String> getShozokuNames(Integer kigyoCd) {
        return mapper.getShozokuNames(kigyoCd);
    }
    
    @Override
    public HiwariAddressVO getAddressPageData(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.getAddressPageData(kigyoCd, shainUid, shinseiNo);
    }
    
    @Override
    public HiwariAddressVO getAddressPageDataBefore(Integer kigyoCd, Long shainUid) {
        return mapper.getAddressPageDataBefore(kigyoCd, shainUid);
    }
    //서혜원 끝
 
    
    //유지희
    /**
     * 確認画面 ヘッダー情報取得
     *  - 社員番号・社員名
     *  - 勤務地・住所
     *  - 申請区分／理由／期間／金額合計
     */
    @Override
    public HiwariKakuninVO getHeader(Integer kigyoCd, Long shinseiNo) {

        // Mapper のヘッダー取得 SQL をそのまま呼び出し
        return mapper.selectKakuninHeader(kigyoCd, shinseiNo);
    }

    /**
     * 確認画面 経路一覧取得
     *  - 通勤経路①, 通勤経路② … のリスト
     */
    @Override
    public List<HiwariKakuninRouteVO> getRoutes(Integer kigyoCd, Long shinseiNo) {

        // Mapper の経路一覧取得 SQL をそのまま呼び出し
        return mapper.selectKakuninRoutes(kigyoCd, shinseiNo);
    }
        /**
         * 申請を承認する
         *  - 進捗区分を '2' (承認) に更新
         *  - TODO: お知らせ/メール送信処理
         */
        @Override
        public void submitApplication(Integer kigyoCd, Long shinseiNo) {
            // 承認状態('2')で更新
        	mapper.updateShinseiApproval(kigyoCd, shinseiNo, "2");
            
            // TODO: お知らせ/メール送信処理が必要な場合ここに追加
        }
        
        @Override
        public List<HiwariKeiroVO> getKeiroList(Integer kigyoCd, Integer shainUid) {
            if (kigyoCd == null) {
                kigyoCd = 100;
            }
            if (shainUid == null) {
                shainUid = 30000001;
            }
            
            return mapper.findByUser(kigyoCd, shainUid);
        }

        @Override
        @Transactional
        public void saveApply(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList) {
            if (kigyoCd == null) {
                kigyoCd = 100;
            }
            if (shainUid == null) {
                shainUid = 30000001;
            }
            
            if (keiroList == null || keiroList.isEmpty()) {
                return;
            }
            
            // 기존 경로 삭제
            mapper.deleteByUser(kigyoCd, shainUid);
            
            // 새 경로 등록
            int seq = 1;
            for (HiwariKeiroVO vo : keiroList) {
                vo.setKigyoCd(kigyoCd);
                vo.setShainUid(shainUid);
                vo.setKeiroSeq(seq++);
                mapper.insertKeiro(vo);
            }
        }

        @Override
        @Transactional
        public void saveTemp(Integer kigyoCd, Integer shainUid, List<HiwariKeiroVO> keiroList) {
            if (kigyoCd == null) {
                kigyoCd = 100;
            }
            if (shainUid == null) {
                shainUid = 30000001;
            }
            
            if (keiroList == null || keiroList.isEmpty()) {
                return;
            }
            
            mapper.deleteByUser(kigyoCd, shainUid);
            
            int seq = 1;
            for (HiwariKeiroVO vo : keiroList) {
                vo.setKigyoCd(kigyoCd);
                vo.setShainUid(shainUid);
                vo.setKeiroSeq(seq++);
                mapper.insertKeiro(vo);
            }
        }

        @Override
        @Transactional
        public void deleteOne(Integer kigyoCd, Integer shainUid, Integer keiroSeq) {
            if (kigyoCd == null) {
                kigyoCd = 100;
            }
            if (shainUid == null) {
                shainUid = 30000001;
            }
            
            if (keiroSeq == null) {
                return;
            }
            
            mapper.deleteOne(kigyoCd, shainUid, keiroSeq);
        }
        @Service
        public class AddressInputServiceImpl implements AddressInputService {

            @Override
            public AddressViewDto loadCurrentAddress(Integer kigyoCd, Integer shainUid) {

                // ★ 더미 데이터 (DB 연동 이전 테스트용)
                AddressViewDto dto = new AddressViewDto();

                dto.setCurZip("213-0001");
                dto.setCurPref("神奈川県");
                dto.setCurCity("川崎市中原区");
                dto.setCurStreet("上小田中1-2-3");
                dto.setCurBuilding("レオパレス清の103");

                return dto;
            }
        }


        
        
        //유지희 끝
    
}