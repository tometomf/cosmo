package org.cosmo.service;

import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;

public interface ShinseiService {
	ShinseiJyohouVO getShinseiJyohou(Long shinseiNo);

	ShinseiKeiroVO getShinseiKeiro(Long shinseiNo);

	ShinseiDetailVO getShinseiDetail(Long kigyoCd, Long shinseiNo);

	void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp);
}
