package org.cosmo.service;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp) {

		// 신청정보조회
		ShinseiJyohouVO jyohou = shinseiMapper.getShinseiJyohou(shinseiNo);
		if (jyohou == null) {
			// 신청데이터없으면 에러띄우기
			throw new IllegalStateException("申請情報が存在しません。(申請番号=" + shinseiNo + ")");
		}
		String shinseiKbn = jyohou.getShinseiKbn();  // 신청종류
		String shinseiYmd = jyohou.getShinseiYmd();  // 신청한 날짜

		// 상태를 1번으로 바꾸기(임시저장상태)
		shinseiMapper.updateShinseiToIchijihozon(kigyoCd, shinseiNo, loginUserId);
		// 신청일을 빈칸으로 바꾸기. 이미 신청한거 다시 내리는거니까 임시저장상태니까 유효한 신청으로 취급하면 안돼서
		// 실제 진행중인 신청이 아니라는 뜻으로 바꾸는거
		shinseiMapper.updateAlertForHikimodoshi(kigyoCd, shinseiNo, loginUserId);

		
		String kigyoCdStr = String.valueOf(kigyoCd);
		String shinseiNoStr = String.valueOf(shinseiNo);


		int syoriKbn = 6;  // 6번 hikimodoshi
		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCdStr, shinseiNoStr);

		// 회사코드, 신청번호, 로그번호, 처리구분, 신청구분, 신청일, 누가? 정보를 SHINSEI_LOG 테이블에 INSERT
		shinseiMapper.insertShinseiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, shinseiKbn, shinseiYmd, loginUserId);


		if (shinseiMapper.countStartKeiro(kigyoCdStr, shinseiNoStr) > 0) {
			shinseiMapper.insertStartKeiroLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		} else {
			shinseiMapper.insertEmptyStartKeiroLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		}

		if (shinseiMapper.countEndKeiro(kigyoCdStr, shinseiNoStr) > 0) {
			shinseiMapper.insertEndKeiroLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		} else {
			shinseiMapper.insertEmptyEndKeiroLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		}

		if (shinseiMapper.countFuzuiShorui(kigyoCdStr, shinseiNoStr) > 0) {
			shinseiMapper.insertFuzuiShoruiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		} else {
			shinseiMapper.insertEmptyFuzuiShoruiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, loginUserId);
		}


		shinseiMapper.insertProcessLog(shinseiNoStr, loginUserId, "HIKIMODOSHI");
	}

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
	public String getFileName(String shinseiNo) {
		return shinseiMapper.getFileName(shinseiNo);
	}

	@Override
	public String getShinchokuKbn(String shinseiNo) {
		return shinseiMapper.getShinchokuKbn(shinseiNo);
	}

	@Override
	public void updateTorikesu(String shinseiNo, String tkComment, String shainUid) {
		// 1) 신청 데이터 UPDATE
		shinseiMapper.updateTorikesu(shinseiNo, tkComment, shainUid);

		// 2) 프로세스 로그 INSERT (USER_UID 전달됨)
		shinseiMapper.insertProcessLog(shinseiNo, shainUid, "CANCEL");
	}

	@Override
	public void deleteIchijiHozonByHozonUid(String hozonUid) {
		shinseiMapper.deleteIchijiHozonByHozonUid(hozonUid);
	}

	@Override
	public void insertOshirase(ShainVO shain) {
		shinseiMapper.insertOshirase(shain);
	}

	@Override
	@Transactional
	public void insertCancelLogs(String shinseiNo, String shinseiKbn, String shinseiYmd, ShainVO shain) {

		String kigyoCd = shain.getKigyo_Cd();
		String shainUid = shain.getShain_Uid();

		int syoriKbn = 5;

		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCd, shinseiNo);

		// 각종 로그 Insert
		shinseiMapper.insertShinseiLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shinseiKbn, shinseiYmd, shainUid);

		if (shinseiMapper.countStartKeiro(kigyoCd, shinseiNo) > 0) {
			shinseiMapper.insertStartKeiroLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		} else {
			shinseiMapper.insertEmptyStartKeiroLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		}

		if (shinseiMapper.countEndKeiro(kigyoCd, shinseiNo) > 0) {
			shinseiMapper.insertEndKeiroLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		} else {
			shinseiMapper.insertEmptyEndKeiroLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		}

		if (shinseiMapper.countFuzuiShorui(kigyoCd, shinseiNo) > 0) {
			shinseiMapper.insertFuzuiShoruiLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		} else {
			shinseiMapper.insertEmptyFuzuiShoruiLog(kigyoCd, shinseiNo, logSeq, syoriKbn, shainUid);
		}
	}

	@Override
	public void insertProcessLog(String shinseiNo, String userUid, String type) {
		shinseiMapper.insertProcessLog(shinseiNo, userUid, type);
	}
}
