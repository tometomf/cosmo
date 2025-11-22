package org.cosmo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.net.URL;

import org.cosmo.domain.GeoPoint;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GeoService {

    // 발급받은 구글 Geocoding API 키
    private static final String API_KEY = "AIzaSyAePHryP_D5L-AAnqkVeBjDshwxC29dS5A";

    /**
     * 주소 → 위도/경도 조회 (Google Geocoding API 사용)
     * 실패하면 null 리턴
     */
    public GeoPoint getLatLng(String address) {

        try {
            // 1) 주소 기본 체크
            if (address == null || address.trim().isEmpty()) {
                return null;
            }

            // 2) URL 인코딩 (한글/일본어 깨지지 않게)
            String encodedAddress = URLEncoder.encode(address, "UTF-8");

            // 3) 요청 URL 만들기
            String urlStr = "https://maps.googleapis.com/maps/api/geocode/json"
                    + "?address=" + encodedAddress
                    + "&key=" + API_KEY;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 4) HTTP 응답 코드 체크
            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                System.out.println("Geocoding API 호출 실패. HTTP 코드 = " + responseCode);
                return null;
            }

            // 5) 응답 JSON 문자열 읽기
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();

            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            br.close();
            conn.disconnect();

            String json = sb.toString();

            // 6) JSON 파싱 (Jackson 사용)
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(json);

            // status 가 "OK" 아니면 실패
            String status = root.path("status").asText();
            if (!"OK".equals(status)) {
                System.out.println("Geocoding API 결과 status = " + status);
                return null;
            }

            // 7) 결과에서 첫 번째 위치 꺼내기
            JsonNode location = root
                    .path("results")
                    .get(0)
                    .path("geometry")
                    .path("location");

            double lat = location.path("lat").asDouble();
            double lng = location.path("lng").asDouble();

            System.out.println("Google Geocoding 결과 lat=" + lat + ", lng=" + lng);

            // 8) GeoPoint에 담아서 리턴
            return new GeoPoint(lat, lng);

        } catch (Exception e) {
            e.printStackTrace();
            return null; // 에러나면 null 리턴해서 컨트롤러에서 처리
        }
    }

}
