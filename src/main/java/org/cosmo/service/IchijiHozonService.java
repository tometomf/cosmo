package org.cosmo.service;

import org.cosmo.domain.IchijiHozonDTO;

public interface IchijiHozonService {

    /**
     * 통근수단 임시저장 (USER_UID + ACTION_NM 기준 UPSERT)
     * - 존재하면 UPDATE
     * - 없으면 INSERT
     *
     * @param dto ICHIJI_HOZON 저장용 DTO
     * @return 최종 HOZON_UID (없으면 0)
     */
    int saveOrUpdateCommuteTemp(IchijiHozonDTO dto);

}
