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

		// �侠�ｲｭ��簿ｳｴ�｡ｰ巐�
		ShinseiJyohouVO jyohou = shinseiMapper.getShinseiJyohou(shinseiNo);
		if (jyohou == null) {
			// �侠�ｲｭ��簿ｳｴ�螺�愍�ｩｴ �乱�洳
			throw new IllegalStateException("逕ｳ隲区ュ蝣ｱ縺悟ｭ伜惠縺励∪縺帙ｓ縲�(逕ｳ隲狗分蜿ｷ=" + shinseiNo + ")");
		}
		String shinseiKbn = jyohou.getShinseiKbn(); // �侠�ｲｭ�ｵｬ�ｶ� �ｽ罷糖
		String shinseiYmd = jyohou.getShinseiYmd(); // �侠�ｲｭ�攵�梵

		// �メ夋� �攵�亨�ｳｴ�｡ｴ�愍�｡� �据�曙�ｦｬ�ｸｰ
		shinseiMapper.updateShinseiToIchijihozon(kigyoCd, shinseiNo, loginUserId);

		// �侠�ｲｭ�攵�梵 null�｡� �ｳ��ｲｽ. �螺�株�侠�ｲｭ�愍�｡� �ｹｨ
		shinseiMapper.updateAlertForHikimodoshi(kigyoCd, shinseiNo, loginUserId);

		String kigyoCdStr = String.valueOf(kigyoCd); // �ｧ､寘ｼ �｡懋ｷｸ �ｩ肥�罹糖�豆�捩 String �ぎ�圸
		String shinseiNoStr = String.valueOf(shinseiNo);

		int syoriKbn = 6; // 6�ｲ� hikimodoshi
		Long logSeq = shinseiMapper.getNextLogSeq(kigyoCdStr, shinseiNoStr); // �共�搆 LOG_SEQ �ｱ�ｲ�

		// �｡懋ｷｸ�乱 INSERT
		shinseiMapper.insertShinseiLog(kigyoCdStr, shinseiNoStr, logSeq, syoriKbn, // 6 : 蠑墓綾縺�
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

	@Override
	public ShinseiShoruiVO getShinseiShorui(Long shinseiNo) {
		return shinseiMapper.getShinseiShorui(shinseiNo);
	}

	@Override
	public ShinseiIcDataVO getIcData(String hozonUid) {

		ShinseiIcHozonVO row = shinseiMapper.getIchijiHozon(hozonUid);

		if (row == null) {
			return null;
		}

		// BLOB 竊� JSON �ｬｸ�梵�龍 �ｳ�嶹�
		String json = new String(row.getData(), StandardCharsets.UTF_8);

		ObjectMapper mapper = new ObjectMapper();
		ShinseiIcDataVO vo;

		try {
			vo = mapper.readValue(json, ShinseiIcDataVO.class);
		} catch (Exception e) {
			throw new RuntimeException("�桷�亨����棗 �魂�擽奓ｰ �ｳ�嶹� �丶�･�", e);
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
			throw new RuntimeException("hozonUid縺後≠繧翫∪縺帙ｓ縲�");
		}

		ShinseiIcDataVO ichijiVo = getIcData(hozonUid);

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
			String addressChgKbn, String loginUserId, String userIp) {

		Integer updUserId = null;
		if (loginUserId != null && !loginUserId.trim().isEmpty()) {
			try {
				updUserId = Integer.valueOf(loginUserId.trim());
			} catch (NumberFormatException e) {
				// 변환 실패하면 그냥 null 유지
			}
		}

		// ★ 1) 주소 + 위도경도 + 플래그 업데이트
		shinseiMapper.updateShinseiForReapply(kigyoCd, shinseiNo, shinseiRiyu, newZipCd, newAddress1, newAddress2,
				newAddress3, addressIdoKeido, addressChgKbn, updUserId);

		// ★ 2) 실근무일수 변환
		Integer jitsu = null;
		if (jitsuKinmuNissu != null && !jitsuKinmuNissu.trim().isEmpty()) {
			try {
				jitsu = Integer.valueOf(jitsuKinmuNissu.trim());
			} catch (NumberFormatException e) {
			}
		}

		// ★ 3) 경로 쪽 업데이트
		shinseiMapper.updateStartKeiroForReapply(kigyoCd, shinseiNo, jitsu, updUserId);
	}

}