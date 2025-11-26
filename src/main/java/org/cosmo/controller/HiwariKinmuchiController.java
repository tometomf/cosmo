package org.cosmo.controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.HiwariKinmuchiService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.OshiraseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/hiwariKinmuchi")
public class HiwariKinmuchiController {
	
	@Autowired
	private IchijiHozonService ichijiHozonService;
	
	@Autowired
	private OshiraseService oshiraseService;

    @Autowired
    private HiwariKinmuchiService service;
    
    
    //서혜원
    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage(HttpSession session, Model model) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shainUid   = Long.valueOf(shain.getShain_Uid());

        Long shinseiNo = null;
        if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
            try {
                shinseiNo = Long.valueOf(shain.getShinsei_No());
            } catch (Exception e) {
                shinseiNo = null;
            }
        }

        HiwariKinmuchiVO data =
                (shinseiNo == null)
                ? service.getBeforeShinsei(kigyoCd, shainUid)
                : service.getAfterShinsei(kigyoCd, shainUid, shinseiNo);

        if (isNullOrEmpty(data.getGenKinmuZip())) {
            data.setGenKinmuZip("1600023");
        }
        if (isNullOrEmpty(data.getGenKinmuAddress1())) {
            data.setGenKinmuAddress1("東京都");
        }
        if (isNullOrEmpty(data.getGenKinmuAddress2())) {
            data.setGenKinmuAddress2("千代田区丸の内1-1-1");
        }
        if (isNullOrEmpty(data.getGenKinmuAddress3())) {
            data.setGenKinmuAddress3("A建物");
        }

        model.addAttribute("initData", data);
        model.addAttribute("shoList", service.getShozokuNames(kigyoCd));

        return "hiwariKinmuchi/hiwariKinmuchi";
    }



    private boolean isNullOrEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }


  //서혜원
    @GetMapping("/address")
    public String showHiwariAddressPage(HttpSession session, Model model) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shainUid   = Long.valueOf(shain.getShain_Uid());

        Long shinseiNo = null;
        if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
            try {
                shinseiNo = Long.valueOf(shain.getShinsei_No());
            } catch (Exception e) {
                shinseiNo = null;
            }
        }

        HiwariAddressVO data =
                (shinseiNo == null)
                ? service.getAddressPageDataBefore(kigyoCd, shainUid)
                : service.getAddressPageData(kigyoCd, shainUid, shinseiNo);

        String genZip      = data.getGenZip();
        String genAddress1 = data.getGenAddress1();
        String genAddress2 = data.getGenAddress2();
        String genAddress3 = data.getGenAddress3();

        if (isNullOrEmpty(genZip))      genZip      = "1600023";
        if (isNullOrEmpty(genAddress1)) genAddress1 = "東京都";
        if (isNullOrEmpty(genAddress2)) genAddress2 = "千代田区丸の内1-1-1";
        if (isNullOrEmpty(genAddress3)) genAddress3 = "A建物";

        data.setGenZip(genZip);
        data.setGenAddress1(genAddress1);
        data.setGenAddress2(genAddress2);
        data.setGenAddress3(genAddress3);

        String fullAddress = genAddress1 + genAddress2;

        if (isNullOrEmpty(fullAddress)) {
            fullAddress = "大阪府大阪市東淀川区瑞光1-1-1 ハイツ瑞光302";
        }

        data.setFullAddress(fullAddress);


        model.addAttribute("initData", data);
        model.addAttribute("addressData", data);

        return "hiwariKinmuchi/hiwariAddress";
    }
  
    
    //서혜원
    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }

 // 유지희
    @GetMapping("/kakunin")
    public String showKakuninPage(HttpSession session, Model model) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";   
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shinseiNo  = null;
        if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
            shinseiNo = Long.valueOf(shain.getShinsei_No());
        }

        if (shinseiNo == null) {
            return "redirect:/";
        }

        HiwariKakuninVO header = service.getHeader(kigyoCd, shinseiNo);
        List<HiwariKakuninRouteVO> routes = service.getRoutes(kigyoCd, shinseiNo);
        if (routes == null) {
            routes = new ArrayList<HiwariKakuninRouteVO>();
        }

        Map<String, Object> emp = new HashMap<String, Object>();
        if (header != null) {
            emp.put("no",        header.getEmpNo());
            emp.put("name",      header.getEmpName());
            emp.put("workplace", header.getEmpWorkplace());
            emp.put("address",   header.getEmpAddress());
        }
        model.addAttribute("emp", emp);

        HiwariKakuninRouteVO r1 = routes.size() > 0 ? routes.get(0) : null;
        Map<String, Object> route1 = new HashMap<String, Object>();
        if (r1 != null) {
            route1.put("transport",     r1.getTsukinShudanNm());
            route1.put("route",         r1.getKeiroSection());
            route1.put("workDays",      r1.getShukkinNissuu() + "日間");
            route1.put("oneWayFee",     formatAmount(r1.getKataMichiRyokin()));
            route1.put("amount",        formatAmount(r1.getKingaku()));
            route1.put("amountMonthly", formatAmount(r1.getKingakuMonthly()));
        }
        model.addAttribute("route1", route1);

        HiwariKakuninRouteVO r2 = routes.size() > 1 ? routes.get(1) : null;
        Map<String, Object> route2 = new HashMap<String, Object>();
        if (r2 != null) {
            route2.put("transport",     r2.getTsukinShudanNm());
            route2.put("route",         r2.getKeiroSection());
            route2.put("workDays",      r2.getShukkinNissuu() + "日間");
            route2.put("oneWayFee",     formatAmount(r2.getKataMichiRyokin()));
            route2.put("amount",        formatAmount(r2.getKingaku()));
            route2.put("amountMonthly", formatAmount(r2.getKingakuMonthly()));
        }
        model.addAttribute("route2", route2);

        Map<String, Object> apply = new HashMap<String, Object>();
        if (header != null) {
            apply.put("kind",        header.getShinseiKbnNm());
            apply.put("reason",      header.getShinseiRiyu());
            apply.put("periodText",  header.getTaishoKikanFrom() + " ～ " + header.getTaishoKikanTo());
            apply.put("workDays",    header.getShukkinNissuu() + "日間");
            apply.put("totalAmount", formatAmount(header.getKingakuGokei()));
        }
        
        model.addAttribute("apply", apply);

        return "hiwariKinmuchi/hiwariKakunin";
    }

    private String formatAmount(Integer amount) {
        if (amount == null || amount == 0) {
            return "―";
        }
        return String.format("%,d円", amount);
    }

    //유지희
    @GetMapping("/kanryo")
    public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
        model.addAttribute("shinseiNo", shinseiNo);
        return "hiwariKinmuchi/hiwariKanryo";
    }

    //유지희
    @GetMapping("/keiro")
    public String showKeiroPage(HttpSession session, Model model) {

        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

        return "hiwariKinmuchi/hiwariKeiro";
    }
    //유지희
    @PostMapping("/keiro")
    public String handleKeiro(
            @RequestParam("action") String action,
            HttpSession session,
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
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
            
          
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        if ("temp".equals(action)) {
            
            service.saveTemp(kigyoCd, shainUid, keiroList);
            return "redirect:/shinsei/11_shinseiDetail_02";
        }
        
        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
        return "hiwariKinmuchi/hiwariKeiro";
    }
    //유지희
    @GetMapping("/keiro/delete")
    public String deleteKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq,
            HttpSession session) {


        Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
        Integer shainUid = (Integer) session.getAttribute("SHAIN_UID");
        
        if (kigyoCd == null) kigyoCd = 100;
        if (shainUid == null) shainUid = 30000001;

        service.deleteOne(kigyoCd, shainUid, keiroSeq);
        return "redirect:/hiwariKinmuchi/keiro";
    }
    //유지희
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
    //유지희
    @GetMapping("/keiroInput")
    public String showKeiroInputPage() {
        return "keiroinput/06_keiroInput";
    }
    //유지희
    @GetMapping("/map")
    public String showMapPage(HttpSession session, Model model) {
        
        String kigyoCd = "100";
        String shainUid = "30000001";
        
        // ★★★ 주소 service 호출 제거함 ★★★
        // AddressViewDto address = addressService.loadCurrentAddress(kigyoCd, shainUid);

        HiwariKinmuchiVO kinmuchi = service.getBeforeShinsei(100, 30000001L);
        
        // ★★★ address → 관련 코드 전체 제거 ★★★
        
        String kinmuchiName = "";
        String kinmuchiAddress = "";
        if (kinmuchi != null) {
            kinmuchiName = kinmuchi.getGenKinmusakiNm() != null ? kinmuchi.getGenKinmusakiNm() : "";
            
            if (kinmuchi.getGenKinmuAddress1() != null) kinmuchiAddress += kinmuchi.getGenKinmuAddress1();
            if (kinmuchi.getGenKinmuAddress2() != null) kinmuchiAddress += " " + kinmuchi.getGenKinmuAddress2();
            if (kinmuchi.getGenKinmuAddress3() != null) kinmuchiAddress += " " + kinmuchi.getGenKinmuAddress3();
        }
        
        model.addAttribute("kinmuchi", kinmuchiName);
        model.addAttribute("kinmuchiAddress", kinmuchiAddress.trim());
        
        return "hiwariKinmuchi/hiwariMap";
    }

 @PostMapping("/submit")
 public String submitFromKakunin(HttpSession session, RedirectAttributes rttr) {

     Integer kigyoCd = (Integer) session.getAttribute("KIGYO_CD");
     Long shinseiNo  = (Long) session.getAttribute("SHINSEI_NO");

     // 세션 값 비어 있으면 기본값 세팅
     if (kigyoCd == null) kigyoCd = 100;
     if (shinseiNo == null) shinseiNo = 1L;

     try {
         // ★ DB 업데이트 (header + route + 금액 등)
         service.submitApplication(kigyoCd, shinseiNo);

         // 완료화면 파라미터 전달
         rttr.addAttribute("shinseiNo", shinseiNo);

         // 완료 화면으로 이동
         return "redirect:/hiwariKinmuchi/kanryo";

     } catch (Exception e) {
         rttr.addFlashAttribute("error", "申請に失敗しました: " + e.getMessage());
         return "redirect:/hiwariKinmuchi/kakunin";
     }
 }

    //유지희 끝

    //서혜원
    @PostMapping("/tempSave")
    public String tempSaveKinmu(
            @RequestParam("commuteJson") String commuteJson,
            @RequestParam("actionUrl") String actionUrl,
            @RequestParam(value = "redirectUrl", required = false) String redirectUrl,
            HttpSession session) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/"; 
        }

        Integer userUid   = Integer.parseInt(shain.getShain_Uid());
        String  shozokuCd = shain.getShozoku_Cd();
        String  shinseiKbn = shain.getShinchoku_kbn();

        if (shinseiKbn == null || shinseiKbn.isEmpty()) {
            shinseiKbn = "01";
        }

        byte[] dataBytes = commuteJson.getBytes(StandardCharsets.UTF_8);

        IchijiHozonDTO dto = new IchijiHozonDTO();
        dto.setUserUid(userUid);
        dto.setShinseiKbn(shinseiKbn);
        dto.setShozokuCd(shozokuCd);
        dto.setActionNm(actionUrl);
        dto.setData(dataBytes);
        dto.setAddUserId(userUid);
        dto.setUpdUserId(userUid);

        int newUid = ichijiHozonService.saveOrUpdateCommuteTemp(dto);

        oshiraseService.saveTempOshirase(shain);

        if (redirectUrl == null || redirectUrl.isEmpty()) {
            return "redirect:/shinsei/ichiji?hozonUid=" + newUid;
        }

        return "redirect:" + redirectUrl;
    }
}