package org.cosmo.controller;

import java.util.List;
import java.util.ArrayList;

import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.service.HiwariKeiroService;
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

    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage() {
        return "hiwariKinmuchi/hiwariKinmuchi";
    }

    @GetMapping("/address")
    public String showHiwariAddressPage() {
        return "hiwariKinmuchi/hiwariAddress";
    }

    @GetMapping("/kakunin")
    public String showKakuninPage(Model model) {

        Integer dummyShainUid = 1;

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
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
    public String showKeiroPage(Model model) {

        Integer dummyShainUid = 1;

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
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
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        Integer dummyShainUid = 1;

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
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

            hiwariKeiroService.saveApply(dummyShainUid, keiroList);
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        if ("temp".equals(action)) {
            hiwariKeiroService.saveTemp(dummyShainUid, keiroList);
            return "redirect:/hiwariKinmuchi/keiro";
        }

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
        return "hiwariKinmuchi/hiwariKeiro";
    }

    private int calcRepRouteNo(List<HiwariKeiroVO> keiroList) {
        if (keiroList == null) {
            return 0;
        }
        return keiroList.size();
    }

    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }
}
