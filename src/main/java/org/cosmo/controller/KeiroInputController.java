package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.CodeVO;
import org.cosmo.domain.IchijiHozonDTO;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/keiroinput")
public class KeiroInputController {

	@Autowired
	private KeiroInputService keiroInputservice;

	@Autowired
	private IchijiHozonService ichijiHozonService;

	@Autowired
	private OshiraseService oshiraseService;

	// 하정
	@GetMapping("/07_keirodtInput")
	public String densha(@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "keiroSeq", required = false) String keiroSeq, Locale locale, HttpSession session,
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
		Long shainUid = Long.parseLong(shain.getShain_Uid());
		ShainKeiroDTO keiroDto = null;

		if (shinseiNo != null && shinseiNo != "" && keiroSeq != null && shinseiNo != "") {
			keiroDto = keiroInputservice.getShainKeiro(kigyoCd, shainUid, Integer.valueOf(keiroSeq));
		}

		String ichijiHozonJson = "{}";

		try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ichijiHozonJson = json;

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				JsonNode keiroNode = root.path("startKeiro");

				if (keiroDto == null) {
					keiroDto = new ShainKeiroDTO();
				}

				String startPlace = keiroNode.path("startPlace").asText(null);
				String endPlace = keiroNode.path("endPlace").asText(null);
				String viaPlace1 = keiroNode.path("viaPlace1").asText(null);
				String viaPlace2 = keiroNode.path("viaPlace2").asText(null);
				String viaPlace3 = keiroNode.path("viaPlace3").asText(null);
				String viaPlace4 = keiroNode.path("viaPlace4").asText(null);
				String viaPlace5 = keiroNode.path("viaPlace5").asText(null);

				if (startPlace != null && !startPlace.isEmpty()) {
					keiroDto.setStartPlace(startPlace);
				}
				if (endPlace != null && !endPlace.isEmpty()) {
					keiroDto.setEndPlace(endPlace);
				}
				if (viaPlace1 != null && !viaPlace1.isEmpty()) {
					keiroDto.setViaPlace1(viaPlace1);
				}
				if (viaPlace2 != null && !viaPlace2.isEmpty()) {
					keiroDto.setViaPlace2(viaPlace2);
				}
				if (viaPlace3 != null && !viaPlace3.isEmpty()) {
					keiroDto.setViaPlace3(viaPlace3);
				}
				if (viaPlace4 != null && !viaPlace4.isEmpty()) {
					keiroDto.setViaPlace4(viaPlace4);
				}
				if (viaPlace5 != null && !viaPlace5.isEmpty()) {
					keiroDto.setViaPlace5(viaPlace5);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("keiro", keiroDto);

		model.addAttribute("ichijiHozon", ichijiHozonJson);

		model.addAttribute("shinseiNo", shinseiNo);
		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("keiroSeq", keiroSeq);

		return "keiroinput/07_keirodtInput";
	}

	// 재환
	@GetMapping("/07_keirodtInput_02")
	public String bus(@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "keiroSeq", required = false) String keiroSeq,
			@RequestParam(name = "shudanType", required = false) String shudanType, Locale locale, Model model,
			HttpSession session) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				System.out.println(root);
				model.addAttribute("ichijiHozon", root);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (shinseiNo != null && shinseiNo != "" && keiroSeq != null && shinseiNo != "") {
			ShinseiStartKeiroVO shinseiStartKeiro = keiroInputservice.getStartKeiroOne(
					Integer.valueOf(shain.getKigyo_Cd()), Integer.valueOf(shain.getShain_Uid()),
					Integer.valueOf(shinseiNo), Integer.valueOf(keiroSeq));

			if (shinseiStartKeiro != null) {
				String busCompany = shinseiStartKeiro.getBusCorpNm();
				String startPlace = shinseiStartKeiro.getStartPlace();
				String endPlace = shinseiStartKeiro.getEndPlace();
				String tsukinShudanKbn = shinseiStartKeiro.getTsukinShudanKbn();
				Integer KatamichiKin = shinseiStartKeiro.getKatamichiKin();
				Integer SanshoTeikiKin1 = shinseiStartKeiro.getSanshoTeikiKin1();
				Integer SanshoTeikiKin2 = shinseiStartKeiro.getSanshoTeikiKin2();
				Integer SanshoTeikiKin3 = shinseiStartKeiro.getSanshoTeikiKin3();
				
				shudanType = tsukinShudanKbn;
				
				model.addAttribute("busCompany", busCompany);
				model.addAttribute("startPlace", startPlace);
				model.addAttribute("endPlace", endPlace);
				model.addAttribute("KatamichiKin", KatamichiKin);
				model.addAttribute("SanshoTeikiKin1", SanshoTeikiKin1);
				model.addAttribute("SanshoTeikiKin2", SanshoTeikiKin2);
				model.addAttribute("SanshoTeikiKin3", SanshoTeikiKin3);
			}

		}
		
		CodeVO shudanCode = keiroInputservice.getCodeName("103", shudanType);
		
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("shudanType", shudanType);
		model.addAttribute("shudanNm", shudanCode.getCodeNm());
		model.addAttribute("shinseiNo", shinseiNo);
		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("keiroSeq", keiroSeq);

		return "keiroinput/07_keirodtInput_02";
	}

	// 재환
	@GetMapping("/07_keirodtInput_04")
	public String toho(@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "keiroSeq", required = false) String keiroSeq,
			@RequestParam(name = "shudanType", required = false) String shudanType,
			@RequestParam(name = "startAddr", required = false) String startAddr,
			@RequestParam(name = "endAddr", required = false) String endAddr,
			@RequestParam(name = "startPos", required = false) String startPos,
			@RequestParam(name = "endPos", required = false) String endPos,
			Locale locale, Model model,
			HttpSession session) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				System.out.println(root);
				model.addAttribute("ichijiHozon", root);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		CodeVO shudanCode = keiroInputservice.getCodeName("103", shudanType);
		
		
		model.addAttribute("startAddr", startAddr);
		model.addAttribute("endAddr", endAddr);
		model.addAttribute("startPos", startPos);
		model.addAttribute("endPos", endPos);
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("shudanType", shudanType);
		model.addAttribute("shudanNm", shudanCode.getCodeNm());
		model.addAttribute("shinseiNo", shinseiNo);
		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("keiroSeq", keiroSeq);

		return "keiroinput/07_keirodtInput_04";
	}

	// 재환
	@GetMapping("/06_keiroInput")
	public String select(@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "keiroSeq", required = false) String keiroSeq, 
			@RequestParam(name = "startAddr", required = false) String startAddr,
			@RequestParam(name = "endAddr", required = false) String endAddr,
			@RequestParam(name = "startPos", required = false) String startPos,
			@RequestParam(name = "endPos", required = false) String endPos,
			HttpSession session, Model model) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		System.out.println("hozonUid" + hozonUid);
		try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				System.out.println(root);
				model.addAttribute("ichijiHozon", root);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("startAddr", startAddr);
		model.addAttribute("endAddr", endAddr);
		model.addAttribute("startPos", startPos);
		model.addAttribute("endPos", endPos);

		if (shinseiNo != null && shinseiNo != "" && keiroSeq != null && shinseiNo != "") {
			ShainKeiroDTO dto = keiroInputservice.getShainKeiro(Integer.valueOf(shain.getShain_Uid()),
					Long.valueOf(shain.getShain_Uid()), Integer.valueOf(keiroSeq));
			model.addAttribute("keiro", dto);
			model.addAttribute("shinseiNo", shinseiNo);
			model.addAttribute("keiroSeq", keiroSeq);
		}
		
		
		List<CodeVO> shudanCodeList = keiroInputservice.getCodeList("103");
		

	    ObjectMapper mapper = new ObjectMapper();
	    String shudanJson = "";

	    try {
	        shudanJson = mapper.writeValueAsString(shudanCodeList);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		model.addAttribute("shudanJson", shudanJson);
		model.addAttribute("hozonUid", hozonUid);

		return "keiroinput/06_keiroInput";
	}

	// 지훈
	@GetMapping("/07_keirodtInput_03")
	public String jidousha(@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "keiroSeq", required = false) String keiroSeq, Locale locale, HttpSession session,
			Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
			return "redirect:/login";
		}

		// 회사/사원 식별자
		Integer kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
		Long shainUid = Long.parseLong(shain.getShain_Uid());

		if (shinseiNo != null && shinseiNo != "" && keiroSeq != null && shinseiNo != "") {

			// 기본 주소/근무지
			ShinseiDTO addr = keiroInputservice.getShinseiAddress(kigyoCd, shainUid, Integer.valueOf(shinseiNo),
					Integer.valueOf(keiroSeq));
			ShinseiDTO kinmuAddr = keiroInputservice.getShinseiKinmuAddress(kigyoCd, shainUid,
					Integer.valueOf(shinseiNo), Integer.valueOf(keiroSeq));
			System.out.println(">>> addr = " + addr);
			System.out.println(">>> kinmuAddr = " + kinmuAddr);
			model.addAttribute("addr", addr);
			model.addAttribute("kinmuAddr", kinmuAddr);
		}

		// 기본 startKeiro
		ShinseiStartKeiroVO startKeiro = keiroInputservice.getViaPlace1(kigyoCd, shainUid);

		// ICHIJI_HOZON 임시저장 값으로 덮어쓰기

		// ICHIJI_HOZON 임시저장 값으로 덮어쓰기
		try {
			// 🔹 hozonUid가 숫자일 때만 조회 시도
			if (hozonUid != null && !hozonUid.trim().isEmpty()) {
				IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid.trim()));

				if (hozon != null && hozon.getData() != null) {
					String json = new String(hozon.getData(), StandardCharsets.UTF_8);

					ObjectMapper mapper = new ObjectMapper();
					JsonNode root = mapper.readTree(json);

					JsonNode startKeiroNode = root.path("startKeiro");
					if (!startKeiroNode.isMissingNode() && !startKeiroNode.isNull()) {
						ShinseiStartKeiroVO restored = mapper.treeToValue(startKeiroNode, ShinseiStartKeiroVO.class);
						if (restored != null) {
							startKeiro = restored;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("startKeiro", startKeiro);

		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("keiroSeq", keiroSeq);
		model.addAttribute("shinseiNo", shinseiNo);

		return "keiroinput/07_keirodtInput_03";
	}

	// 재환
	@PostMapping("/tempSave")
	public String tempSaveCommute(@RequestParam(name = "hozonUid", required = false) String hozonUid,
			@RequestParam(name = "shinseiNo", required = false) String shinseiNo,
			@RequestParam("commuteJson") String commuteJson, @RequestParam("actionUrl") String actionUrl,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, 
			HttpSession session,
			HttpServletRequest request) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		System.out.println(">>> hozonUid = " + hozonUid);
		System.out.println(">>> shinseiNo = " + shinseiNo);

		Integer userUid = Integer.parseInt(shain.getShain_Uid());
		String shozokuCd = shain.getShozoku_Cd();
		String shinseiKbn = shain.getShinchoku_kbn();

		if (shinseiKbn == null || shinseiKbn.isEmpty()) {
			shinseiKbn = "01";
		}

		System.out.println(hozonUid);

		if (hozonUid == null) {
			return "";
		}

		byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

		IchijiHozonDTO dto = new IchijiHozonDTO();
		dto.setHozonUid(Integer.valueOf(hozonUid));
		dto.setUserUid(userUid);
		dto.setShinseiKbn(shinseiKbn);
		dto.setShozokuCd(shozokuCd);
		dto.setActionNm(actionUrl);
		dto.setData(dataBytes);

		dto.setAddUserId(userUid);
		dto.setUpdUserId(userUid);

		if (shinseiNo == null || shinseiNo == "") {
			shinseiNo = "0";
		}

		int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);
		oshiraseService.saveTempOshirase(shain, Long.valueOf(shinseiNo));
		String clientIp = getClientIp(request);

		keiroInputservice.writeProcessLog("COS", "TEMP", shinseiNo, "", "", "", "", "", userUid, clientIp);

		if (redirectUrl == "") {
			return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
		}

		return "redirect:" + redirectUrl;
	}

	private boolean isBlank(String str) {
		return (str == null || str.trim().isEmpty());
	}

	public String getClientIp(HttpServletRequest request) {

		String ip = request.getHeader("X-Forwarded-For");

		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		if (ip != null && ip.contains(",")) {
			ip = ip.split(",")[0].trim();
		}

		if ("0:0:0:0:0:0:0:1".equals(ip)) {
			ip = "127.0.0.1";
		}

		return ip;
	}

	// 재환
	@GetMapping(value = "/shain/location", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ShainLocationVO getShainLocation(HttpSession session) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		Long userUid = Long.valueOf(shain.getShain_Uid());
		Long kigyoCd = Long.valueOf(shain.getKigyo_Cd());

		return keiroInputservice.getShainLocation(kigyoCd, userUid);
	}

	// 하정
	@GetMapping("/start/detail")
	public ShinseiStartKeiroVO getStartKeiroDetail(@RequestParam("shinseiNo") Integer shinseiNo,
			@RequestParam("keiroSeq") Integer keiroSeq, HttpSession session) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");

		if (shain == null) {
			return null; // 또는 'throw new RuntimeException("로그인 필요")'
		}

		Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
		Integer shainUid = Integer.valueOf(shain.getShain_Uid());

		return keiroInputservice.getStartKeiroOne(kigyoCd, shainUid, shinseiNo, keiroSeq);
	}

}
