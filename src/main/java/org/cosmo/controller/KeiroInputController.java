package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainKeiroDTO;
import org.cosmo.domain.ShainLocationVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.ShinseiDTO;
import org.cosmo.domain.ShinseiStartKeiroVO;
import org.cosmo.mapper.IchijiHozonMapper;
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
	
	@Autowired
    private IchijiHozonMapper ichijiHozonMapper;

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
	    Integer userUid = Integer.parseInt(shain.getShain_Uid());


	    ShainKeiroDTO keiroDto = keiroInputservice.getShainKeiro(kigyoCd, shainUid, keiroSeq);


	    try {
	        IchijiHozonDTO hozon = ichijiHozonService.getLatestTemp(userUid);
	        if (hozon != null && hozon.getData() != null) {

	            String json = new String(hozon.getData(), StandardCharsets.UTF_8);

	            ObjectMapper mapper = new ObjectMapper();
	            JsonNode root = mapper.readTree(json);
	            JsonNode keiroNode = root.path("keiro");

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

	    // 서버시간 표시 (기존 그대로)
	    Date date = new Date();
	    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	    String formattedDate = dateFormat.format(date);
	    model.addAttribute("serverTime", formattedDate);

	    // 로그인 체크 (기존 그대로)
	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null || shain.getKigyo_Cd() == null || shain.getShain_Uid() == null) {
	        return "redirect:/login";
	    }

	    // 회사/사원 식별자
	    Integer kigyoCd = Integer.parseInt(shain.getKigyo_Cd());
	    Long   shainUid = Long.parseLong(shain.getShain_Uid());
	    Integer userUid = Integer.parseInt(shain.getShain_Uid()); // ICHIJI_HOZON용

	    // 기본 주소/근무지 정보는 항상 DB에서 가져옴
	    ShinseiDTO addr      = keiroInputservice.getShinseiAddress(kigyoCd, shainUid);
	    ShinseiDTO kinmuAddr = keiroInputservice.getShinseiKinmuAddress(kigyoCd, shainUid);

	    // 기본 startKeiro: DB 기준 (경유지 등)
	    ShinseiStartKeiroVO startKeiro = keiroInputservice.getViaPlace1(kigyoCd, shainUid);

	    // ================================
	    //  ICHIJI_HOZON 임시저장 값으로 덮어쓰기
	    // ================================
	    try {
	    	Map<String, Object> param = new HashMap<String, Object>();
	        param.put("userUid", userUid);

	        IchijiHozonDTO hozon = ichijiHozonMapper.selectLatestByUserAndAction(param);
	        if (hozon != null && hozon.getData() != null) {
	            // BLOB → JSON 문자열
	            String json = new String(hozon.getData(), StandardCharsets.UTF_8);

	            ObjectMapper mapper = new ObjectMapper();
	            JsonNode root = mapper.readTree(json);

	            // JSON의 startKeiro 부분만 ShinseiStartKeiroVO로 매핑
	            JsonNode startKeiroNode = root.path("startKeiro");
	            if (!startKeiroNode.isMissingNode() && !startKeiroNode.isNull()) {
	                ShinseiStartKeiroVO restored =
	                        mapper.treeToValue(startKeiroNode, ShinseiStartKeiroVO.class);

	                if (restored != null) {
	                    startKeiro = restored;
	                }
	            }
	        }
	    } catch (Exception e) {
	        // 파싱 실패 등 예외 발생 시에는 DB에서 가져온 startKeiro 그대로 사용
	        e.printStackTrace();
	    }

	    // 모델에 세팅 (★ 이름 startKeiro 대소문자 주의)
	    model.addAttribute("addr", addr);
	    model.addAttribute("kinmuAddr", kinmuAddr);
	    model.addAttribute("startKeiro", startKeiro);

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
	 
	    @GetMapping("/keiro/start/detail")
	    public ShinseiStartKeiroVO getStartKeiroDetail(
	            @RequestParam("shinseiNo") Integer shinseiNo,
	            @RequestParam("keiroSeq") Integer keiroSeq,
	            HttpSession session) {

	        ShainVO shain = (ShainVO) session.getAttribute("shain");

	        if (shain == null) {
	            return null; // 또는 'throw new RuntimeException("로그인 필요")'
	        }

	        Integer kigyoCd  = Integer.valueOf(shain.getKigyo_Cd());
	        Integer shainUid = Integer.valueOf(shain.getShain_Uid());

	        return keiroInputservice.getStartKeiroOne(kigyoCd, shainUid, shinseiNo, keiroSeq);
	    }

}
