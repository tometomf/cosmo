package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataDTO;
import org.cosmo.domain.ShinseiIcHozonVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.domain.ShinseiViewDTO;
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

	@GetMapping("/ichiji") // 하나
	public String showIchiji(@RequestParam(value = "no", required = false) String shinseiNo,
			@RequestParam(value = "hozonUid", required = false) String hozonUid, Model model) throws Exception {

		if (shinseiNo != null && !shinseiNo.trim().isEmpty()) {

			Long shinseiNoLong = Long.parseLong(shinseiNo);
			Long kigyoCd = shinseiService.getKigyoCdByShinseiNo(shinseiNoLong);
			ShinseiViewDTO view = shinseiService.getShinseiView(kigyoCd, shinseiNoLong);

			if (view != null) {

				String shainUid = shinseiService.getShainUidByShinseiNo(shinseiNo);
				ShainVO shinseiUser = shinseiService.getShainByUid(shainUid);

				model.addAttribute("mode", "view");
				model.addAttribute("view", view);
				model.addAttribute("shinseiUser", shinseiUser);

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

			model.addAttribute("mode", "ichiji");
			model.addAttribute("ichiji", ichiji);
			model.addAttribute("shinseiUser", shinseiUser);
			model.addAttribute("hozonUid", hozonUid);
			model.addAttribute("hozon", hozon);

			return "shinsei/11_shinseiDetail_02";
		}

		model.addAttribute("errorMessage", "申請番号または一時保存IDがありません。");
		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/reload") // 하나
	public String reloadIchiji(@RequestParam("hozonUid") String hozonUid, Model model) throws Exception {

		ShinseiIcHozonVO hozon = shinseiService.getIchijiHozon(hozonUid);
		if (hozon == null) {
			model.addAttribute("errorMessage", "データが見つかりません。");
			return "home";
		}

		String action = hozon.getActionNm();
		if (action == null || action.trim().isEmpty()) {
			model.addAttribute("errorMessage", "データが見つかりません。");
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

	@GetMapping("/torikesu") // 하나
	public String viewTorikesu(@RequestParam(value = "no", required = false) String shinseiNo,
			@RequestParam(value = "hozonUid", required = false) String hozonUid, Model model) {

		// 1. 신청번호 ㅇ
		if (shinseiNo != null) {

			Long shinseiNoLong = Long.parseLong(shinseiNo);
			Long kigyoCd = shinseiService.getKigyoCdByShinseiNo(shinseiNoLong);

			ShinseiViewDTO view = shinseiService.getShinseiView(kigyoCd, shinseiNoLong);
			String fileName = shinseiService.getFileName(shinseiNoLong);
			
			model.addAttribute("mode", "view");
			model.addAttribute("view", view);
			model.addAttribute("fileName", fileName);

			return "shinsei/dummy_11_shinseiDetail_03";
		}

		// 임시저장번호(hozon_uid) ㅇ
		if (hozonUid != null && !hozonUid.trim().isEmpty())

		{

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

			model.addAttribute("mode", "ichiji");
			model.addAttribute("ichiji", ichiji);
			model.addAttribute("keiro", ichiji.getKeiro());

			model.addAttribute("hozonUid", hozonUid);
			model.addAttribute("hozon", hozon);

			return "shinsei/dummy_11_shinseiDetail_03";
		}

		model.addAttribute("errorMessage", "申請番号または一時保存IDがありません。");
		return "shinsei/dummy_11_shinseiDetail_03";
	}

	@PostMapping("/updateTorikesu") // 하나
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

			return "home";
		}

		if (hasShinseiNo) {

			String shainUid = shinseiService.getShainUidByShinseiNo(shinseiNo);
			ShainVO shinseiUser = shinseiService.getShainByUid(shainUid);
			String email = shinseiService.getEmailByShainUid(shainUid);

			shinseiService.updateTorikesu(shinseiNo, tkComment, loginUser.getShain_Uid());
			shinseiService.insertOshirase(loginUser, shinseiUser, shinseiNo);
			shinseiService.insertCancelLogs(shinseiNo, shinseiKbn, shinseiYmd, loginUser);

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

	@PostMapping("/saishinsei") // 제교
	public String saishinsei(@RequestParam("kigyoCd") Long paramKigyoCd, @RequestParam("shinseiNo") Long shinseiNo,
			@RequestParam("shinseiRiyu") String shinseiRiyu,

			@RequestParam(value = "newZipCd", required = false) String newZipCd,
			@RequestParam(value = "newAddress1", required = false) String newAddress1,
			@RequestParam(value = "newAddress2", required = false) String newAddress2,
			@RequestParam(value = "newAddress3", required = false) String newAddress3,
			@RequestParam(value = "jitsuKinmuNissu", required = false) String jitsuKinmuNissu,
			@RequestParam(value = "addressIdoKeido", required = false) String addressIdoKeido,
			@RequestParam(value = "addressChgKbn", required = false) String addressChgKbn,
			@RequestParam(value = "kinmuAddressIdoKeido", required = false) String kinmuAddressIdoKeido,
			@RequestParam(value = "kinmuAddressChgKbn", required = false) String kinmuAddressChgKbn,

			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {

		ShainVO loginShain = (ShainVO) session.getAttribute("shain");

		if (loginShain == null) {
			rttr.addFlashAttribute("errorMsg", "ログイン情報が無効です。再度ログインしてください。");
			return "redirect:/";
		}

		Long kigyoCd = Long.parseLong(loginShain.getKigyo_Cd());
		String loginUserId = loginShain.getShain_Uid();
		String userIp = request.getRemoteAddr();

		ShinseiJyohouVO beforeJyohou = shinseiService.getShinseiJyohou(shinseiNo);

		String shinseiKbn = null;
		String beforeShinchokuKbn = null;

		if (beforeJyohou != null) {
			shinseiKbn = beforeJyohou.getShinseiKbn();
			beforeShinchokuKbn = beforeJyohou.getShinchokuKbn();
		}

		shinseiService.saishinsei(kigyoCd, shinseiNo, shinseiRiyu, newZipCd, newAddress1, newAddress2, newAddress3,
				jitsuKinmuNissu, addressIdoKeido, addressChgKbn, kinmuAddressIdoKeido, kinmuAddressChgKbn, loginUserId,
				userIp);

		ShainVO loginUser = loginShain;
		ShainVO shinseiUser = loginShain;

		shinseiService.insertOshiraseReapply(loginUser, shinseiUser, String.valueOf(shinseiNo));

		if (loginShain.getShain_Uid() != null) {

			String loginUidStr = loginShain.getShain_Uid();
			String email = shinseiService.getEmailByShainUid(loginUidStr);

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

		String shainUid = loginShain.getShain_Uid();
		shinseiService.insertReapplyLog(kigyoCd, shinseiNo, shainUid);

		String afterShinchokuKbn = "2";

		String subsystemId = (String) session.getAttribute("subsystemId");
		if (subsystemId == null || subsystemId.isEmpty()) {
			subsystemId = "113";
		} else if (subsystemId.length() > 3) {
			subsystemId = subsystemId.substring(0, 3);
		}

		String userUid = loginShain.getShain_Uid();
		String userTrack = request.getRemoteAddr();

		shinseiService.insertSaishinseiProcessLog(subsystemId, kigyoCd, shinseiNo, shinseiKbn, beforeShinchokuKbn,
				afterShinchokuKbn, userUid, userTrack);

		Long keiroSeq = 1L;

		shinseiService.updateEndKeiroForReapply(kigyoCd, shinseiNo, keiroSeq, loginUserId);

		rttr.addFlashAttribute("message", "再申請が完了しました。");
		return "redirect:/";
	}

	@GetMapping("/shinseiDetail") // 제교
	public String viewShinseiDetail(@RequestParam("no") Long shinseiNo, HttpSession session, Model model,
			RedirectAttributes rttr, HttpServletRequest request) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		if (shain == null) {
			rttr.addFlashAttribute("errorMsg", "ログイン情報が無効です。再度ログインしてください。");
			return "redirect:/";
		}

		Long kigyoCd;
		Long shainUid;

		try {
			kigyoCd = Long.parseLong(shain.getKigyo_Cd());
			shainUid = Long.parseLong(shain.getShain_Uid());
		} catch (NumberFormatException e) {
			rttr.addFlashAttribute("errorMsg", "社員情報の形式が不正です。管理者にお問い合わせください。");
			return "redirect:/";
		}

		String todayYmd = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
		String nextShinseiNo = shinseiService.getNextShinseiNo(kigyoCd, todayYmd);

		model.addAttribute("nextShinseiNo", nextShinseiNo);

		List<ShinseiDetailVO> detailList = shinseiService.getShinseiDetail(kigyoCd, shinseiNo);

		model.addAttribute("detailList", detailList); // 경로별 상세

		if (detailList == null || detailList.isEmpty()) {
			rttr.addFlashAttribute("errorMsg", "対象の申請が存在しません。");
			String referer = request.getHeader("Referer");
			if (referer != null && !referer.isEmpty()) {
				return "redirect:" + referer;
			} else {
				return "redirect:/";
			}
		}

		ShinseiDetailVO header = detailList.get(0);

		model.addAttribute("detailheader", header);

		System.out.println("### detailList size = " + (detailList == null ? 0 : detailList.size()));

		String kbn = header.getShinchokuKbn();
		if (!"2".equals(kbn) && !"4".equals(kbn)) {
			rttr.addFlashAttribute("errorMsg", "この画面は「承認待ち」または「承認済み」の申請のみ参照できます。");

			String referer = request.getHeader("Referer");
			if (referer != null && !referer.isEmpty()) {
				return "redirect:" + referer;
			} else {
				return "redirect:/";
			}
		}

		return "shinsei/11_shinseiDetail";
	}

	@PostMapping("/hikimodosu") // 제교
	public String hikimodosu(@RequestParam("shinseiNo") Long shinseiNo, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		if (shain == null) {
			redirectAttributes.addFlashAttribute("msg", "ログイン情報が無効です。");
			return "redirect:/";
		}

		Long kigyoCd = Long.parseLong(shain.getKigyo_Cd());

		String loginUserId = shain.getShain_Uid();

		String userIp = request.getRemoteAddr();

		shinseiService.hikimodosu(kigyoCd, shinseiNo, loginUserId, userIp);

		ShainVO loginUser = shain;
		ShainVO shinseiUser = shain;

		shinseiService.insertOshiraseHikimodosu(loginUser, shinseiUser, String.valueOf(shinseiNo));

		redirectAttributes.addFlashAttribute("msg", "引戻ししました。");

		return "home";
	}

	@GetMapping("/kakunin") // 제교
	public String viewKakunin(@RequestParam("no") Long shinseiNo, Model model, RedirectAttributes rttr,
			HttpServletRequest request, HttpSession session) {
		session.setAttribute("subsystemId", "1103");
		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null) {
			rttr.addFlashAttribute("errorMsg", "ログイン情報が無効です。再度ログインしてください。");
			return "redirect:/";
		}
		Long kigyoCd = null;
		try {
			kigyoCd = Long.valueOf(shain.getKigyo_Cd());
		} catch (NumberFormatException e) {
			rttr.addFlashAttribute("errorMsg", "企業情報が不正です。");
			return "redirect:/";
		}

		List<ShinseiDetailVO> keiroList = shinseiService.getKakuninJyohou(kigyoCd, shinseiNo);

		if (keiroList == null || keiroList.isEmpty()) {
			rttr.addFlashAttribute("errorMsg", "対象の申請が存在しません。");
			String referer = request.getHeader("Referer");
			if (referer != null && !referer.isEmpty()) {
				return "redirect:" + referer;
			} else {
				return "redirect:/";
			}
		}

		ShinseiDetailVO kakuninheader = keiroList.get(0);

		if (kakuninheader.getShinchokuKbn() != null) {
			String codeNm = shinseiService.getCodeNm(kakuninheader.getShinchokuKbn());
			kakuninheader.setCodeNm(codeNm);
		}

		if (kakuninheader.getShinseiKbn() != null) {
			String shinseiName = shinseiService.getShinseiName(kakuninheader.getShinseiKbn());
			kakuninheader.setShinseiName(shinseiName);
		}

		if ("3".equals(kakuninheader.getShinchokuKbn())) {
			model.addAttribute("fixedMsg1", "申請内容に不備があったため差し戻されています。");
			model.addAttribute("fixedMsg2", "不備内容を確認のうえ、再申請を行ってください。");
		}

		model.addAttribute("kakuninheader", kakuninheader);
		model.addAttribute("keiroList", keiroList);

		return "shinsei/11_shinseiDetail_03";
	}

	@PostMapping("/backFromConfirm") // 제교
	public String backFromConfirm(@RequestParam("shinseiNo") Long shinseiNo, HttpSession session) {

		ShainVO loginShain = (ShainVO) session.getAttribute("shain");
		Long kigyoCd = Long.parseLong(loginShain.getKigyo_Cd());

		shinseiService.clearHenkoFlags(kigyoCd, shinseiNo);
		return "redirect:/";
	}

	@GetMapping("/addressCheck") // 제교
	public String addressCheck(@RequestParam(required = false) String zip, @RequestParam(required = false) String pref,
			@RequestParam(required = false) String addr1, @RequestParam(required = false) String addr2, Model model) {

		return "shinsei/addressCheck";
	}

}