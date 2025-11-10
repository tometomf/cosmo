package org.cosmo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hiwariKanryou")  // URL: /hiwariKanryou
public class HiwariKanryouController {

    @GetMapping("")
    public String showKanryouPage() {
        // JSP 경로: /WEB-INF/views/hiwariKinmuchi/hiwariKanryou.jsp
        return "hiwariKinmuchi/hiwariKanryou";
    }
}
