package org.cosmo.service;

import java.io.IOException;
import java.util.List;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.HiwariRiyuVO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.mapper.HiwariKinmuchiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
    
    @Override
    public HiwariRiyuVO getRiyuPageAfter(Integer kigyoCd, Long shainUid, Long shinseiNo) {
        return mapper.shinseiRiyuPage(kigyoCd, shainUid, shinseiNo);
    }
    
    //서혜원 끝
 
    
  //유지희
    @Autowired
    private OshiraseService oshiraseService; 
    
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

   
    @Override
    public List<HiwariKeiroVO> getKeiroList(Integer kigyoCd, Long shainUid) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001L;   
        }
        
        return mapper.findByUser(kigyoCd, shainUid);
    }

    @Override
    @Transactional
    public void saveApply(Integer kigyoCd, Long shainUid, List<HiwariKeiroVO> keiroList) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001L;   
        }
        
        if (keiroList == null || keiroList.isEmpty()) {
            return;
        }
        
        // 기존 경로 삭제
        mapper.deleteByUser(kigyoCd, shainUid);
        
        // 새 경로 등록
        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
        	
        	 calcAmounts(vo);
        	
            vo.setKigyoCd(kigyoCd);
            vo.setShainUid(shainUid);  
            vo.setKeiroSeq(seq++);
            mapper.insertKeiro(vo);
        }
    }

    @Override
    @Transactional
    public void saveTemp(Integer kigyoCd, Long shainUid, List<HiwariKeiroVO> keiroList) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001L;  
        }
        
        if (keiroList == null || keiroList.isEmpty()) {
            return;
        }
        
        mapper.deleteByUser(kigyoCd, shainUid);
        
        int seq = 1;
        for (HiwariKeiroVO vo : keiroList) {
        	
        	 calcAmounts(vo);
        	
            vo.setKigyoCd(kigyoCd);
            vo.setShainUid(shainUid);  
            vo.setKeiroSeq(seq++);
            mapper.insertKeiro(vo);
        }
    
    Long latestShinseiNo = mapper.findLatestShinseiNo(kigyoCd, shainUid);  
    oshiraseService.registHiwariTempSave(kigyoCd, shainUid, latestShinseiNo);
    // ↑ 이 한 줄이 “임시저장 알림 등록”

}

    @Override
    @Transactional
    public void deleteOne(Integer kigyoCd, Long shainUid, Integer keiroSeq) {
        if (kigyoCd == null) {
            kigyoCd = 100;
        }
        if (shainUid == null) {
            shainUid = 30000001L;   
        }
        
        if (keiroSeq == null) {
            return;
        }
        
        mapper.deleteOne(kigyoCd, shainUid, keiroSeq);
    }
    // ====== 여기부터 경로 금액 계산용 유틸 ======

    // null 방지용 NVL
    private int nvl(Integer v) {
        return (v == null) ? 0 : v.intValue();
    }

    /**
     * 1경로 분의 금액 계산
     *  - shinseiKin   : 申請金額        = 片道料金 × 2 × 出勤日数
     *  - hiwariAto    : 日割額          = 申請金額 ÷ 出勤日数
     *  - tsukiShikyuKin : 1ヶ月参考値  = 日割額 × 21(日)
     */
    private void calcAmounts(HiwariKeiroVO vo) {

        int kata = nvl(vo.getKataMichiKin());   // 片道料金
        int days = nvl(vo.getShukkinNissuu());  // 出勤日数

        // 요금이나 일수가 0이면 모두 0 처리
        if (kata <= 0 || days <= 0) {
            vo.setShinseiKin(0);
            vo.setHiwariAto(0);
            vo.setTsukiShikyuKin(0);
            return;
        }

        // 申請金額 = 片道料金 × 2 × 出勤日数
        int shinsei = kata * 2 * days;
        vo.setShinseiKin(shinsei);

        // 日割額 = 申請金額 ÷ 出勤日数  (결과적으로 kata×2)
        int hiwari = shinsei / days;
        vo.setHiwariAto(hiwari);

        // 1ヶ月参考値 = 日割額 × 21日  (※ 21은 나중에 마스터에서 취득 가능)
        int tsuki = hiwari * 21;
        vo.setTsukiShikyuKin(tsuki);
    }
    
    @Override
    public String getShainMailAddr(Integer kigyoCd, Long shainUid) {
        return mapper.findMailAddr(kigyoCd, shainUid);
    }
    @Override
    @Transactional
    public void submitApplication(Integer kigyoCd, Long shinseiNo) {

        mapper.updateShinseiSubmit(kigyoCd, shinseiNo);   // 신청일/구분/주소/기간 등 반영
        mapper.updateShinseiDetails(kigyoCd, shinseiNo); // 금액, 사유, 기타 반영
        mapper.updateShinseiStatus(kigyoCd, shinseiNo);  // 진행구분 변경
    }
    @Override
    public Long getLatestShinseiNo(Integer kigyoCd, Long shainUid) {
        return mapper.findLatestShinseiNo(kigyoCd, shainUid);
    }

    @Override
    public UploadFileDTO getEvidenceByShinsei(int kigyoCd, long shinseiNo) {
        return mapper.selectEvidenceByShinsei(kigyoCd, shinseiNo);
    }

    @Override
    @Transactional
    public void saveEvidence(int kigyoCd, long shainUid, long shinseiNo, MultipartFile file)
            throws IOException {

        if (file == null || file.isEmpty()) {
            return;
        }

        UploadFileDTO dto = new UploadFileDTO();
        dto.setFileUid(shinseiNo);                 // FILE_UID = SHINSEI_NO
        dto.setSeq(1);                             // 일단 1 고정
        dto.setTitle("通勤日割証拠ファイル");
        dto.setName(file.getOriginalFilename());
        dto.setContentType(file.getContentType());
        dto.setData(file.getBytes());

        dto.setKigyoCd(String.valueOf(kigyoCd));
        dto.setAddUserId((int) shainUid);
        dto.setUpdUserId((int) shainUid);

        mapper.insertEvidence(dto);
    }

    @Override
    public UploadFileDTO getEvidenceFile(int kigyoCd, long fileUid) {
        return mapper.selectEvidenceByUid(kigyoCd, fileUid);
    }

    @Override
    @Transactional
    public void deleteEvidenceFile(int kigyoCd, long fileUid) {
        mapper.deleteEvidenceByUid(kigyoCd, fileUid);
    }

    //유지희 끝
}