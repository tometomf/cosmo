package org.cosmo.domain;
import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;
//유지희
@Data
@Alias("HiwariKakuninVO")
public class HiwariKakuninVO {
    // 회사코드
    private Integer kigyoCd;
    
    // 사원 정보 (DB 컬럼명)
    private Long shainUid;
    private String empNo;              // 社員番号
    private String empName;            // 社員名
    private String empWorkplace;       // 勤務地  👈 추가
    private String empAddress;         // 住所   👈 추가
    
    // 신청 정보 (DB 컬럼명)
    private Long shinseiNo;
    private String shinseiKbn;         // 申請区分 코드
    private String shinseiKbnNm;       // 申請区分 명칭  👈 추가
    private String shinseiRiyu;        // 申請理由
    private String taishoKikanFrom;    // 対象期間From
    private String taishoKikanTo;      // 対象期間To
    private Integer shukkinNissuu;     // 出勤日数
    private Integer kingakuGokei;      // 金額合計
    
    // 경로 리스트
    private List<HiwariKakuninRouteVO> routeList;
    
    // 업로드
    private String uploadFileName;
    private Boolean uploadExists;
    
    private Integer shinseiKin;
    private Integer firstTeikiTsukiSu;
    private String firstShikyuYmd;
    private Integer firstShikyuKin;
    private Integer nextTeikiTsukiSu;
    private Integer regularShikyuKin;
    private Integer tsukiShikyuKin;

    private Integer katamichiKin;
    private String shinkansenRiyoKbn;
    private String tokkuyuRiyoKbn;
    private String yuryoRiyoKbn;
    private String kekkaSelect;

}