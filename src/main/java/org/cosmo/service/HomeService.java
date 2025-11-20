package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HomeShainVO;

public interface HomeService {

	public List<HomeShainVO> getList(String kigyo_Cd, String shain_Uid);
}
