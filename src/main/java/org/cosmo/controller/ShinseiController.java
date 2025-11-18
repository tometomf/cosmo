package org.cosmo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDetailVO;
import org.cosmo.domain.ShinseiIcDataVO;
import org.cosmo.domain.ShinseiJyohouVO;
import org.cosmo.domain.ShinseiKeiroVO;
import org.cosmo.domain.ShinseiShoruiVO;
import org.cosmo.service.ShinseiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/shinsei")
public class ShinseiController {

	@Autowired
	private ShinseiService shinseiService;

	@GetMapping("/ichiji")
	public String showIchiji(@RequestParam("hozonUid") String hozonUid, Model model) throws Exception {

		ShinseiIcDataVO ichiji = shinseiService.getIcData(hozonUid);

		model.addAttribute("ichiji", ichiji);
		model.addAttribute("hozonUid", hozonUid);

		return "shinsei/11_shinseiDetail_02";
	}

	@GetMapping("/torikesu")
	public String viewTorikesu(@RequestParam(value = "no", required = false) Long shinseiNo,
			@RequestParam(value = "hozonUid", required = false) String hozonUid, Model model) {

		// 1. 신청번호 ㅇ
		if (shinseiNo != null) {

			ShinseiJyohouVO jyohouVo = shinseiService.getShinseiJyohou(shinseiNo);

			if (jyohouVo != null) {

				ShinseiKeiroVO keiroVo = shinseiService.getShinseiKeiro(shinseiNo);
				ShinseiShoruiVO shoruiVo = shinseiService.getShinseiShorui(shinseiNo);
				String fileName = shinseiService.getFileName(shinseiNo);

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
				model.addAttribute("hozonUid", null);

				return "shinsei/dummy_11_shinseiDetail_03";
			}
		}

		// 임시저장번호(hozon_uid) ㅇ
		if (hozonUid != null && !hozonUid.trim().isEmpty()) {

			ShinseiIcDataVO ichiji = shinseiService.getIcData(hozonUid);

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
			model.addAttribute("jyohou", ichiji);
			model.addAttribute("keiro", ichiji.getKeiro());
			model.addAttribute("shorui", null);
			model.addAttribute("isIchiji", true);
			model.addAttribute("hozonUid", hozonUid);

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

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		String shainUid = shain.getShain_Uid();

		boolean hasShinseiNo = (shinseiNo != null && !shinseiNo.trim().isEmpty());

		// 신청구분 1(임시저장) + 신청번호 x : 데이터 삭제
		if ("1".equals(shinchokuKbn) && !hasShinseiNo) {

			shinseiService.deleteIchijiHozonByHozonUid(hozonUid);

			model.addAttribute("errorMessage", "保存データのみ削除しました。");
			return "home";
		}

		// 신청구분1(임시저장) + 신청번호 ㅇ / 신청구분3(반려) : 취소처리
		if ("1".equals(shinchokuKbn) && hasShinseiNo) {

			shinseiService.updateTorikesu(shinseiNo, tkComment, shainUid);
			shinseiService.insertOshirase(shain, shinseiNo);
			shinseiService.insertCancelLogs(shinseiNo, shinseiKbn, shinseiYmd, shain);

			shinseiService.deleteIchijiHozonByHozonUid(hozonUid);
			shinseiService.deleteShinseiByShinseiNo(shinseiNo);

			return "home";
		}

		if ("3".equals(shinchokuKbn)) {

			shinseiService.updateTorikesu(shinseiNo, tkComment, shainUid);
			shinseiService.insertOshirase(shain, shinseiNo);
			shinseiService.insertCancelLogs(shinseiNo, shinseiKbn, shinseiYmd, shain);

			return "home";
		}

		return "home";
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
}