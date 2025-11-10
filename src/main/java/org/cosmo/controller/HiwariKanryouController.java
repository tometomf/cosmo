package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariKanryou") // URL: /hiwariKakunin
public class HiwariKanryouController {

    @GetMapping({""})
    public String showKinmuchiPage() {
        // /WEB-INF/views/hiwariKakunin.jsp 로 이동
        return "hiwariKinmuchi/hiwariKanryou";
    }
}
