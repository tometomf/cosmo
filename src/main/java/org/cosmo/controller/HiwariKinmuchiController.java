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

    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage() {
        return "hiwariKinmuchi/hiwariKinmuchi";
    }

    @GetMapping("/address")
    public String showHiwariAddressPage() {
        return "hiwariKinmuchi/hiwariAddress";
    }

    @GetMapping("/kakunin")
    public String showKakuninPage() {
        return "hiwariKinmuchi/hiwariKakunin";
    }


    @GetMapping("/kanryo")
    public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {

        model.addAttribute("shinseiNo", shinseiNo);

        return "hiwariKinmuchi/hiwariKanryo";
    }

    @Autowired
    private HiwariKeiroService hiwariKeiroService;


    @GetMapping("/keiro")
    public String showKeiroPage(Model model) {

        Integer dummyShainUid = 1;

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);

  
        if (keiroList == null || keiroList.isEmpty()) {
            keiroList = new ArrayList<HiwariKeiroVO>();
            keiroList.add(new HiwariKeiroVO());  
        }

        model.addAttribute("keiroList", keiroList);
        return "hiwariKinmuchi/hiwariKeiro";
    }

  
    @PostMapping("/keiro")
    public String handleKeiro(
            @RequestParam("action") String action,
            @RequestParam(name = "tsukinShudanKbn",  required = false) String[] tsukinShudanKbn,
            @RequestParam(name = "startPlace",       required = false) String[] startPlace,
            @RequestParam(name = "endPlace",         required = false) String[] endPlace,
            @RequestParam(name = "kigyoCd",          required = false) Integer[] kigyoCd,
            @RequestParam(name = "shinseiNo",        required = false) Long[] shinseiNo,
            @RequestParam(name = "keiroSeq",         required = false) Integer[] keiroSeq,
            @RequestParam(name = "kekkaSelectIndex", required = false) Integer kekkaSelectIndex,
            Model model) {

        List<HiwariKeiroVO> keiroList = new ArrayList<HiwariKeiroVO>();

        int rowCount = (tsukinShudanKbn != null ? tsukinShudanKbn.length : 0);

        for (int i = 0; i < rowCount; i++) {
            HiwariKeiroVO vo = new HiwariKeiroVO();

            vo.setTsukinShudanKbn(tsukinShudanKbn[i]);

            vo.setStartPlace(startPlace != null && startPlace.length > i ? startPlace[i] : null);
            vo.setEndPlace(endPlace != null && endPlace.length > i ? endPlace[i] : null);

            if (kigyoCd   != null && kigyoCd.length   > i) vo.setKigyoCd(kigyoCd[i]);
            if (shinseiNo != null && shinseiNo.length > i) vo.setShinseiNo(shinseiNo[i]);
            if (keiroSeq  != null && keiroSeq.length  > i) vo.setKeiroSeq(keiroSeq[i]);

            if (kekkaSelectIndex != null && kekkaSelectIndex.intValue() == i) {
                vo.setKekkaSelect("1");
            } else {
                vo.setKekkaSelect("0");
            }

            keiroList.add(vo);
        }

        System.out.println("=== DEBUG /keiro POST ===");
        System.out.println("action = " + action);
        System.out.println("before addRow, keiroList size = " + keiroList.size());

        if ("addRow".equals(action)) {
            keiroList.add(new HiwariKeiroVO()); 
            System.out.println("after addRow, keiroList size = " + keiroList.size());

            model.addAttribute("keiroList", keiroList);
            return "hiwariKinmuchi/hiwariKeiro";
        }

        Integer dummyShainUid = 1; 

      
        if ("apply".equals(action)) {
            return "redirect:/hiwariKinmuchi/kakunin";
        }

     
        if ("temp".equals(action)) {
            return "redirect:/hiwariKinmuchi/keiro";
        }

        model.addAttribute("keiroList", keiroList);
        return "hiwariKinmuchi/hiwariKeiro";
    }

    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }
}
