package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.IchijiHozonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IchijiHozonController {

    @Autowired
    private IchijiHozonService ichijiHozonService;

    @PostMapping("/keiro/tempSave")
    public String tempSaveCommute(
            @RequestParam("commuteJson") String commuteJson,
            HttpSession session) {

        // 세션에서 사원 정보 획득
        ShainVO shain = (ShainVO) session.getAttribute("shain");

        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
        String  shozokuCd = shain.getShozoku_Cd();
        String  shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null) {
            shinseiKbn = "01"; // 기본 신청구분
        }

        byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

        IchijiHozonDTO dto = new IchijiHozonDTO();
        dto.setUserUid(userUid);
        dto.setShinseiKbn(shinseiKbn);
        dto.setShozokuCd(shozokuCd);
        dto.setActionNm("TSUKIN_SHUDAN_TEMP_SAVE");
        dto.setData(dataBytes);

        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveTemp(dto);
        
        System.out.println(newUid);
        return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
    }
}
