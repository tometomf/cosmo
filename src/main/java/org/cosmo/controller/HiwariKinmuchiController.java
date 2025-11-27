package org.cosmo.controller;

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
import org.cosmo.domain.HiwariRiyuVO;
import org.cosmo.domain.ShainVO;
import org.cosmo.service.HiwariKinmuchiService;
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
	private OshiraseService oshiraseService;

	@Autowired
	private HiwariKinmuchiService service;
	
	

	// 서혜원
	@GetMapping("hiwariKinmuchi")
	public String showKinmuchiPage(
	@RequestParam(name = "hozonUid", required = false) String hozonUid,
			HttpSession session, Model model) {
		
		

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null) {
			return "redirect:/";
		}

		Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
		Long shainUid = Long.valueOf(shain.getShain_Uid());

		Long shinseiNo = null;
		if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
			try {
				shinseiNo = Long.valueOf(shain.getShinsei_No());
			} catch (Exception e) {
				shinseiNo = null;
			}
		}

		HiwariKinmuchiVO data = (shinseiNo == null) ? service.getBeforeShinsei(kigyoCd, shainUid)
				: service.getAfterShinsei(kigyoCd, shainUid, shinseiNo);

		model.addAttribute("initData", data);
		model.addAttribute("shoList", service.getShozokuNames(kigyoCd));
		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("shinseiNo", shinseiNo);

		return "hiwariKinmuchi/hiwariKinmuchi";
	}

	
	// 서혜원
	@GetMapping("/address")
	public String showHiwariAddressPage(@RequestParam(name = "hozonUid", required = false) String hozonUid,HttpSession session, Model model) {

		ShainVO shain = (ShainVO) session.getAttribute("shain");
		if (shain == null) {
			return "redirect:/";
		}

		Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
		Long shainUid = Long.valueOf(shain.getShain_Uid());

		Long shinseiNo = null;
		if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
			try {
				shinseiNo = Long.valueOf(shain.getShinsei_No());
			} catch (Exception e) {
				shinseiNo = null;
			}
		}

		HiwariAddressVO data = (shinseiNo == null) ? service.getAddressPageDataBefore(kigyoCd, shainUid)
				: service.getAddressPageData(kigyoCd, shainUid, shinseiNo);

		model.addAttribute("initData", data);
		model.addAttribute("addressData", data);
		model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("shinseiNo", shinseiNo);

		return "hiwariKinmuchi/hiwariAddress";
	}

	
	// 서혜원
	@GetMapping("/riyu")
	public String showRiyuPage(@RequestParam(name = "hozonUid", required = false) String hozonUid,HttpSession session, Model model) {

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

	    if (shinseiNo == null) {
	        return "redirect:/hiwariKinmuchi";
	    }

	    HiwariRiyuVO data = service.getRiyuPageAfter(kigyoCd, shainUid, shinseiNo);

	    model.addAttribute("initData", data);
	    model.addAttribute("hozonUid", hozonUid);
		model.addAttribute("shinseiNo", shinseiNo);

	    return "hiwariKinmuchi/hiwariRiyu";
	}
	

	//유지희
	@GetMapping("/kakunin")
	public String showKakuninPage(HttpSession session, Model model) {

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid   = Long.valueOf(shain.getShain_Uid());   // ★ 추가: 사원 UID
	    Long shinseiNo  = null;

	    if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
	        shinseiNo = Long.valueOf(shain.getShinsei_No());
	    }

	    if (shinseiNo == null) {
	        return "redirect:/";
	    }

	    // ① 확인 헤더
	    HiwariKakuninVO header = service.getHeader(kigyoCd, shinseiNo);

	    // ② 확인용 경로(집계 VO)
	    List<HiwariKakuninRouteVO> routes = service.getRoutes(kigyoCd, shinseiNo);
	    if (routes == null) {
	        routes = new ArrayList();
	    }

	    // ③ ★★ SHINSEI_START_KEIRO 원본 값(HiwariKeiroVO) 추가 ★★
	    List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
	    
	    System.out.println("[DEBUG] /kakunin keiroList size = "
	    	    + (keiroList == null ? "null" : keiroList.size()));
	    
	    if (keiroList == null) {
	        keiroList = new ArrayList();
	    }
	    model.addAttribute("keiroList", keiroList);   // ← 이걸 JSP에서 바로 쓸 수 있음

	    // -------------------------------
	    // 아래는 기존 emp / route1 / route2 / apply 만드는 부분 그대로 유지
	    // -------------------------------
	    Map<String, Object> emp = new HashMap<String, Object>();
	    if (header != null) {
	        emp.put("no", header.getEmpNo());
	        emp.put("name", header.getEmpName());
	        emp.put("workplace", header.getEmpWorkplace());
	        emp.put("address", header.getEmpAddress());
	    }
	    model.addAttribute("emp", emp);

	    HiwariKakuninRouteVO r1 = routes.size() > 0 ? routes.get(0) : null;
	    Map<String, Object> route1 = new HashMap<String, Object>();
	    if (r1 != null) {
	        route1.put("transport", r1.getTsukinShudanNm());
	        route1.put("route", r1.getKeiroSection());
	        route1.put("workDays", r1.getShukkinNissuu() + "日間");
	        route1.put("oneWayFee", formatAmount(r1.getKataMichiRyokin()));
	        route1.put("amount", formatAmount(r1.getKingaku()));
	        route1.put("amountMonthly", formatAmount(r1.getKingakuMonthly()));
	    }
	    model.addAttribute("route1", route1);

	    HiwariKakuninRouteVO r2 = routes.size() > 1 ? routes.get(1) : null;
	    Map<String, Object> route2 = new HashMap<String, Object>();
	    if (r2 != null) {
	        route2.put("transport", r2.getTsukinShudanNm());
	        route2.put("route", r2.getKeiroSection());
	        route2.put("workDays", r2.getShukkinNissuu() + "日間");
	        route2.put("oneWayFee", formatAmount(r2.getKataMichiRyokin()));
	        route2.put("amount", formatAmount(r2.getKingaku()));
	        route2.put("amountMonthly", formatAmount(r2.getKingakuMonthly()));
	    }
	    model.addAttribute("route2", route2);

	    Map<String, Object> apply = new HashMap<String, Object>();
	    if (header != null) {
	        apply.put("kind", header.getShinseiKbnNm());
	        apply.put("reason", header.getShinseiRiyu());
	        apply.put("periodText", header.getTaishoKikanFrom() + " ～ " + header.getTaishoKikanTo());
	        apply.put("workDays", header.getShukkinNissuu() + "日間");
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

	// 유지희
	@GetMapping("/kanryo")
	public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
		model.addAttribute("shinseiNo", shinseiNo);
		return "hiwariKinmuchi/hiwariKanryo";
	}

	@GetMapping("/keiro")
	public String showKeiroPage(HttpSession session, Model model) {

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid = Long.valueOf(shain.getShain_Uid());
	    
	    List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
	    if (keiroList == null) {
	        keiroList = new ArrayList<HiwariKeiroVO>();   // ★ 여기만 수정
	    }

	    int repRouteNo = calcRepRouteNo(keiroList);

	    model.addAttribute("keiroList", keiroList);
	    model.addAttribute("repRouteNo", repRouteNo);

	    return "hiwariKinmuchi/hiwariKeiro";
	}


	// 유지희
	@PostMapping("/keiro")
	public String handleKeiro(
	        @RequestParam("action") String action,
	        HttpSession session,
	        Model model) {

	    System.out.println("=== DEBUG /keiro POST START ===");
	    System.out.println("action = " + action);

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	        // 로그인 안 되어 있으면 루트로
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid = Long.valueOf(shain.getShain_Uid());

	    List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
	    if (keiroList == null) {
	        keiroList = new ArrayList<HiwariKeiroVO>();   // ★ 여기만 변경
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

	        // 경로가 1건 이상 있으면 확인 화면으로
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



	// 유지희
	@GetMapping("/keiro/delete")
	public String deleteKeiro(
	        @RequestParam("keiroSeq") Integer keiroSeq,
	        HttpSession session) {

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid = Long.valueOf(shain.getShain_Uid());

	    service.deleteOne(kigyoCd, shainUid, keiroSeq);

	    return "redirect:/hiwariKinmuchi/keiro";
	}

	@GetMapping("/keiro/edit")
	public String editKeiro(@RequestParam("keiroSeq") Integer keiroSeq) {
	    return "redirect:/tsukinInput?mode=edit&keiroSeq=" + keiroSeq;
	}

	@GetMapping("/keiroInput")
	public String showKeiroInputPage() {
	    return "keiroinput/06_keiroInput";
	}

    private int calcRepRouteNo(List<HiwariKeiroVO> keiroList) {

        if (keiroList == null || keiroList.isEmpty()) {
            return 1;
        }
  
        return keiroList.size();
    }


 // 유지희
    @GetMapping("/map")
    public String showMapPage(HttpSession session, Model model) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/"; 
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shainUid   = Long.valueOf(shain.getShain_Uid());

        HiwariKinmuchiVO kinmuchi = service.getBeforeShinsei(kigyoCd, shainUid);

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

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shainUid   = Long.valueOf(shain.getShain_Uid());   // ★★ 이 줄 추가 ★★

        Long shinseiNo = null;
        if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
            shinseiNo = Long.valueOf(shain.getShinsei_No());
        }

        if (shinseiNo == null) {
            rttr.addFlashAttribute("error", "申請番号が取得できませんでした。");
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        try {
            // 1) 申請テーブル 갱신 (진척구분 2: 승인/신청완료 등)
            service.submitApplication(kigyoCd, shinseiNo);

            // 2) お知らせ登録 ＋ アラートメール 발행 역할
            oshiraseService.addHiwariShinseiOshirase(
                kigyoCd,
                shainUid,
                shain.getShain_No(),  // 사원번호
                shinseiNo
            );

            // 3) 完了画面으로 신청번호 전달
            rttr.addAttribute("shinseiNo", shinseiNo);
            return "redirect:/hiwariKinmuchi/kanryo";

        } catch (Exception e) {
            rttr.addFlashAttribute("error", "申請に失敗しました: " + e.getMessage());
            return "redirect:/hiwariKinmuchi/kakunin";
        }
    }

	// 유지희 끝

}