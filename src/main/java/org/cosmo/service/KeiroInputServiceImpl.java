package org.cosmo.service;

import java.sql.Timestamp;
import java.util.List;

import org.cosmo.domain.CodeVO;
import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ProcessLogDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.KeiroInputMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class KeiroInputServiceImpl implements KeiroInputService {

	@Autowired
	private KeiroInputMapper mapper;
    
	//�옱�솚
    @Override
    public ShainLocationVO getShainLocation(Long kigyoCd, Long shainUid) {
        if (kigyoCd == null || shainUid == null) {
            return null;
        }
        return mapper.selectShainLocationByUid(kigyoCd, shainUid);
    }
    
    //�옱�솚
	@Override
	public ShainKeiroDTO getShainKeiro(Integer kigyoCd, Long shainUid, Integer keiroSeq) {
		return mapper.selectShainKeiroWithCode(kigyoCd, shainUid, keiroSeq);
	}

	//吏��썕
	@Override
	public ShinseiDTO getShinseiAddress(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {

		return mapper.selectAddressWithFallback(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}

	//吏��썕
	@Override
	public ShinseiDTO getShinseiKinmuAddress(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {

		return mapper.selectKinmuAddressWithFallback(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}

	//�븯�젙
	@Override
	public KeiroInputDenshaDTO getDenshaKeiroDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {
		
		return mapper.selectDenshaKeiroDetail(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}
	//吏��썕
	@Override
    public ShinseiStartKeiroVO getCarRouteDetail(Integer kigyoCd, Long shainUid, Integer shinseiNo, Integer keiroSeq) {
        return mapper.selectCarRouteDetail(kigyoCd, shainUid, shinseiNo, keiroSeq);
    }
	
	//�븯�젙
	  @Override
	    public ShinseiStartKeiroVO getStartKeiroOne(
	            Integer kigyoCd, Integer shainUid, Integer shinseiNo, Integer keiroSeq) {

	        return mapper.selectStartKeiro(kigyoCd, shainUid, shinseiNo, keiroSeq);
	    }
	  
	  @Override
	    public void writeProcessLog(String subsystemId,
	                                String processCol,
	                                String key1,
	                                String key2,
	                                String key3,
	                                String key4,
	                                String key5,
	                                String data,
	                                Integer userUid,
	                                String userTrack) {

	        ProcessLogDTO log = new ProcessLogDTO ();

	        // PK 而щ읆�씤 PROCESS_TIMESTAMP�뒗 �뿬湲곗꽌 �쁽�옱�떆媛꾩쑝濡� �꽭�똿
	        log.setProcessTimestamp(new Timestamp(System.currentTimeMillis()));
	        log.setSubsystemId(subsystemId);
	        log.setProcessCol(processCol);

	        log.setKey1(key1);
	        log.setKey2(key2);
	        log.setKey3(key3);
	        log.setKey4(key4);
	        log.setKey5(key5);

	        log.setData(data);
	        log.setUserUid(userUid);
	        log.setUserTrack(userTrack);

	        mapper.insertProcessLog(log);
	    }
	  
	   @Override
	    public CodeVO getCodeName(String codeSybtsu, String code) {
	        return mapper.selectCodeName(codeSybtsu, code);
	    }
	   
	    @Override
	    public List<CodeVO> getCodeList(String codeSybtsu) {
	        return mapper.selectCodeListBySybtsu(codeSybtsu);
	    }
}
