package org.cosmo.mapper;

import org.cosmo.domain.IchijiHozonDTO;

public interface IchijiHozonMapper {

    int updateByHozonUid(IchijiHozonDTO dto);

    void insertIchijiHozon(IchijiHozonDTO dto);

    IchijiHozonDTO selectByHozonUid(int hozonUid);
}
