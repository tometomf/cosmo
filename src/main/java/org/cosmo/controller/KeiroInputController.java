package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.KeiroInputDenshaDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
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
	public String densha(@RequestParam("shinseiNo") Integer shinseiNo,
	                     @RequestParam("keiroSeq") Integer keiroSeq,
	                     Locale locale,
	                     HttpSession session,
	                     Model model) {

	    Date date = new Date();
	    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	    String formattedDate = dateFormat.format(date);
	    model.addAttribute("serverTime", formattedDate);

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
	        return "redirect:/login";
	    }

	    Integer kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
	    Long shainUid   = Long.parseLong(shain.getShain_Uid());

	    KeiroInputDenshaDTO denshaDto =
	            keiroInputservice.getDenshaKeiroDetail(kigyoCd, shainUid, shinseiNo, keiroSeq);

	    model.addAttribute("densha", denshaDto);

	    return "keiroinput/07_keirodtInput";
	}

	@GetMapping("/07_keirodtInput_02")
	public String bus(@RequestParam(name = "shudanType", required = false) String shudanType, Locale locale,
			Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
	    model.addAttribute("shudanType", shudanType);

		return "keiroinput/07_keirodtInput_02";
	}
	
	@GetMapping("/07_keirodtInput_04")
	public String toho(@RequestParam(name = "shudanType", required = false) String shudanType, Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("shudanType", shudanType);
		
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
        ShinseiStartKeiroVO startKeiro = keiroInputservice.getViaPlace1(kigyoCd, shainUid);
        
        
        
        model.addAttribute("addr", addr);
        model.addAttribute("kinmuAddr", kinmuAddr);
        model.addAttribute("startkeiro", startKeiro);
        return "keiroinput/07_keirodtInput_03";
    }


	@PostMapping("/tempSave")
    public String tempSaveCommute(
            @RequestParam("commuteJson") String commuteJson,
            @RequestParam("actionUrl") String actionUrl,
            @RequestParam(value = "redirectUrl", required = false) String redirectUrl,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");

        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
        String  shozokuCd = shain.getShozoku_Cd();
        String  shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null || shinseiKbn.isEmpty()) {
            shinseiKbn = "01";
        }
        
        System.out.println(actionUrl);

        byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

        IchijiHozonDTO dto = new IchijiHozonDTO();
        dto.setUserUid(userUid);
        dto.setShinseiKbn(shinseiKbn);
        dto.setShozokuCd(shozokuCd);
        dto.setActionNm(actionUrl);
        dto.setData(dataBytes);

        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);
        oshiraseService.saveTempOshirase(shain);

        if(redirectUrl == "") {        	
        	return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
        }
        
        return "redirect:" + redirectUrl;
    }
	 
	 @GetMapping(value = "/shain/location", produces = "application/json; charset=UTF-8")
	    @ResponseBody
	    public ShainLocationVO getShainLocation(HttpSession session) {

		    ShainVO shain = (ShainVO) session.getAttribute("shain");

	        Long userUid   = Long.valueOf(shain.getShain_Uid());
	        Long kigyoCd   =  Long.valueOf(shain.getKigyo_Cd());
	        

	        return keiroInputservice.getShainLocation(kigyoCd, userUid);
	    }

}
