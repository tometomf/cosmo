<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
.transport-wrapper {
	width: 1010px;
	margin: auto;
	display: flex;
}

.transport {
	width: 1010px;
	padding: 0.5rem;
	padding-left: 10px;
	text-align: left;
	font-weight: bold;
	border-left: 5px solid #666;
	border-bottom: 2px dotted #999;
	color: #333;
}

.grid {
	display: grid;
	grid-template-columns: 140px 1fr auto;
	width: 100%;
	justify-self: center;
}

.grid>div {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
	background-color: white;
}

.grid>div.background {
	background-color: #8f8f8f;
}

.grid2 {
	display: grid;
	grid-template-columns: 140px 1fr auto;
	width: 100%;
	justify-self: center;
	margin-top: 10px;
}

.grid2>div {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
	background-color: white;
}

.grid2>div.background {
	background-color: #8f8f8f;
}

.swapbotton {
	grid-column: 3;
	grid-row: 1/span 2;
	display: flex;
}

.station_layout {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
	align-items: center;
}

.button_layout {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
	align-items: center;
}

.button_layout>img:first-child {
	justify-self: start;
}

.button_layout>img:last-child {
	justify-self: end;
}

.left_space {
	background-color: #f8f8f8; /* ← 표 아래로 깔릴 배경 */
	padding: 16px; /* 표 주변 여백 */
	width: 90%;
	margin-left: 10px;
	align-self: start;
}

.right_space {
	
}

.form_array {
	width: 90%;
	margin: 0 auto;
}

.add_btn {
	display: block;
	margin-top: 20px;
}

.station_flow {
	display: flex;
	flex-direction: column;
	background-color: #e9f7d3;
	border: 2px solid #a8cf71;
	width: 100%;
	height: 80px;
	margin: 40px;
	justify-content: center;
	align-items: flex-start;
}

.station_flow>div {
	white-space: normal;
}

.station_flow_name {
	font-size: 24px;
	font-weight: bold;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 5fr;
}

.form_Column {
	text-align: center;
	padding: 5px;
}

.form_Normal {
	text-align: left;
	padding: 5px;
}

.search-box {
	width: 1010px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.result-box {
	width: 1010px;
	margin: auto;
	border: 1px solid #ccc;
	display: flex;
	flex-direction: column;
	background-color: #fff;
}

.result-box>div:first-child {
	width: 100%;
	background-color: #595860;
	color: #fff;
	font-weight: bold;
	display: flex;
	align-items: center;
	padding: 8px 12px;
	font-size: 14px;
	height: 31px;
	box-sizing: border-box;
	height: 31px;
	font-size: 14px;
	padding: 8px 12px;
	align-items: center;
	display: flex;
	font-weight: bold;
	color: #fff;
	background-color: #595860;
}

.result-box>div:first-child input[type="radio"] {
	margin-right: 6px;
}

.result-box>div:last-child {
	width: 100%;
	height: 275px;
	overflow: hidden;
	height: 275px;
}

.result-box>div:last-child {
	width: 100%;
	height: 375px;
	overflow: hidden;
	padding: 0;
	box-sizing: border-box;
}

#map {
	width: 100%;
	height: 100%;
}

.button_box {
	width: 1010px;
	margin: auto;
}

.hidden {
    display: none !important;
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<!-- <div class="subtitle"> -->
			<div class="flow">
				<div class="flow_others">勤務地入力</div>
				<div class="flow_others">住所入力</div>
				<div class="flow_current">経路入力</div>
				<div class="flow_others">付随書類入力</div>
				<div class="flow_others">確認</div>
				<div class="flow_others">完了</div>
			</div>
			<div class="subtitle">申請内容選択</div>
			<div class="transport-wrapper">
				<c:set var="shudanType"
					value="${not empty param.shudanType ? param.shudanType : shudanType}" />
				<c:set var="shudanLabel" value="自転車" />
				<c:if test="${shudanType == '6'}">
					<c:set var="shudanLabel" value="徒歩" />
				</c:if>
				<div class="transport">手段：${shudanLabel}</div>
			</div>
			<div class="content_Form1">
				<div id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal" id="address"></div>
				</div>
				<div id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal" id="kinmuAddress"></div>
				</div>
			</div>
			<div class="search-box">
				<div>上記の住所から勤務地までを検索します。</div>
				<img src="/resources/img/tn/search_btn01.gif" id="search" alt="back_btn01">
			</div>
			<div class="result-box hidden" id="resultBox">
				<div>
					<input type="radio" name="result1" value="1" />検索結果
				</div>
				<div>
					<div id="map"></div>
				</div>
			</div>
			<div class="content_Form1">
				<div id="form_Text1">
					<div class="form_Column">距離</div>
					<div class="form_Normal" id="distance"></div>
				</div>
			</div>
			<div class="button_box">
				<div class="button_Left_Group">
				<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						id="btnBack"> <img src="/resources/img/keiro_btn02.gif"
						alt="nyuryoku_btn01"> <img
						src="/resources/img/hozon_btn01.gif" alt="nyuryoku_btn01">
				</div>
			</div>
		</div>
		<!-- 임시저장용 폼 -->
		<form id="tsukinTempForm" method="post"
			action="<c:url value='/keiroinput/tempSave'/>">
			<input type="hidden" name="commuteJson" value="">

			<!-- 이 화면에서의 action 이름(= DTO.actionNm) -->
			<input type="hidden" name="actionUrl"
				value="/keiroinput/07_keiroInput_04">

			<!-- 이동용 URL, hozonBtn은 비워서 보내고 keiroBtn은 채워서 보냄 -->
			<input type="hidden" name="redirectUrl" value="">
		</form>

	</div>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVcLQp5Bph7NiWqwiYJUQEBMRyCOEsTnU&libraries=maps"
	defer></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
  // "35.6909,139.7003" → {lat: 35.6909, lng: 139.7003}
  function parseLatLng(latlng) {
    if (!latlng || latlng.indexOf(",") === -1) return null;
    var parts = latlng.split(",");
    var lat = parseFloat(parts[0]);
    var lng = parseFloat(parts[1]);
    if (isNaN(lat) || isNaN(lng)) return null;
    return { lat: lat, lng: lng };
  }

  // 전역 변수로 자택/근무지 좌표 저장 (페이지 로드시 채워짐)
  var homePos = null;
  var workPos = null;

  var homeFullAddress = null;
  var workFullAddress = null;
  var distance    = null;
  /**
   * ① 페이지 로드 후에 실행: 사원 위치 정보만 가져와서
   *    address / kinmuAddress div 채우고, 좌표를 변수에 저장
   */
  function loadShainLocation() {
    fetch('/keiroinput/shain/location', { method: 'GET' })
      .then(function(res) {
        if (!res.ok) {
          console.error('HTTP 오류:', res.status);
          throw new Error('HTTP error ' + res.status);
        }
        return res.json();
      })
      .then(function(data) {
        console.log('사원 위치 정보:', data);

        var addressDiv = document.getElementById('address');
        var kinmuAddressDiv = document.getElementById('kinmuAddress');

        var a1 = data.address1 || '';
        var a2 = data.address2 || '';
        var a3 = data.address3 || '';
        var k1 = data.kinmuAddress1 || '';
        var k2 = data.kinmuAddress2 || '';
        var k3 = data.kinmuAddress3 || '';

        homeFullAddress = (a1 + ' ' + a2 + ' ' + a3).trim();
        workFullAddress = (k1 + ' ' + k2 + ' ' + k3).trim();

        if (addressDiv) addressDiv.textContent = homeFullAddress;
        if (kinmuAddressDiv) kinmuAddressDiv.textContent = workFullAddress;

        // 좌표는 전역 변수에 저장만 해둠
        homePos = parseLatLng(data.addressIdoKeido);
        workPos = parseLatLng(data.kinmuAddressIdoKeido);

        if (!homePos || !workPos) {
          console.error('위도/경도 정보 부족:', data);
        }
      })
      .catch(function(err) {
        console.error('위치 정보 요청/처리 오류:', err);
      });
  }

  /**
   * ② 검색 버튼 클릭 시 실행: 이미 저장된 homePos / workPos로
   *    지도 + 경로 + 거리 표시
   */
  function initMapAndRoute() {
    if (!homePos || !workPos) {
      alert('위치 정보가 아직 준비되지 않았습니다. 잠시 후 다시 시도하세요.');
      console.error('homePos/workPos 없음:', homePos, workPos);
      return;
    }

    var centerPos = {
      lat: (homePos.lat + workPos.lat) / 2,
      lng: (homePos.lng + workPos.lng) / 2
    };

    var mapDiv = document.getElementById('map');
    if (!mapDiv) {
      console.error('map 요소를 찾을 수 없습니다.');
      return;
    }

    var map = new google.maps.Map(mapDiv, {
      center: centerPos,
      zoom: 13
    });

/*     new google.maps.Marker({
      position: homePos,
      map: map,
      title: '自宅（자택）'
    });

    new google.maps.Marker({
      position: workPos,
      map: map,
      title: '勤務先（근무지）'
    }); */

    var directionsService = new google.maps.DirectionsService();
    var directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);

    var request = {
      origin: homePos,
      destination: workPos,
      travelMode: google.maps.TravelMode.WALKING
    };

    directionsService.route(request, function(result, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        directionsRenderer.setDirections(result);

        var leg = result.routes[0].legs[0];
        distance = (leg.distance.value / 1000).toFixed(1);
        console.log("distance", distance)
        var distanceDiv = document.getElementById("distance");
        if (distanceDiv) distanceDiv.textContent = leg.distance.text;
      } else {
        console.error('경로 검색 실패:', status);
      }
    });
  }

  
  //  1) 위치 정보 먼저 가져오기
  //  2) 검색 버튼 클릭 시 지도/경로 표시
  window.addEventListener('load', function () {
    // 1) 위치 정보 로딩
    loadShainLocation();

    // 2) 검색 버튼 클릭 → initMapAndRoute
    var searchBtn = document.getElementById('search');
    if (searchBtn) {
      searchBtn.addEventListener('click', function () {
    	  
        var box = document.getElementById('resultBox');
        if (box) box.classList.remove('hidden');  
        initMapAndRoute();
      });
    }
  });

document.addEventListener("DOMContentLoaded", function () {
    /* 뒤로가기 버튼 */
    const btnBack = document.getElementById('btnBack');
    if (btnBack) {
        btnBack.addEventListener('click', function () {
            if (document.referrer) {
                location.href = document.referrer;
                return;
            }
            if (history.length > 1) {
                history.go(-1);
                return;
            }
            location.href = '/';
        });
    }

    /* 합계 표시  */
    function updateTotal(idInput, idTotal) {
        const input = document.getElementById(idInput);
        const total = document.getElementById(idTotal);

        if (!input || !total) return;

        input.addEventListener("input", function () {
            const value = input.value;
            if (value === "" || isNaN(value)) {
                total.textContent = "0円";
            } else {
                total.textContent = parseInt(value, 10).toLocaleString('ja-JP') + "円";
            }
        });
    }

    updateTotal("pass1m", "total1m");
    updateTotal("pass3m", "total3m");
    updateTotal("pass6m", "total6m");

    /* 임시저장 + 이동 처리 공통 준비 */

    const keiroBtn = document.querySelector('img[src="/resources/img/keiro_btn02.gif"]');
    const hozonBtn = document.querySelector('img[src="/resources/img/hozon_btn01.gif"]');

    const form             = document.getElementById("tsukinTempForm");
    const commuteJsonInput = form.querySelector('input[name="commuteJson"]');
    const redirectUrlInput = form.querySelector('input[name="redirectUrl"]');

    // JSTL로 세팅된 값들
    const shudanType  = "${shudanType}";   // "2" or "7"
    const shudanLabel = "${shudanLabel}";  // "バス" or "その他"

    /**
     * 서버에 넘길 신청 데이터(ShinseiIcDataVO 형식)
     */
    function buildCommuteJson() {
        // 이 화면에서는 공통 정보는 일단 null, keiro만 세팅
        const kbn        = shudanType || null;   // "2" 또는 "7"
        const labelText  = shudanLabel || "";    // "バス" 또는 "その他"
 
        const shinseiIcData = {
            kigyoCd:   null,
            shinseiNo: null,
            shinseiYmd: null,
            shinseiKbn: null,
            shinchokuKbn: null,
            genAddress: null,
            newAddress: null,
            genShozoku: null,
            newShozoku: null,
            genKinmuchi: null,
            newKinmuchi: null,
            riyu: null,
            idoYmd: null,
            itenYmd: null,
            tennyuYmd: null,
            riyoStartYmd: null,
            ssmdsYmd: null,
            moComment: null,
            codeNm: null,
            shinseiName: null,

            // 통근 경로 정보
            keiro: {
                tsukinShudan: kbn,       // 예: "2" (버스), "7" (기타)
                shudanName:   labelText,  // 예: "バス", "その他"
                startPlace: homeFullAddress,
                endPlace:  workFullAddress,
                shinseiKm: distance 
            }
        };
		
        console.log(shinseiIcData);
        return JSON.stringify(shinseiIcData);
    }

    /* hozon 버튼: 임시저장 + 기본 화면(/shinsei/ichiji)으로 */
    if (hozonBtn) {
        hozonBtn.addEventListener("click", function () {
            const jsonString = buildCommuteJson();
            if (!jsonString) return;

            commuteJsonInput.value = jsonString;

            // redirectUrl 비워서 → 컨트롤러: "redirect:/shinsei/ichiji?hozonUid=..." 로 이동
            redirectUrlInput.value = "";

            form.submit();
        });
    }

    /* 다음 단계: 임시저장 + 원하는 페이지로 이동 */
    if (keiroBtn) {
        keiroBtn.addEventListener("click", function () {
            const jsonString = buildCommuteJson();
            if (!jsonString) return;

            commuteJsonInput.value = jsonString;

            // 이 화면 이후에 이동할 URL 지정
            // 예시: 다음이 경로 확인 화면이라면
            const nextPath = "<c:url value='/idoconfirm/keiroInfo'/>";

            // 컨트롤러에서 return redirectUrl; 그대로 쓰므로
            redirectUrlInput.value =  nextPath;

            form.submit();
        });
    }
});
</script>
</body>
</html>