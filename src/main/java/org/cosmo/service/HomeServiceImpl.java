package org.cosmo.service;

import java.util.List;

import org.cosmo.domain.HomeShainVO;
import org.cosmo.mapper.HomeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class HomeServiceImpl implements HomeService {

	@Setter(onMethod_= @Autowired)
	private HomeMapper homeMapper;
	
	@Override
	public List<HomeShainVO> getList(String kigyo_Cd, String shain_Uid) {
		
		return homeMapper.getList(kigyo_Cd, shain_Uid);
	}
}
