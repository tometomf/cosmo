package org.cosmo.service;

import java.util.List;
import org.cosmo.domain.HiwariKeiroVO;

public interface HiwariKeiroService {

    List<HiwariKeiroVO> getKeiroList(Integer shainUid);

    void saveApply(Integer shainUid, List<HiwariKeiroVO> keiroList);

    void saveTemp(Integer shainUid, List<HiwariKeiroVO> keiroList);
}
