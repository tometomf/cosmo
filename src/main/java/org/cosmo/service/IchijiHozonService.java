package org.cosmo.service;

import org.cosmo.domain.IchijiHozonDTO;

public interface IchijiHozonService {

    /**
     * 임시저장: ICHIJI_HOZON INSERT 후 생성된 HOZON_UID 반환
     */
    int saveTemp(IchijiHozonDTO dto);
}
