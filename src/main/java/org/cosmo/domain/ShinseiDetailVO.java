package org.cosmo.domain;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;


@Data
public class ShinseiDetailVO {

    // ===== 상태 정보 =====
    private Long shinseiNo;          // 申請番号
    private String joutaiName;       // 状況(承認待ち 등)
    private String shinseiYmd;       // 申請日 (yyyyMMdd -> JSP에서 그대로 출력)
    private String sashimodoshiYmd;  // 差戻し日
    private Date saishinseiDate;     // 再申請日
    private Date shoninDate;         // 承認日
    private Date shikyuuKaishiDate;  // 支給開始日
    private String honninComment;    // 本人申し送りコメント

    // ===== 申請前 / 申請後 =====
    private String genAddress;       // 住所(申請前)
    private String newAddress;       // 住所(申請後)

    private String shozokuBeforeNm;  // 勤務先(申請前)
    private String shozokuAfterNm;   // 勤務先(申請後)

    private String kinmuchiBefore;   // 勤務地(申請前)
    private String kinmuchiAfter;    // 勤務地(申請後)

    // ===== 経路情報 =====
    private String tsukinShudanName; // 通勤手段名 (自動車(一般) 등)
    private String keiro;            // 経路（新丸子駅 → 自由が丘駅）

    private BigDecimal kyori;          // 距離(km)
    private BigDecimal kingakuMonth;   // 金額1ヶ月
    private BigDecimal yuryodouroMonth;// 有料道路1ヶ月

    private String fuzuiFileTitle;   // 付随書類 제목 (링크 텍스트)
    private Date hokenManryoDate;    // 保険満了日

    private String taijinBaisho;     // 対人賠償
    private String taibutsuBaisho;   // 対物賠償
    private String jinshinShogai;    // 人身障害
    private String tojoshaShogai;    // 搭乗者障害
    private Integer tokyu;           // 等級

    // ===== 申請情報 =====
    private String shinseiKbnName;   // 申請区分名(異動 등)
    private String shinseiRiyu;      // 申請理由
    private Date idouDate;           // 異動日/移動日
    private Date tennyuDate;         // 転入日
    private Date kaishiDate;         // 開始日
    
    private String shinchokuKbn;
    
}