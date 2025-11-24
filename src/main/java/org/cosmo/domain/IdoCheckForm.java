package org.cosmo.domain;

import lombok.Data;

@Data
public class IdoCheckForm {
    // JSP의 name="kinmuChange" (값: "Y" or "N")
    private String kinmuChange;
    
    // JSP의 name="jushoChange" (값: "Y" or "N")
    private String jushoChange;

    // 편의 메서드: Controller/Service에서 로직 판단용
    public boolean isKinmuChanged() {
        return "Y".equals(this.kinmuChange);
    }

    public boolean isJushoChanged() {
        return "Y".equals(this.jushoChange);
    }
}