package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.ShainVO;

public interface HomeService {

	public List<ShainVO> getList(String kigyo_Cd, String shain_Uid);
}
