package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String jidousha(Locale locale, HttpSession session, Model model) {

        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formattedDate);

        
        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
            return "redirect:/login";
        }

        
        Integer kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
        Long shainUid = Long.parseLong(shain.getShain_Uid());

        
        ShinseiDTO addr = keiroInputservice.getShinseiAddress(kigyoCd, shainUid);
        ShinseiDTO kinmuAddr = keiroInputservice.getShinseiKinmuAddress(kigyoCd, shainUid);
        
        model.addAttribute("addr", addr);
        model.addAttribute("kinmuAddr", kinmuAddr);
        return "keiroinput/07_keirodtInput_03";
    }

	@PostMapping("/tempSave")
    public String tempSaveCommute(
            @RequestParam("commuteJson") String commuteJson,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");

        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
        String  shozokuCd = shain.getShozoku_Cd();
        String  shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null || shinseiKbn.isEmpty()) {
            shinseiKbn = "01";
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

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);

        return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
    }
	 
	 @PostMapping("/saveViaPlace1")
	 @ResponseBody
	 public String saveViaPlace1(@RequestParam("viaPlace1") String viaPlace1,
	                             HttpSession session) {

	     System.out.println(">>> saveViaPlace1 called");
	     System.out.println("  viaPlace1 = " + viaPlace1);

	     ShainVO shain = (ShainVO) session.getAttribute("shain");
	     if (shain == null) {
	         System.out.println("  shain in session is null");
	         return "NG_NO_SESSION";
	     }

	     Integer kigyoCd   = Integer.valueOf(shain.getKigyo_Cd());
	     Integer shinseiNo = 1;  // 지금은 테스트용 더미값
	     Integer keiroSeq  = 1;  // 지금은 테스트용 더미값

	     System.out.println("  kigyoCd=" + kigyoCd
	             + ", shinseiNo=" + shinseiNo
	             + ", keiroSeq=" + keiroSeq);

	     keiroInputservice.saveViaPlace1(kigyoCd, shinseiNo, keiroSeq, viaPlace1);

	     System.out.println(">>> saveViaPlace1 end");
	     return "OK";
	 }

}
