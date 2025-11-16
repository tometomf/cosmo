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

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
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
            @RequestParam(name = "deleteIndex",      required = false) Integer deleteIndex,
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        if (tsukinShudanKbn == null) tsukinShudanKbn = new String[0];
        if (startPlace      == null) startPlace      = new String[0];
        if (endPlace        == null) endPlace        = new String[0];
        if (kigyoCd         == null) kigyoCd         = new Integer[0];
        if (shinseiNo       == null) shinseiNo       = new Long[0];
        if (keiroSeq        == null) keiroSeq        = new Integer[0];

        int rowCount = tsukinShudanKbn.length;
        if (rowCount == 0) {
            rowCount = Math.max(startPlace.length, endPlace.length);
        }

        List<HiwariKeiroVO> keiroList = new ArrayList<HiwariKeiroVO>();

        for (int i = 0; i < rowCount; i++) {
            HiwariKeiroVO vo = new HiwariKeiroVO();

            vo.setTsukinShudanKbn(i < tsukinShudanKbn.length ? tsukinShudanKbn[i] : null);
            vo.setStartPlace     (i < startPlace.length      ? startPlace[i]      : null);
            vo.setEndPlace       (i < endPlace.length        ? endPlace[i]        : null);

            if (i < kigyoCd.length)   vo.setKigyoCd(kigyoCd[i]);
            if (i < shinseiNo.length) vo.setShinseiNo(shinseiNo[i]);
            if (i < keiroSeq.length)  vo.setKeiroSeq(keiroSeq[i]);

            if (kekkaSelectIndex != null && kekkaSelectIndex.intValue() == i) {
                vo.setKekkaSelect("1");
            } else {
                vo.setKekkaSelect("0");
            }

            keiroList.add(vo);
        }

        System.out.println("rowCount = " + rowCount);
        System.out.println("keiroList size = " + keiroList.size());

        int repRouteNo = calcRepRouteNo(keiroList);

        if ("addRow".equals(action)) {
            keiroList.add(new HiwariKeiroVO());
            System.out.println("after addRow, keiroList size = " + keiroList.size());

            repRouteNo = calcRepRouteNo(keiroList);

            model.addAttribute("keiroList", keiroList);
            model.addAttribute("repRouteNo", repRouteNo);
            return "hiwariKinmuchi/hiwariKeiro";
        }

        if ("deleteRow".equals(action)) {
            System.out.println("deleteIndex = " + deleteIndex);

            if (deleteIndex != null &&
                deleteIndex.intValue() >= 0 &&
                deleteIndex.intValue() < keiroList.size()) {

                keiroList.remove(deleteIndex.intValue());
            }

            if (keiroList.isEmpty()) {
                keiroList.add(new HiwariKeiroVO());
            }

            repRouteNo = calcRepRouteNo(keiroList);

            model.addAttribute("keiroList", keiroList);
            model.addAttribute("repRouteNo", repRouteNo);
            return "hiwariKinmuchi/hiwariKeiro";
        }

        Integer dummyShainUid = 1;

        if ("apply".equals(action)) {
            hiwariKeiroService.saveApply(dummyShainUid, keiroList);

            Long redirectShinseiNo = null;
            if (!keiroList.isEmpty() && keiroList.get(0).getShinseiNo() != null) {
                redirectShinseiNo = keiroList.get(0).getShinseiNo();
            } else {
                redirectShinseiNo = 1L;
            }

            return "redirect:/hiwariKinmuchi/kanryo?shinseiNo=" + redirectShinseiNo;
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
        int repRouteNo = 1;
        for (int i = 0; i < keiroList.size(); i++) {
            HiwariKeiroVO vo = keiroList.get(i);
            if ("1".equals(vo.getKekkaSelect())) {
                return i + 1;   // 0 → 1, 1 → 2 ...
            }
        }
        return repRouteNo;
    }
    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }

}
