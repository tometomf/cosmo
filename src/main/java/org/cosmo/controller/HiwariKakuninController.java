package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariKakunin") // URL: /hiwariKakunin
public class HiwariKakuninController {

    @GetMapping("")
    public String showKakuninPage() {
        // /WEB-INF/views/hiwariKakunin.jsp 로 이동
        return "hiwariKinmuchi/hiwariKakunin";
    }
}
