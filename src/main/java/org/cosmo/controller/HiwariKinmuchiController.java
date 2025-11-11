package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String showKanryoPage() {
        return "hiwariKinmuchi/hiwariKanryo";
    }

    @GetMapping("/keiro")
    public String showKeiroPage() {
        return "hiwariKinmuchi/hiwariKeiro";
    }

    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }
}