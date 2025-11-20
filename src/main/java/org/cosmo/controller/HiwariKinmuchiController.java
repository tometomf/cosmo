package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.HiwariKakuninService;
import org.cosmo.service.HiwariKeiroService;
import org.cosmo.service.HiwariKinmuchiService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.OshiraseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/hiwariKinmuchi")
public class HiwariKinmuchiController {
	
	@Autowired
	private IchijiHozonService ichijiHozonService;
	
	@Autowired
	private OshiraseService oshiraseService;

    @Autowired
    private HiwariKeiroService hiwariKeiroService;

    @Autowired
    private HiwariKinmuchiService service;
    
    @Autowired
    private HiwariKakuninService hiwariKakuninService;

    
    private ShainVO ensureDummyShain(HttpSession session) {
        ShainVO shain = (ShainVO) session.getAttribute("shain");

        if (shain == null) {
            shain = new ShainVO();
            shain.setShain_Uid("1");        // 더미 사원 UID
            shain.setShozoku_Cd("100");     // 더미 소속 코드
            shain.setShinchoku_kbn("01");   // 기본 진척구분
            session.setAttribute("shain", shain);

            System.out.println("🔥 [DEBUG] 더미 shain 세션 자동 생성됨");
        }

        return shain;
    }
    
    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage(HttpSession session, Model model) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";   // 홈에서 shain 생성 후 다시 오게
        }

        Integer kigyoCd = 1001;
        Long shainUid = 1L;
        Long shinseiNo = null;

        HiwariKinmuchiVO data;

        if (shinseiNo == null) {
            data = service.getBeforeShinsei(kigyoCd, shainUid);
        } else {
            data = service.getAfterShinsei(kigyoCd, shainUid, shinseiNo);
        }

        List<String> shoList = service.getShozokuNames(kigyoCd);
        model.addAttribute("shoList", shoList);

        model.addAttribute("leftData", data);

        return "hiwariKinmuchi/hiwariKinmuchi";
    }
    
    

    
    

    @GetMapping("/address")
    public String showHiwariAddressPage() {
        return "hiwariKinmuchi/hiwariAddress";
    }

 // =========================
    // ② 確認画面
    // =========================
    @GetMapping("/kakunin")
    public String showKakuninPage(HttpSession session, Model model) {

        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Long shinseiNo  = (Long) session.getAttribute("SHINSEI_NO");

        // 세션에 값 없으면 경로 입력으로 돌려보냄
        if (kigyoCd == null || shinseiNo == null) {
            return "redirect:/hiwariKinmuchi/keiro";
        }

        // 1) 헤더 (社員・申請情報)
        HiwariKakuninVO header = hiwariKakuninService.getHeader(kigyoCd, shinseiNo);

        // 2) 경로 리스트
        List<HiwariKakuninRouteVO> routes = hiwariKakuninService.getRoutes(kigyoCd, shinseiNo);
        if (routes == null) {
            routes = new ArrayList<HiwariKakuninRouteVO>();
        }

        // ==== emp 세팅 (JSP: ${emp.no}, ${emp.name}, ${emp.workplace}, ${emp.address}) ====
        Map<String, Object> emp = new HashMap<String, Object>();
        if (header != null) {
            emp.put("no",        header.getEmpNo());
            emp.put("name",      header.getEmpName());
            emp.put("workplace", header.getEmpWorkplace());
            emp.put("address",   header.getEmpAddress());
        }
        model.addAttribute("emp", emp);

        // ==== route1 / route2 세팅 (JSP: ${route1.xxx}, ${route2.xxx}) ====
        HiwariKakuninRouteVO r1 = routes.size() > 0 ? routes.get(0) : null;
        HiwariKakuninRouteVO r2 = routes.size() > 1 ? routes.get(1) : null;

        Map<String, Object> route1 = new HashMap<String, Object>();
        if (r1 != null) {
            route1.put("transport",     r1.getTsukinShudanNm());
            route1.put("route",         r1.getKeiroSection());
            route1.put("workDays",      r1.getShukkinNissuu() + "日間");
            route1.put("oneWayFee",     r1.getKataMichiRyokin());
            route1.put("amount",        r1.getKingaku());
            route1.put("amountMonthly", r1.getKingakuMonthly());
        }
        model.addAttribute("route1", route1);

        Map<String, Object> route2 = new HashMap<String, Object>();
        if (r2 != null) {
            route2.put("transport",     r2.getTsukinShudanNm());
            route2.put("route",         r2.getKeiroSection());
            route2.put("workDays",      r2.getShukkinNissuu() + "日間");
            route2.put("oneWayFee",     r2.getKataMichiRyokin());
            route2.put("amount",        r2.getKingaku());
            route2.put("amountMonthly", r2.getKingakuMonthly());
        }
        model.addAttribute("route2", route2);

        // ==== apply 세팅 (JSP: ${apply.kind}, ${apply.reason}, ${apply.periodText} …) ====
        Map<String, Object> apply = new HashMap<String, Object>();
        if (header != null) {
            apply.put("kind",        header.getShinseiKbnNm());
            apply.put("reason",      header.getShinseiRiyu());
            apply.put("periodText",  header.getTaishoKikanFrom() + " ～ " + header.getTaishoKikanTo());
            apply.put("workDays",    header.getShukkinNissuu() + "日間");
            apply.put("totalAmount", header.getKingakuGokei());
        }
        model.addAttribute("apply", apply);

        // JSP 레이아웃은 네가 만든 정적 kakunin.jsp 그대로 사용
        return "hiwariKinmuchi/hiwariKakunin";
    }

    @GetMapping("/kanryo")
    public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
        model.addAttribute("shinseiNo", shinseiNo);
        return "hiwariKinmuchi/hiwariKanryo";
    }

    @GetMapping("/keiro")
    public String showKeiroPage(HttpSession session, Model model) {

        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

        return "hiwariKinmuchi/hiwariKeiro";
    }

    @PostMapping("/keiro")
    public String handleKeiro(
            @RequestParam("action") String action,
            HttpSession session,
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);
        System.out.println("keiroList size = " + keiroList.size());

        if ("apply".equals(action)) {

            if (keiroList.isEmpty()) {
                model.addAttribute("errorMsg", "経路が1件も登録されていません。");
                model.addAttribute("keiroList", keiroList);
                model.addAttribute("repRouteNo", repRouteNo);
                return "hiwariKinmuchi/hiwariKeiro";
            }
            
            hiwariKeiroService.saveApply(shainUid, keiroList);
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        if ("temp".equals(action)) {
            hiwariKeiroService.saveTemp(shainUid, keiroList);
            return "redirect:/hiwariKinmuchi/keiro";
        }
        
        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
        return "hiwariKinmuchi/hiwariKeiro";
    }
    
    

    @GetMapping("/keiro/delete")
    public String deleteKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq,
            HttpSession session) {

        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");

        hiwariKeiroService.deleteOne(shainUid, keiroSeq);
        return "redirect:/hiwariKinmuchi/keiro";
    }

    @GetMapping("/keiro/edit")
    public String editKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq) {

        return "redirect:/tsukinInput?mode=edit&keiroSeq=" + keiroSeq;
    }

    private int calcRepRouteNo(List<HiwariKeiroVO> keiroList) {
        if (keiroList == null || keiroList.isEmpty()) {
            return 1;
        }
        return keiroList.size();
        
    }
    @GetMapping("/keiroInput")
    public String showKeiroInputPage() {
        return "keiroinput/06_keiroInput";
    }

    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }
    
    @PostMapping("/tempSave")
    public String tempSaveKinmu(
            @RequestParam("commuteJson") String commuteJson,
            @RequestParam("actionUrl") String actionUrl,
            @RequestParam(value = "redirectUrl", required = false) String redirectUrl,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/"; 
        }

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
        dto.setActionNm(actionUrl);
        dto.setData(dataBytes);

        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);

        // ★ 알림
        oshiraseService.saveTempOshirase(shain);

        // 임시저장 버튼 → 기본 이동
        if (redirectUrl == null || redirectUrl.isEmpty()) {
            return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
        }

        return "redirect:" + redirectUrl;
    }
    
    
    
}
