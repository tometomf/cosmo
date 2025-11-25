package org.cosmo.domain;

import lombok.Data;		//조우진

@Data
public class IdoCheckForm {
    private String kinmuChange;
    
    private String jushoChange;

    public boolean isKinmuChanged() {
        return "Y".equals(this.kinmuChange);
    }

    public boolean isJushoChanged() {
        return "Y".equals(this.jushoChange);
    }
}