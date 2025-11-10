package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariKeiro")  // URL: /hiwariKanryou
public class HiwariKeiroController {

    @GetMapping("")
    public String showKeiroPage() {
        // JSP 경로: /WEB-INF/views/hiwariKinmuchi/hiwariKeiro.jsp
        return "hiwariKinmuchi/hiwariKeiro";
    }
}
