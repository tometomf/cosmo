package org.cosmo.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cosmo.domain.HiwariAddressVO;
import org.cosmo.domain.HiwariKakuninRouteVO;
import org.cosmo.domain.HiwariKakuninVO;
import org.cosmo.domain.HiwariKeiroVO;
import org.cosmo.domain.HiwariKinmuchiVO;
import org.cosmo.domain.HiwariRiyuVO;
import org.cosmo.domain.IchijiHozonDTO;
import org.cosmo.domain.ShainVO;
import org.cosmo.domain.UploadFileDTO;
import org.cosmo.service.HiwariKinmuchiService;
import org.cosmo.service.IchijiHozonService;
import org.cosmo.service.MailService;
import org.cosmo.service.OshiraseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/hiwariKinmuchi")
public class HiwariKinmuchiController {

	@Autowired
	private OshiraseService oshiraseService;

	@Autowired
	private HiwariKinmuchiService service;
	
	@Autowired
	private IchijiHozonService ichijiHozonService;
	
	@Autowired
	private MailService mailService;


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
		
		try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				System.out.println(root);
				model.addAttribute("ichijiHozon", root);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	    
	    try {
			IchijiHozonDTO hozon = ichijiHozonService.getTemp(Integer.valueOf(hozonUid));
			if (hozon != null && hozon.getData() != null) {

				String json = new String(hozon.getData(), StandardCharsets.UTF_8);

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(json);
				System.out.println(root);
				model.addAttribute("ichijiHozon", root);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	

	// 유지희
	@GetMapping("/kakunin")
	public String showKakuninPage(HttpSession session, Model model) {

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid   = Long.valueOf(shain.getShain_Uid());
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
	        routes = new ArrayList<>();
	    }

	    // ③ SHINSEI_START_KEIRO 원본 리스트
	    List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
	    if (keiroList == null) {
	        keiroList = new ArrayList<>();
	    }
	    model.addAttribute("keiroList", keiroList);


	    /* ============================================
	       ★ 업로드 파일 여부 판단 후 JSP에 값 전달
	       ============================================ */
	    if (header != null && Boolean.TRUE.equals(header.getUploadExists())) {

	        // 파일 "있음" 상태
	        model.addAttribute("evidenceFileName", header.getUploadFileName());
	        model.addAttribute("evidenceUid", header.getShinseiNo());  
	        // ※ evidenceUid는 삭제/다운로드 시 필요 → 설계에 따라 변경 가능

	    } else {

	        // 파일 "없음" 상태
	        model.addAttribute("evidenceFileName", null);
	        model.addAttribute("evidenceUid", null);
	    }


	    /* ============================================
	       아래는 기존 emp / route1 / route2 / apply 그대로 유지
	       ============================================ */

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
	
	@GetMapping("/kanryo")
	public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
	    System.out.println(">>> [KANRYO] GET /hiwariKinmuchi/kanryo, shinseiNo = " + shinseiNo);

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
	    
	    System.out.println("DEBUG — 세션 kigyoCd=" + kigyoCd + ", shainUid=" + shainUid);
	    
	    List<HiwariKeiroVO> keiroList = service.getKeiroList(kigyoCd, shainUid);
	    
	    System.out.println("DEBUG — 조회된 keiroList.size=" + (keiroList == null ? 0 : keiroList.size()));
	    
	    if (keiroList == null) {
	        keiroList = new ArrayList<HiwariKeiroVO>();   
	        
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
	        Model model,
	        RedirectAttributes rttr) {  

	    System.out.println("=== DEBUG /keiro POST START ===");
	    System.out.println("action = " + action);

	    ShainVO shain = (ShainVO) session.getAttribute("shain");
	    if (shain == null) {
	      
	        return "redirect:/";
	    }

	    Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
	    Long shainUid  = Long.valueOf(shain.getShain_Uid());

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

	        rttr.addFlashAttribute("tempSaveMsg", "一時保存しました。");

	        return "redirect:/hiwariKinmuchi/keiro";
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
    @PostMapping("/submit")
    public String submitFromKakunin(
            @RequestParam(value = "evidence", required = false) MultipartFile evidence,
            HttpSession session,
            RedirectAttributes rttr) {

        System.out.println(">>> [SUBMIT] START");

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());
        Long shainUid   = Long.valueOf(shain.getShain_Uid());

        // 1) 세션에서 shinseiNo 꺼내기
        Long shinseiNo  = null;
        if (shain.getShinsei_No() != null && !shain.getShinsei_No().isEmpty()) {
            try {
                shinseiNo = Long.valueOf(shain.getShinsei_No());
            } catch (NumberFormatException e) {
                System.out.println(">>> [SUBMIT] invalid shinsei_No in session: " + shain.getShinsei_No());
            }
        }

        // 2) 세션에 없으면 DB에서 최신 신청번호 조회
        if (shinseiNo == null) {
            Long latest = service.getLatestShinseiNo(kigyoCd, shainUid);
            System.out.println(">>> [SUBMIT] fallback latest shinseiNo = " + latest);
            shinseiNo = latest;
        }

        System.out.println(">>> [SUBMIT] kigyoCd=" + kigyoCd + ", shinseiNo=" + shinseiNo);

        if (shinseiNo == null) {
            rttr.addFlashAttribute("error", "申請番号が取得できませんでした。");
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        try {
            // ===== 증빙 파일 업로드 처리 =====
            if (evidence != null && !evidence.isEmpty()) {
                System.out.println(">>> [SUBMIT] evidence file received: " + evidence.getOriginalFilename());
                try {
                    service.saveEvidence(kigyoCd, shainUid, shinseiNo, evidence);
                } catch (IOException ioe) {
                    ioe.printStackTrace();
                    rttr.addFlashAttribute("error", "証拠ファイルの保存に失敗しました: " + ioe.getMessage());
                    return "redirect:/hiwariKinmuchi/kakunin";
                }
            } else {
                System.out.println(">>> [SUBMIT] no evidence file attached");
            }
            // ===== 증빙 파일 업로드 끝 =====

            System.out.println(">>> [SUBMIT] before submitApplication");
            service.submitApplication(kigyoCd, shinseiNo);
            System.out.println(">>> [SUBMIT] after submitApplication");

            System.out.println(">>> [SUBMIT] before addOshirase");
            oshiraseService.addHiwariShinseiOshirase(
                    kigyoCd,
                    shainUid,
                    shain.getShain_No(),
                    shinseiNo
            );
            System.out.println(">>> [SUBMIT] after addOshirase");

            // ===== 메일 송신 =====
            String to = service.getShainMailAddr(kigyoCd, shainUid);

            try {
                if (to != null && !to.isEmpty()) {
                    String subject = "【通勤マネージャー】日割申請が完了しました";
                    String html = "<p>日割通勤申請が完了しました。</p>"
                                + "<p>申請番号：" + shinseiNo + "</p>";

                    mailService.sendHtmlMail(to, subject, html);
                    System.out.println(">>> [SUBMIT] mail sent");
                } else {
                    System.out.println(">>> [SUBMIT] no mail address found");
                }
            } catch (Exception e) {
                System.out.println(">>> [SUBMIT] mail failed: " + e.getMessage());
            }
            // ===== 메일 끝 =====

            rttr.addAttribute("shinseiNo", shinseiNo);
            System.out.println(">>> [SUBMIT] redirect to kanryo");
            return "redirect:/hiwariKinmuchi/kanryo";

        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("error", "申請に失敗しました: " + e.getMessage());
            return "redirect:/hiwariKinmuchi/kakunin";
        }
    }
    // ① 증빙 파일 다운로드
    @GetMapping("/evidence/download")
    public void downloadEvidence(
            @RequestParam("uid") Long uid,
            HttpSession session,
            HttpServletResponse response) throws IOException {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            response.sendRedirect("/");
            return;
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());

        UploadFileDTO file = service.getEvidenceFile(kigyoCd, uid);
        if (file == null || file.getData() == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 헤더 설정
        response.setContentType(file.getContentType());
        String filename = java.net.URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        // 바이트 쓰기
        response.getOutputStream().write(file.getData());
        response.getOutputStream().flush();
    }

    // ② 증빙 파일 삭제
    @GetMapping("/evidence/delete")
    public String deleteEvidence(
            @RequestParam("uid") Long uid,
            HttpSession session,
            RedirectAttributes rttr) {

        ShainVO shain = (ShainVO) session.getAttribute("shain");
        if (shain == null) {
            return "redirect:/";
        }

        Integer kigyoCd = Integer.valueOf(shain.getKigyo_Cd());

        service.deleteEvidenceFile(kigyoCd, uid);

        rttr.addFlashAttribute("tempSaveMsg", "アップロードファイルを削除しました。");
        return "redirect:/hiwariKinmuchi/kakunin";
    }

} 

//유지희