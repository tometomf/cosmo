package org.cosmo.controller;

import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataDTO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.service.ShinseiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

@Controller
@RequestMapping("/shinsei")
public class ShinseiController {

	@Autowired
	private ShinseiService shinseiService;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/ichiji")
	public String showIchiji(@RequestParam(value = "no", required = false) String shinseiNo,
			@RequestParam(value = "hozonUid", required = false) String hozonUid, Model model) throws Exception {

		if (shinseiNo != null && !shinseiNo.trim().isEmpty()) {

			Long shinseiNoLong = Long.parseLong(shinseiNo);

			ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNoLong);
			ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNoLong);
			ShinseiShoruiVO shoruiVo = shinseiService.getShinseiShorui(shinseiNoLong);
			String fileName = shinseiService.getFileName(shinseiNoLong);

			if (jyohouVo != null) {

				String shainUid = shinseiService.getShainUidByShinseiNo(shinseiNo);

				ShainVO shinseiUser = null;
				if (shainUid != null && !shainUid.trim().isEmpty()) {
					shinseiUser = shinseiService.getShainByUid(shainUid);
				}

				if (jyohouVo.getShinseiKbn() != null) {
					jyohouVo.setShinseiName(shinseiService.getShinseiName(jyohouVo.getShinseiKbn()));
				}

				if (keiroVo != null && keiroVo.getTsukinShudan() != null) {
					keiroVo.setShudanName(shinseiService.getShudanName(keiroVo.getTsukinShudan()));
				}

				if (jyohouVo.getShinchokuKbn() != null) {
					jyohouVo.setCodeNm(shinseiService.getCodeNm(jyohouVo.getShinchokuKbn()));
				}

				model.addAttribute("jyohou", jyohouVo);
				model.addAttribute("keiro", keiroVo);
				model.addAttribute("shorui", shoruiVo);
				model.addAttribute("fileName", fileName);
				model.addAttribute("shinseiUser", shinseiUser);
				model.addAttribute("isIchiji", false);

				return "shinsei/11_shinseiDetail_02";
			}
		}

		if (hozonUid != null && !hozonUid.trim().isEmpty()) {

			ShinseiIcDataDTO ichiji = shinseiService.getIcData(hozonUid);
			ShinseiIcHozonVO hozon = shinseiService.getIchijiHozon(hozonUid);

			ShainVO shinseiUser = null;
			if (ichiji != null && ichiji.getShainUid() != null) {
				shinseiUser = shinseiService.getShainByUid(ichiji.getShainUid());
			}

			model.addAttribute("ichiji", ichiji);
			model.addAttribute("shinseiUser", shinseiUser);
			model.addAttribute("hozonUid", hozonUid);
			model.addAttribute("hozon", hozon);
			model.addAttribute("isIchiji", true);

			return "shinsei/11_shinseiDetail_02";
		}

		model.addAttribute("errorMessage", "申請番号または一時保存IDがありません。");
		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/reload")
	public String reloadIchiji(@RequestParam("hozonUid") String hozonUid, Model model) throws Exception {

		ShinseiIcHozonVO hozon = shinseiService.getIchijiHozon(hozonUid);
		if (hozon == null) {
			model.addAttribute("errorMessage", "데이터 없음");
			return "home";
		}

		String action = hozon.getActionNm();
		if (action == null || action.trim().isEmpty()) {
			model.addAttribute("errorMessage", "데이터 없음");
			return "home";
		}

		byte[] jsonBytes = hozon.getData();
		String jsonStr = new String(jsonBytes, StandardCharsets.UTF_8);

		Gson gson = new Gson();
		ShinseiIcDataDTO data = gson.fromJson(jsonStr, ShinseiIcDataDTO.class);

		model.addAttribute("ichiji", data);
		model.addAttribute("hozonUid", hozonUid);

		return "redirect:" + action;
	}

	@GetMapping("/torikesu")
	public String viewTorikesu(@RequestParam(value = "no", required = false) String shinseiNo,
			@RequestParam(value = "hozonUid", required = false) String hozonUid, Model model) {

		// 1. 신청번호 ㅇ
		if (shinseiNo != null) {

			Long shinseiNoLong = Long.parseLong(shinseiNo);

			ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNoLong);

			if (jyohouVo != null) {

				ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNoLong);
				ShinseiShoruiVO shoruiVo = shinseiService.getShinseiShorui(shinseiNoLong);
				String fileName = shinseiService.getFileName(shinseiNoLong);

				if (jyohouVo.getShinchokuKbn() != null) {
					jyohouVo.setCodeNm(shinseiService.getCodeNm(jyohouVo.getShinchokuKbn()));
				}

				if (jyohouVo.getShinseiKbn() != null) {
					jyohouVo.setShinseiName(shinseiService.getShinseiName(jyohouVo.getShinseiKbn()));
				}

				if (keiroVo != null && keiroVo.getTsukinShudan() != null) {
					keiroVo.setShudanName(shinseiService.getShudanName(keiroVo.getTsukinShudan()));
				}

				model.addAttribute("jyohou", jyohouVo);
				model.addAttribute("keiro", keiroVo);
				model.addAttribute("shorui", shoruiVo);
				model.addAttribute("fileName", fileName);
				model.addAttribute("isIchiji", false); // 반려 상태
				model.addAttribute("hozonUid", hozonUid);

				return "shinsei/dummy_11_shinseiDetail_03";
			}
		}

		// 임시저장번호(hozon_uid) ㅇ
		if (hozonUid != null && !hozonUid.trim().isEmpty()) {

			ShinseiIcDataDTO ichiji = shinseiService.getIcData(hozonUid);
			ShinseiIcHozonVO hozon = shinseiService.getIchijiHozon(hozonUid);

			if (ichiji == null) {
				model.addAttribute("errorMessage", "一時保存データが見つかりません。");
				return "shinsei/dummy_11_shinseiDetail_03";
			}

			if (ichiji.getShinseiKbn() != null) {
				ichiji.setShinseiName(shinseiService.getShinseiName(ichiji.getShinseiKbn()));
			}

			if (ichiji.getKeiro() != null && ichiji.getKeiro().getTsukinShudan() != null) {
				ichiji.getKeiro().setShudanName(shinseiService.getShudanName(ichiji.getKeiro().getTsukinShudan()));
			}

			model.addAttribute("ichiji", ichiji);
			model.addAttribute("keiro", ichiji.getKeiro());
			model.addAttribute("shorui", null);
			model.addAttribute("isIchiji", true);
			model.addAttribute("hozonUid", hozonUid);
			model.addAttribute("hozon", hozon);

			return "shinsei/dummy_11_shinseiDetail_03";
		}

		// 에러 처리
		model.addAttribute("errorMessage", "申請番号または一時保存IDがありません。");
		return "shinsei/dummy_11_shinseiDetail_03";
	}

	@PostMapping("/updateTorikesu")
	public String update(@RequestParam("tkComment") String tkComment,
			@RequestParam(value = "shinseiNo", required = false) String shinseiNo,
			@RequestParam("beforeKbn") String shinchokuKbn, @RequestParam("hozonUid") String hozonUid,
			@RequestParam("shinseiKbn") String shinseiKbn, @RequestParam("shinseiYmd") String shinseiYmd,
			HttpSession session, Model model) {

		ShainVO loginUser = (ShainVO) session.getAttribute("shain");
		boolean hasShinseiNo = (shinseiNo != null && !shinseiNo.trim().isEmpty());
		boolean hasHozonUid = (hozonUid != null && !hozonUid.trim().isEmpty());

		if (!hasShinseiNo && hasHozonUid) {

			shinseiService.deleteIchijiHozonByHozonUid(hozonUid);

			model.addAttribute("errorMessage", "保存データのみ削除しました。");
			return "home";
		}

		if (hasShinseiNo) {

			String shainUid = shinseiService.getShainUidByShinseiNo(shinseiNo);
			ShainVO shinseiUser = shinseiService.getShainByUid(shainUid);
			String email = shinseiService.getEmailByShainUid(shainUid);

			shinseiService.updateTorikesu(shinseiNo, tkComment, loginUser.getShain_Uid());
			shinseiService.insertOshirase(loginUser, shinseiUser, shinseiNo);
			shinseiService.insertCancelLogs(shinseiNo, shinseiKbn, shinseiYmd, loginUser);

			if (hasHozonUid) {
				shinseiService.deleteIchijiHozonByHozonUid(hozonUid);
			}

			if (email != null && !email.trim().isEmpty()) {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(email);
				message.setSubject("申請取消のご案内");
				message.setText("ご申請内容につきまして、取消処理が完了しましたのでご連絡申し上げます。");
				mailSender.send(message);
			}

			return "/huzuiNewInput/26_huzuiKanryo";
		}

		return "/huzuiNewInput/26_huzuiKanryo";
	}

	@PostMapping("/saishinsei")
	public String saishinsei(@RequestParam("kigyoCd") Long kigyoCd, @RequestParam("shinseiNo") Long shinseiNo,
			@RequestParam("shinseiRiyu") String shinseiRiyu,

			@RequestParam(value = "newZipCd", required = false) String newZipCd,
			@RequestParam(value = "newAddress1", required = false) String newAddress1,
			@RequestParam(value = "newAddress2", required = false) String newAddress2,
			@RequestParam(value = "newAddress3", required = false) String newAddress3,
			@RequestParam(value = "jitsuKinmuNissu", required = false) String jitsuKinmuNissu,
			@RequestParam(value = "addressIdoKeido", required = false) String addressIdoKeido,
			@RequestParam(value = "addressChgKbn", required = false) String addressChgKbn,

			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {

		ShainVO loginShain = (ShainVO) session.getAttribute("shain");

		String loginUserId = (loginShain != null && loginShain.getShain_Uid() != null)
				? String.valueOf(loginShain.getShain_Uid())
				: null;

		String userIp = request.getRemoteAddr();

		shinseiService.saishinsei(kigyoCd, shinseiNo, shinseiRiyu, newZipCd, newAddress1, newAddress2, newAddress3,
				jitsuKinmuNissu, addressIdoKeido, addressChgKbn, loginUserId, userIp);

		if (loginShain != null && loginShain.getShain_Uid() != null) {

			String email = "homeking12345@gmail.com";

			if (email != null && !email.trim().isEmpty()) {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(email);

				String userName = (loginShain.getShain_Nm() != null) ? loginShain.getShain_Nm() : "ご担当者様";

				message.setSubject("再申請処理完了のお知らせ");
				message.setText(
						userName + " 様\n\n" + "通勤費申請の再申請処理が完了しました。\n" + "申請番号：" + shinseiNo + "\n\n" + "内容をご確認ください。");

				System.out.println("★ メール送信開始 → " + email);
				mailSender.send(message);
				System.out.println("★ メール送信完了");

			}
		}

		rttr.addFlashAttribute("message", "再申請が完了しました。");
		return "redirect:/idoconfirm/kanryoPage?shinseiNo=" + shinseiNo;
	}

	@GetMapping("/shinseiDetail")
	public String viewShinseiDetail(@RequestParam("no") Long shinseiNo, HttpSession session, Model model) {

		Long kigyoCd = (Long) session.getAttribute("kigyoCd");

		if (kigyoCd == null) {
			kigyoCd = 1L;
			session.setAttribute("kigyoCd", kigyoCd);
		}

		ShinseiDetailVO detail = shinseiService.getShinseiDetail(kigyoCd, shinseiNo);

		model.addAttribute("detail", detail);

		return "shinsei/11_shinseiDetail";
	}

	@PostMapping("/hikimodosu")
	public String hikimodosu(@RequestParam("shinseiNo") Long shinseiNo, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		Long kigyoCd = (Long) session.getAttribute("kigyoCd");

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		String loginUserId = (shain != null) ? shain.getShain_Uid() : "0";

		String userIp = request.getRemoteAddr();

		shinseiService.hikimodosu(kigyoCd, shinseiNo, loginUserId, userIp);

		redirectAttributes.addFlashAttribute("msg", "引戻ししました。");
		return "home";
	}

	@GetMapping("/kakunin")
	public String viewKakunin(@RequestParam("no") Long shinseiNo, Model model) {

		// Long 타입으로 서비스 호출
		ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNo);
		ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNo);
		ShinseiShoruiVO shoruiVo = shinseiService.getShinseiShorui(shinseiNo);

		// 진척구분 이름 설정
		if (jyohouVo != null && jyohouVo.getShinchokuKbn() != null) {
			String codeNm = shinseiService.getCodeNm(jyohouVo.getShinchokuKbn());
			jyohouVo.setCodeNm(codeNm);
		}

		// 신청구분 이름 설정
		if (jyohouVo != null && jyohouVo.getShinseiKbn() != null) {
			String shinseiName = shinseiService.getShinseiName(jyohouVo.getShinseiKbn());
			jyohouVo.setShinseiName(shinseiName);
		}

		// 통근수단 이름 설정
		if (keiroVo != null && keiroVo.getTsukinShudan() != null) {
			String shudanName = shinseiService.getShudanName(keiroVo.getTsukinShudan());
			keiroVo.setShudanName(shudanName);
		}

		// 모델에 담기
		model.addAttribute("keiro", keiroVo);
		model.addAttribute("jyohou", jyohouVo);
		model.addAttribute("shorui", shoruiVo);

		return "shinsei/11_shinseiDetail_03";
	}

	@PostMapping("/backFromConfirm")
	public String backFromConfirm(@RequestParam("kigyoCd") Long kigyoCd, @RequestParam("shinseiNo") Long shinseiNo) {

		shinseiService.clearHenkoFlags(kigyoCd, shinseiNo);

		return "redirect:/";
	}

	@PostMapping("/resubmit")
	public String resubmit(@RequestParam("shinseiNo") Long shinseiNo, @RequestParam("shinseiRiyu") String shinseiRiyu,
			HttpSession session, RedirectAttributes rttr) {

		ShainVO loginShain = (ShainVO) session.getAttribute("loginShain");
		if (loginShain == null) {

			rttr.addFlashAttribute("errorMessage", "ログイン情報が取得できませんでした。");
			return "redirect:/shinsei/list";
		}

		Long kigyoCd = null;
		if (loginShain.getKigyo_Cd() != null && !loginShain.getKigyo_Cd().isEmpty()) {
			kigyoCd = Long.valueOf(loginShain.getKigyo_Cd());
		}

		String updUserId = loginShain.getShain_Uid();

		shinseiService.resubmitShinsei(kigyoCd, shinseiNo, shinseiRiyu, updUserId);

		rttr.addFlashAttribute("message", "再申請しました。");

		return "redirect:/shinsei/list";
	}

	@GetMapping("/addressCheck")
	public String addressCheck(@RequestParam(required = false) String zip, @RequestParam(required = false) String pref,
			@RequestParam(required = false) String addr1, @RequestParam(required = false) String addr2, Model model) {

		return "shinsei/addressCheck";
	}

}