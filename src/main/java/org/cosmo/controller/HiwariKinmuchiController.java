package org.cosmo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.service.HiwariKeiroService;
import org.cosmo.service.HiwariKinmuchiService;
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
    private HiwariKeiroService hiwariKeiroService;

    @Autowired
    private HiwariKinmuchiService service;

    
    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage(HttpSession session, Model model) {

        // 강제 더미
        Integer kigyoCd = 1001;
        Long shainUid = 1L;
        Long shinseiNo = null;

        HiwariKinmuchiVO data;

        if (shinseiNo == null) {
            data = service.getBeforeShinsei(kigyoCd, shainUid);
        } else {
            data = service.getAfterShinsei(kigyoCd, shainUid, shinseiNo);
        }

        // 🔥 근무지 리스트 추가 (이거 없어서 안 뜬 거임)
        List<String> shoList = service.getShozokuNames(kigyoCd);
        model.addAttribute("shoList", shoList);

        // 기존 데이터
        model.addAttribute("leftData", data);

        return "hiwariKinmuchi/hiwariKinmuchi";
    }
    
    
    @GetMapping("testData")
    public String testData(HttpServletResponse response) throws Exception {
        Integer kigyoCd = 1001;
        Long shainUid = 1L;

        HiwariKinmuchiVO data = service.getBeforeShinsei(kigyoCd, shainUid);

        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().println("===== DB TEST =====");
        response.getWriter().println("kigyoCd = " + data.getKigyoCd());
        response.getWriter().println("shainUid = " + data.getShainUid());
        response.getWriter().println("shozoNm = " + data.getBeforeShozokuNm());
        response.getWriter().println("zip = " + data.getKinmuZipCd());
        return null;
    }
    
    

    @GetMapping("/address")
    public String showHiwariAddressPage() {
        return "hiwariKinmuchi/hiwariAddress";
    }

    @GetMapping("/kakunin")
    public String showKakuninPage(HttpSession session, Model model) {

        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

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
    
    @GetMapping("/back")
    public String backFromKeiro() {
        return "redirect:/hiwariKinmuchi/riyu";
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
}
