package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.KeiroInputService;
import org.cosmo.service.OshiraseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/keiroinput")
public class KeiroInputController {

	@Autowired
	private KeiroInputService keiroInputservice;

	@Autowired
	private IchijiHozonService ichijiHozonService;

	@Autowired
	private OshiraseService oshiraseService;

	@GetMapping("/07_keirodtInput")
	public String densha(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput";
	}

	@GetMapping("/07_keirodtInput_02")
	public String bus(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_02";
	}

	@GetMapping("/07_keirodtInput_04")
	public String toho(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_04";
	}

	@GetMapping("/06_keiroInput")
	public String select(HttpSession session, Model model) {
		Integer keiroSeq = 1;

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		System.out.println(shain);
		if (shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		/*
		 * ShainKeiroDTO dto =
		 * keiroInputservice.getShainKeiro(Integer.parseInt(shain.getKigyo_Cd()),
		 * Long.parseLong(shain.getShain_Uid()) , keiroSeq);
		 */
		ShainKeiroDTO dto = keiroInputservice.getShainKeiro(100, 2001L, keiroSeq);

		model.addAttribute("keiro", dto);

		System.out.println(dto);
		return "keiroinput/06_keiroInput";
	}

	@GetMapping("/07_keirodtInput_03")
	public String jidousha(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "keiroinput/07_keirodtInput_03";
	}

	 @PostMapping("/tempSave")
	    public String tempSaveCommute(
	            @RequestParam("commuteJson") String commuteJson,
	            HttpSession session) {

	        ShainVO shain = (ShainVO) session.getAttribute("shain");
	        if (shain == null) {
	            throw new RuntimeException("セッションに社員情報がありません。");
	        }

	        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
	        String shozokuCd  = shain.getShozoku_Cd();
	        String shinseiKbn = shain.getShinchoku_kbn();

	        if (shinseiKbn == null) {
	            shinseiKbn = "01"; // 기본값 (필요 시 변경)
	        }

	        byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

	        IchijiHozonDTO dto = new IchijiHozonDTO();
	        dto.setUserUid(userUid);
	        dto.setShinseiKbn(shinseiKbn);
	        dto.setShozokuCd(shozokuCd);
	        dto.setActionNm("TSUKIN_SHUDAN_TEMP_SAVE");
	        dto.setData(dataBytes);

	        dto.setAddUserId(userUid);
	        dto.setUpdUserId(userUid);

	        ichijiHozonService.saveTemp(dto);
	        int newUid = dto.getHozonUid(); 

	        oshiraseService.saveTempOshirase(shain);

	        // 임시저장 후 다음 페이지로 이동
	        return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
	    }

}
