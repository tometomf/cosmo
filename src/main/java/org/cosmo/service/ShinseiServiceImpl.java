package org.cosmo.service;

import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShinseiServiceImpl implements ShinseiService {

	@Autowired
	private ShinseiMapper shinseiMapper;

	@Override
	public ShinseiJyohouVO getShinseiJyohou(Long shinseiNo) {
		return shinseiMapper.getShinseiJyohou(shinseiNo);
	}

	@Override
	public ShinseiKeiroVO getShinseiKeiro(Long shinseiNo) {
		return shinseiMapper.getShinseiKeiro(shinseiNo);
	}

	@Override
	public ShinseiDetailVO getShinseiDetail(Long kigyoCd, Long shinseiNo) {
		return shinseiMapper.selectShinseiDetail(kigyoCd, shinseiNo);
	}


	@Override
	public void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp) {

		// 1. SHINSEI 테이블을 一時保存 상태로 되돌리기
		shinseiMapper.updateShinseiToIchijihozon(kigyoCd, shinseiNo, loginUserId);

		// 2. ALERT 테이블의 신청일을 NULL 로
		shinseiMapper.updateAlertForHikimodoshi(kigyoCd, shinseiNo, loginUserId);

		// 나중에 여기 사이에 SHINSEI_LOG / OSHIRASE / PROCESS_LOG INSERT 를
		// 차례로 추가하면 됨.
	}

}
