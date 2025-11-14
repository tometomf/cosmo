package org.cosmo.service;

import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShinseiServiceImpl implements ShinseiService {

	@Autowired
	private ShinseiMapper shinseiMapper;

	@Override
	public ShinseiJyohouVO getShinseiJyohou(String shinseiNo) {
		return shinseiMapper.getShinseiJyohou(shinseiNo);
	}

	@Override
	public ShinseiKeiroVO getShinseiKeiro(String shinseiNo) {
		return shinseiMapper.getShinseiKeiro(shinseiNo);
	}

	@Override
	public ShinseiShoruiVO getShinseiShorui(String shinseiNo) {
		return shinseiMapper.getShinseiShorui(shinseiNo);
	}

	@Override
	public ShinseiIcHozonVO getShinseiIcHozon(String hozonUid) {
		return shinseiMapper.getShinseiIcHozon(hozonUid);
	}

	@Override
	public String getCodeNm(String code) {
		return shinseiMapper.getCodeNm(code);
	}

	@Override
	public String getShudanName(String code) {
		return shinseiMapper.getShudanName(code);
	}

	@Override
	public String getShinseiName(String code) {
		return shinseiMapper.getShinseiName(code);
	}

	@Override
	public void updateTorikesu(String shinseiNo, String tkComment, String shainUid) {
		shinseiMapper.updateTorikesu(shinseiNo, tkComment,shainUid);
	}
}
