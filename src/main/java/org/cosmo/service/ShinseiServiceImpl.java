package org.cosmo.service;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataDTO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroDetailVO;
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
	public ShinseiIcHozonVO getIchijiHozon(String hozonUid) {
		return shinseiMapper.getIchijiHozon(hozonUid);
	}

	@Override
	public String getShainUidByShinseiNo(String shinseiNo) {
		return shinseiMapper.getShainUidByShinseiNo(shinseiNo);
	}

	@Override
	public ShainVO getShainByUid(String shainUid) {
		return shinseiMapper.getShainByUid(shainUid);
	}

	@Override
	@Transactional
	public void hikimodosu(Long kigyoCd, Long shinseiNo, String loginUserId, String userIp) {

		ShinseiJyohouVO jyohou = shinseiMapper.getShinseiJyohou(shinseiNo);
		if (jyohou == null) {
			throw new IllegalStateException("エラーが発生しました。" + shinseiNo + ")");
		}
		String shinseiKbn = jyohou.getShinseiKbn();
		String shinseiYmd = jyohou.getShinseiYmd();

		shinseiMapper.updateShinseiToIchijihozon(kigyoCd, shinseiNo, loginUserId);

		shinseiMapper.updateAlertForHikimodoshi(kigyoCd, shinseiNo, loginUserId);

		String kigyoCdStr = String.valueOf(kigyoCd);
		String shinseiNoStr = String.valueOf(shinseiNo);

		int syoriKbn = 6;
		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCdStr, shinseiNoStr);

		shinseiMapper.insertShinseiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, shinseiKbn, shinseiYmd, loginUserId // SHAIN_UID
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

	@Override
	public ShinseiShoruiVO getShinseiShorui(Long shinseiNo) {
		return shinseiMapper.getShinseiShorui(shinseiNo);
	}

	@Override
	public ShinseiIcDataDTO getIcData(String hozonUid) {

		ShinseiIcHozonVO row = shinseiMapper.getIchijiHozon(hozonUid);

		if (row == null) {
			return null;
		}

		String json = new String(row.getData(), StandardCharsets.UTF_8);

		ObjectMapper mapper = new ObjectMapper();
		ShinseiIcDataDTO vo;

		try {
			vo = mapper.readValue(json, ShinseiIcDataDTO.class);
		} catch (Exception e) {
			throw new RuntimeException("エラーが発生しました。", e);
		}

		if (row.getShinseiKbn() != null && !row.getShinseiKbn().isEmpty()) {
			vo.setShinseiKbn(row.getShinseiKbn());
			String shinseiName = shinseiMapper.getShinseiName(row.getShinseiKbn());
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
	public String getFileName(Long shinseiNo) {
		return shinseiMapper.getFileName(shinseiNo);
	}

	@Override
	public String getShinchokuKbn(String shinseiNo) {
		return shinseiMapper.getShinchokuKbn(shinseiNo);
	}

	@Override
	public String getEmailByShainUid(String shainUid) {
		return shinseiMapper.getEmailByShainUid(shainUid);
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
	public void insertOshirase(ShainVO loginUser, ShainVO shinseiUser, String shinseiNo) {
		shinseiMapper.insertOshirase(loginUser, shinseiUser, shinseiNo);
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
	public void loadShinseiDetail(Long shinseiNo, String hozonUid, Model model) {
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
			throw new RuntimeException("エラーが発生しました。");
		}

		ShinseiIcDataDTO ichijiVo = getIcData(hozonUid);

		model.addAttribute("ichiji", ichijiVo);
		model.addAttribute("isIchiji", true);
	}

	@Override
	public void deleteShinseiByShinseiNo(String shinseiNo) {
		shinseiMapper.deleteShinseiByShinseiNo(shinseiNo);
	}

	@Override
	public void clearHenkoFlags(Long kigyoCd, Long shinseiNo) {
		shinseiMapper.clearHenkoFlags(kigyoCd, shinseiNo);
	}

	@Override
	public void resubmitShinsei(Long kigyoCd, Long shinseiNo, String shinseiRiyu, String updUserId) {
		shinseiMapper.updateForResubmit(kigyoCd, shinseiNo, shinseiRiyu, updUserId);
	}

	@Override
	@Transactional
	public void saishinsei(Long kigyoCd, Long shinseiNo, String shinseiRiyu, String newZipCd, String newAddress1,
			String newAddress2, String newAddress3, String jitsuKinmuNissu, String addressIdoKeido,
			String addressChgKbn, String kinmuAddressIdoKeido, String kinmuAddressChgKbn, String loginUserId,
			String userIp) {

		Integer updUserId = null;
		if (loginUserId != null && !loginUserId.trim().isEmpty()) {
			try {
				updUserId = Integer.valueOf(loginUserId.trim());
			} catch (NumberFormatException e) {

			}
		}

		shinseiMapper.updateShinseiForReapply(kigyoCd, shinseiNo, shinseiRiyu, newZipCd, newAddress1, newAddress2,
				newAddress3, addressIdoKeido, addressChgKbn, kinmuAddressIdoKeido, kinmuAddressChgKbn, updUserId);

		Integer jitsu = null;
		if (jitsuKinmuNissu != null && !jitsuKinmuNissu.trim().isEmpty()) {
			try {
				jitsu = Integer.valueOf(jitsuKinmuNissu.trim());
			} catch (NumberFormatException e) {
			}
		}

		shinseiMapper.updateStartKeiroForReapply(kigyoCd, shinseiNo, jitsu, updUserId);
	}

	@Override
	public ShinseiKeiroDetailVO getShinseiKeiroDetail(Long kigyoCd, Long shinseiNo, Integer keiroSeq) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("kigyoCd", kigyoCd);
		param.put("shinseiNo", shinseiNo);
		param.put("keiroSeq", keiroSeq);
		return shinseiMapper.getShinseiKeiroDetail(param);
	}


}