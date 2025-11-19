package org.cosmo.controller;

import org.cosmo.domain.GeoPoint;
import org.cosmo.domain.KinmuForm;
import org.cosmo.service.AddressService;
import org.cosmo.service.GeoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/idoconfirm")
@RequiredArgsConstructor
public class KinmuController {
	
	private final GeoService geoService;
    private final AddressService addressService;

    // 3번 화면 최초 표시
    @GetMapping("/input")
    public String showKinmuInput(Model model) {

        KinmuForm form = new KinmuForm();

        // 테스트용 기본값 (나중에 필요 없으면 지워도 됨)
        form.setAddressChange("1"); // 기본: 住所が変わる

        model.addAttribute("kinmuForm", form);
        return "idoconfirm/03_kinmuInput";  // JSP 파일 이름
    }

    // 3번 화면에서 "次へ" 클릭 시
    @PostMapping("/kinmuNext")
    public String next(@ModelAttribute("kinmuForm") KinmuForm form,
                       Model model) {
    	
    	// 🔥 콘솔 로그 확인용
        System.out.println("===== KinmuController.next() 실행됨 =====");
        System.out.println("입력한 신규주소: " + form.getNewAddress());
        System.out.println("addressChange: " + form.getAddressChange());
       	System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // ─────────────────────────────
        // 1) 새 근무지 주소 꺼내기
        // ─────────────────────────────
        String address = form.getNewAddress();

        // (간단 검증) 주소가 비어있으면 에러
        if (address == null || address.trim().isEmpty()) {
            model.addAttribute("error", "新勤務地住所を入力してください。");
            // form을 다시 모델에 넣어서 기존 입력값 유지
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // ─────────────────────────────
        // 2) GeoService로 위도/경도 조회
        // ─────────────────────────────
        GeoPoint geo = geoService.getLatLng(address);

        // 조회 실패 → 에러 메시지 + 3번 화면 유지
        if (geo == null) {
            model.addAttribute("error", "住所の緯度経度が取得できませんでした。");
            model.addAttribute("kinmuForm", form);
            return "idoconfirm/03_kinmuInput";
        }

        // 조회 성공 → 폼에 좌표 저장 (나중에 DB 저장용)
        form.setLat(geo.getLat());
        form.setLng(geo.getLng());
        
        System.out.println("=== 좌표 세팅 후 ===");
        System.out.println("lat: " + form.getLat());
        System.out.println("lng: " + form.getLng());

        // ─────────────────────────────
        // 3) 주소 변경 여부에 따라 분기
        // ─────────────────────────────
        String addressChange = form.getAddressChange(); // "1" or "0"

        if ("1".equals(addressChange)) {
            // 住所が変わる → 4번 住所入力 화면으로 이동
            return "redirect:/idoconfirm/addressinput";

        } else {
            // 住所が変わらない → 5번 経路入力 화면으로 바로 가는데,
            // 그 전에 住所入力PG の「次へ遷移前の処理」を 호출
            addressService.runPreNextProcess(form);

            return "redirect:/idoconfirm/keiroInfo";
        }

    }

}
