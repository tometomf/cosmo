package org.cosmo.service;

import java.nio.charset.StandardCharsets;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataVO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.mapper.ShinseiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;

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
			// 신청정보없으면 에러
			throw new IllegalStateException("申請情報が存在しません。(申請番号=" + shinseiNo + ")");
		}
		String shinseiKbn = jyohou.getShinseiKbn(); // 신청구분 코드
		String shinseiYmd = jyohou.getShinseiYmd(); // 신청일자

		// 상태 일시보존으로 되돌리기
		shinseiMapper.updateShinseiToIchijihozon(kigyoCd, shinseiNo, loginUserId);

		// 신청일자 null로 변경. 없는신청으로 침
		shinseiMapper.updateAlertForHikimodoshi(kigyoCd, shinseiNo, loginUserId);

		String kigyoCdStr = String.valueOf(kigyoCd); // 매퍼 로그 메서드들은 String 사용
		String shinseiNoStr = String.valueOf(shinseiNo);

		int syoriKbn = 6; // 6번 hikimodoshi
		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCdStr, shinseiNoStr); // 다음 LOG_SEQ 채번

		// 로그에 INSERT
		shinseiMapper.insertShinseiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, // 6 : 引戻し
				shinseiKbn, shinseiYmd, loginUserId // SHAIN_UID
		);

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
	public ShinseiIcDataVO getIcData(String hozonUid) {

		ShinseiIcHozonVO row = shinseiMapper.getIchijiHozon(hozonUid);

		if (row == null) {
			return null;
		}

		// BLOB → JSON 문자열 변환
		String json = new String(row.getData(), StandardCharsets.UTF_8);

		ObjectMapper mapper = new ObjectMapper();
		ShinseiIcDataVO vo;

		try {
			vo = mapper.readValue(json, ShinseiIcDataVO.class);
		} catch (Exception e) {
			throw new RuntimeException("임시저장 데이터 변환 오류", e);
		}

		if (vo.getShinseiKbn() != null && !vo.getShinseiKbn().isEmpty()) {
			String shinseiName = shinseiMapper.getShinseiName(vo.getShinseiKbn());
			vo.setShinseiName(shinseiName);
		}

		if (vo.getKeiro() != null && vo.getKeiro().getTsukinShudan() != null
				&& !vo.getKeiro().getTsukinShudan().isEmpty()) {

			String shudanName = shinseiMapper.getShudanName(vo.getKeiro().getTsukinShudan());
			vo.getKeiro().setShudanName(shudanName);
		}

		if (vo.getShinchokuKbn() != null && !vo.getShinchokuKbn().isEmpty()) {
			String name = shinseiMapper.getCodeNm(vo.getShinchokuKbn());
			vo.setCodeNm(name);
		}
		return vo;
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
		shinseiMapper.updateTorikesu(shinseiNo, tkComment, shainUid);

		shinseiMapper.insertProcessLog(shinseiNo, shainUid, "CANCEL");
	}

	@Override
	public void deleteIchijiHozonByHozonUid(String hozonUid) {
		shinseiMapper.deleteIchijiHozonByHozonUid(hozonUid);
	}

	@Override
	public void insertOshirase(ShainVO shain, String shinseiNo) {
		shinseiMapper.insertOshirase(shain, shinseiNo);
	}

	@Override
	@Transactional
	public void insertCancelLogs(String shinseiNo, String shinseiKbn, String shinseiYmd, ShainVO shain) {

		String kigyoCd = shain.getKigyo_Cd();
		String shainUid = shain.getShain_Uid();

		int syoriKbn = 5;

		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCd, shinseiNo);

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

	@Override
	public void loadShinseiDetail(String shinseiNo, String hozonUid, Model model) {
		ShinseiJyohouVO jyohouVo = getShinseiJyohou(shinseiNo);

		if (jyohouVo != null) {
			ShinseiKeiroVO keiroVo = getShinseiKeiro(shinseiNo);
			ShinseiShoruiVO shoruiVo = getShinseiShorui(shinseiNo);

			if (jyohouVo.getShinchokuKbn() != null) {
				jyohouVo.setCodeNm(getCodeNm(jyohouVo.getShinchokuKbn()));
			}
			if (jyohouVo.getShinseiKbn() != null) {
				jyohouVo.setShinseiName(getShinseiName(jyohouVo.getShinseiKbn()));
			}
			if (keiroVo != null && keiroVo.getTsukinShudan() != null) {
				keiroVo.setShudanName(getShudanName(keiroVo.getTsukinShudan()));
			}

			model.addAttribute("jyohou", jyohouVo);
			model.addAttribute("keiro", keiroVo);
			model.addAttribute("shorui", shoruiVo);
			model.addAttribute("isIchiji", false);
			return;
		}

		if (hozonUid == null) {
			throw new RuntimeException("hozonUidがありません。");
		}

		ShinseiIcDataVO ichijiVo = getIcData(hozonUid);

		model.addAttribute("ichiji", ichijiVo);
		model.addAttribute("isIchiji", true);
	}

}