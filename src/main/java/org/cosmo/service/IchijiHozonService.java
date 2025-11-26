package org.cosmo.service;

import org.cosmo.domain.IchijiHozonDTO;

public interface IchijiHozonService {

    int saveOrUpdateCommuteTemp(IchijiHozonDTO dto);

    IchijiHozonDTO getTemp(Integer userUid);
}
