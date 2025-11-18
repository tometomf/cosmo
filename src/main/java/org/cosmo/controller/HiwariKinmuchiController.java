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

    @Autowired
    private HiwariKeiroService hiwariKeiroService;

    @GetMapping("hiwariKinmuchi")
    public String showKinmuchiPage() {
        return "hiwariKinmuchi/hiwariKinmuchi";
    }

    @GetMapping("/address")
    public String showHiwariAddressPage() {
        return "hiwariKinmuchi/hiwariAddress";
    }

    @GetMapping("/kakunin")
    public String showKakuninPage(Model model) {

        Integer dummyShainUid = 1; // TODO: 로그인 연동 시 교체

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

        return "hiwariKinmuchi/hiwariKakunin";
    }

    @GetMapping("/kanryo")
    public String kanryo(@RequestParam("shinseiNo") Long shinseiNo, Model model) {
        model.addAttribute("shinseiNo", shinseiNo);
        return "hiwariKinmuchi/hiwariKanryo";
    }

    @GetMapping("/keiro")
    public String showKeiroPage(Model model) {

        Integer dummyShainUid = 1; // TODO: 로그인 연동 시 교체

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);

        return "hiwariKinmuchi/hiwariKeiro";
    }

    @PostMapping("/keiro")
    public String handleKeiro(
            @RequestParam("action") String action,
            Model model) {

        System.out.println("=== DEBUG /keiro POST START ===");
        System.out.println("action = " + action);

        Integer dummyShainUid = 1; // TODO: 로그인 연동 시 교체

        List<HiwariKeiroVO> keiroList = hiwariKeiroService.getKeiroList(dummyShainUid);
        if (keiroList == null) {
            keiroList = new ArrayList<HiwariKeiroVO>();
        }

        int repRouteNo = calcRepRouteNo(keiroList);
        System.out.println("keiroList size = " + keiroList.size());

        if ("apply".equals(action)) {

            // ★ 문자깨짐 수정: 일본어 에러문구로 교체
            if (keiroList.isEmpty()) {
                model.addAttribute("errorMsg", "経路が1件も登録されていません。");
                model.addAttribute("keiroList", keiroList);
                model.addAttribute("repRouteNo", repRouteNo);
                return "hiwariKinmuchi/hiwariKeiro";
            }

            // 설계서: 次へ → 확인 처리용 저장 (지금은 SHINSEI_START_KEIRO에 반영)
            hiwariKeiroService.saveApply(dummyShainUid, keiroList);
            return "redirect:/hiwariKinmuchi/kakunin";
        }

        if ("temp".equals(action)) {
            // 설계서 8.「一時保存」: 입력 체크 없이 저장
            hiwariKeiroService.saveTemp(dummyShainUid, keiroList);
            return "redirect:/hiwariKinmuchi/keiro";
        }

        model.addAttribute("keiroList", keiroList);
        model.addAttribute("repRouteNo", repRouteNo);
        return "hiwariKinmuchi/hiwariKeiro";
    }

    // ★ 추가: 「戻る」ボタン용 (理由入力 화면으로 돌아가기)
    @GetMapping("/back")
    public String backFromKeiro() {
        // 설계서 6.「戻る」ボタン → 日割申請理由入力 화면
        // 지금은 같은 모듈의 hIwairiRiyu.jsp로 이동한다고 가정
        return "redirect:/hiwariKinmuchi/riyu";
    }

    // ★ 추가: 「削除する」リンク용
    @GetMapping("/keiro/delete")
    public String deleteKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq) {

        Integer dummyShainUid = 1; // TODO: 로그인 연동 시 교체

        // 아직 Service에 메서드 없으면 추가 필요 (deleteOne 설명 따로 줄게)
        hiwariKeiroService.deleteOne(dummyShainUid, keiroSeq);

        // 삭제 후 다시 경로 입력 화면으로
        return "redirect:/hiwariKinmuchi/keiro";
    }

    // ★ 추가: 「変更する」リンク용
    @GetMapping("/keiro/edit")
    public String editKeiro(
            @RequestParam("keiroSeq") Integer keiroSeq) {

        // 설계서 4.「変更する」→「通勤手段入力」画面に遷移する。
        // 실제 통근수단 입력 화면 URL은 팀 공통 설계에 맞춰야 함.
        // 지금은 가상으로 /tsukinInput 으로 리다이렉트해 두는 상태.
        return "redirect:/tsukinInput?mode=edit&keiroSeq=" + keiroSeq;
    }

    private int calcRepRouteNo(List<HiwariKeiroVO> keiroList) {
        if (keiroList == null) {
            return 0;
        }
        // 지금 설계상: DB에 있는 경로 개수만 사용
        return keiroList.size();
    }

    @GetMapping("/riyu")
    public String showRiyuPage() {
        return "hiwariKinmuchi/hiwariRiyu";
    }
}
