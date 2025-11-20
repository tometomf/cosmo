
package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoCheckForm {
   
    private String kinmuChange;   // 勤務地が：変わる/変わらない
    private String jushoChange;   // 住所が：変わる/変わらない

    public boolean isKinmuChange() {
        return "Y".equals(kinmuChange);
    }

    public boolean isJushoChange() {
        return "Y".equals(jushoChange);
        //sdfd
    }
}
