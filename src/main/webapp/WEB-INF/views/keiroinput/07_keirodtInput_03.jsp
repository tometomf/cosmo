<!-- 지훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>title</title>
   <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>

<style>
.flow-wrapper {
   display: flex;
   gap: 16px;
   justify-content: center;
   align-items: center;
}

.flow-current {
   position: relative;
   flex: 1 1 0;
   min-width: 0;
   width: 100%;
   height: 100px;
   background-image: url('<c:url value="/resources/img/bg_flow_01.gif"/>');
   background-size: auto;
   background-position: center;
   background-repeat: no-repeat;
}

.flow-other {
   position: relative;
   flex: 1 1 0;
   min-width: 0;
   width: 100%;
   height: 100px;
   background-image: url('<c:url value="/resources/img/bg_flow_02.gif"/>');
   background-size: auto;
   background-position: center;
   background-repeat: no-repeat;
}

.flow-currenttext {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   color: #fff;
   font-size: clamp(12px, 2vw, 7px);
   font-weight: 700;
   text-align: center;
}

.flow-othertext {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   color: #808080;
   font-size: clamp(12px, 2vw, 7px);
   font-weight: 700;
   text-align: center;
}

.station-background {
   position : relative;
   width : 40%;
   height : 200px;
   background-color: #cecece;
   background-size : auto;
   backgorund-position : left;
   background-repeat: no-repeat;
}

p　{
   text-align: center;
}

.form_Text1 {
   display: grid;
   grid-template-columns: 1fr 5fr;
}

.form_Normal {
   border-right: solid 1px #a0a0a0;
   border-bottom: solid 1px #a0a0a0;
}

.form_Column1 {
   background-color: #dddddd;
   text-align: center;
   border: 1px solid #FFFFFF;
}

.form_Column1 p {
   background-color: #dddddd;
   text-align: center;
}

.form_Column2 {
   background-color: #dddddd;
   text-align: center;
   border: 1px solid #FFFFFF;
}

.form_Column2 p {
   background-color: #dddddd;
   text-align: left;
}

#content1 {
   font-size: 13px;
   display: flex;
   flex-direction: column;
   align-items: center; /* 전체를 가운데 정렬 */
   gap: 15px;
   margin-top: 30px;
}

#content1>div {
   display: flex;
   align-items: center;
}

#content1>div>div:last-child {
   flex: 1;
}

#content1 img {
   cursor: pointer;
   display: block;
}

#content2 {
   font-size: 13px;
   flex-direction: column;
   align-items: left;
   gap: 15px;
   margin-top: 5px;
}

#content2>div {
   display: flex;
   align-items: center;
}

#content2>div>div:last-child {
   flex: 1;
}

#content2 img {
   cursor: pointer;
}

.transport-wrapper {
   display: flex;
   justify-content: center;
   align-items: center;
   width: 100%;
   min-width: 500px;
}

.transport {
   padding: 0.3rem;
   padding-left: 10px;
   margin: 1rem;
   text-align: left;
   font-weight: bold;
   border-left: 4px solid #666;
   border-bottom: 1px dotted #999;
   padding-bottom: 4px;
   color: #333;
   width: 90%;
}

.text {
   font-size: 13px;
}

.table {
   border: 1px solid;
}

.result-box {
   width: 1000px;
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
}

.result-box>div:first-child input[type="radio"] {
   margin-right: 6px;
}

.result-box>div:last-child {
   width: 100%;
   height: 275px;
   overflow: hidden;
}

.result-box>div>img {
   width: 100%;
   height: 100%;
   object-fit: cover;
   display: block;
}

/* 처음엔 IC/片道料金 블록 숨기기용 */
.hidden {
   display: none;
}
</style>

<body>
   <div class="layout">
      <%@ include file="/WEB-INF/views/common/header.jsp"%>
      <div class="main">
         <div class="main_Content">
            <!-- 진척도 -->
            <div class="flow">
               <div class="flow_others">勤務地入力</div>
               <div class="flow_others">住所入力</div>
               <div class="flow_current">経路入力</div>
               <div class="flow_others">付随書類入力</div>
               <div class="flow_others">確認</div>
               <div class="flow_others">完了</div>
            </div>

            <div class="subtitle">【経路③】　経路詳細　入力</div>

            <div class="transport-wrapper">
            <c:set var="shudanType"
					value="${not empty param.shudanType ? param.shudanType : shudanType}" />
               <div class="transport">手段：${shudanNm}</div>
            </div>

            <div class="text">
               <div>自動車の場合、1ヶ月通勤費支給額の上限は</div>
               <div>社宅を利用されている方      ・・・      13.300円／月</div>
               <div>社宅を利用されていない方      ・・・      39.700円／月</div>
               <div>です。ご注意ください</div>
            </div>

            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>住所</p></div>
                  <div class="form_Normal"><p id="address"></p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>勤務地</p></div>
                  <div class="form_Normal"><p id="kinmuAddress"></p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>経由地</p></div>
                  <div style="padding:1rem;">
                     <input style="width:100%;" type="text"
                            id="viaPlace1Input"
                            class="route-watch"
                            name="viaPlace1"
                            value="${startKeiro.viaPlace1}"/>
                  </div>
               </div>
            </div>

            <div class="content1" id="content1">
               <div>
                  <div>上記の住所から勤務地までを検索します。</div>
                  <div><img src="/resources/img/tn/search_btn01.gif" id="search"></div>
               </div>
            </div>

            <div class="text" id="distance">一般経路で距離：</div>

            <!-- 검색結果1 -->
            <div class="result-box">
               <div>
                  <input type="radio" id="routeNoTollRadio" name="routeSelect" value="noToll" />検索結果 1
               </div>
               <div class="text">有料道路を利用しないルート</div>
               <div id="mapNoToll"></div>
            </div>

            <!-- 검색結果2 -->
            <div class="result-box">
               <div>
                  <input type="radio" id="routeTollRadio" name="routeSelect" value="toll" />検索結果 2
               </div>
               <div class="text">有料道路を利用するルート</div>
               <div id="mapToll"></div>
            </div>

            <!-- 선택 요약 -->
            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>距離</p></div>
                  <div class="form_Normal"><p id="routeSummaryDistance">-</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路</p></div>
                  <div class="form_Normal"><p id="routeSummaryTollUse">-</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路無料</p><p>片道／往復</p></div>
                  <div>
                     <label>
                        <input type="radio"
                               name="ofukuKbn"
                               id="ofukuOneWay"
                               class="route-watch"
                               value="1">片道利用
                     </label>
         　          <label>
                        <input type="radio"
                               name="ofukuKbn"
                               id="ofukuRound"
                               class="route-watch"
                               value="2">往復利用
                     </label>
                  </div>
               </div>
            </div>

            <!-- IC / 片道料金 : 초기에는 비표시 -->
            <div class="table hidden" id="tollDetailBlock">
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路IC 乗り口</p></div>
                  <div class="form_Normal"><p id="tollIcStartLabel"></p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路IC  降り口</p></div>
                  <div class="form_Normal"><p id="tollIcEndLabel"></p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路    片道料金</p></div>
                  <div><p id="tollPriceLabel"></p></div>
               </div>
            </div>

            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路利用理由</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:100%;"
                            type="text"
                            id="yuryoRiyoRiyuInput"
                            class="route-watch">
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>経由地入力理由</p></div>
                  <div style="padding:1rem;">
                     <input style="width:100%;"
                            type="text"
                            id="viaPlaceRiyuInput"
                            class="route-watch">
                  </div>
               </div>
            </div>

            <div class="text">
               <div>原則、当画面で検索された推奨ルートで申請してください。</div>
               <div>ただし、理由があって別ルートで申請した場合、このwebサイトで検索し、</div>
               <div>検索結果画面のアップロード、および必要事項を入力してください。</div>
               <br>
               <div>別ルート検索はこちらから　〈外部サイトが開きます〉　<a href="http://www.navitime.co.jp/">http://www.navitime.co.jp</a></div>
            </div>
            <br>

            <div id="content2">
               <img src="/resources/img/root_btn01.gif" alt="root_btn01" id="btnBetsuRouteToggle">
            </div>

            <!-- 외부 사이트 검색 결과 직접 입력 영역 -->
            <div class="table hidden" id="betsuRouteBlock">
               <div class="form_Text1">
                  <div class="form_Column2"><p>検索結果画面</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:25%;"
                            type="text"
                            id="resultCapturePathInput"
                            class="route-watch">
                     &nbsp;<button>参照</button>&nbsp;<button>アップロード</button>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>距離</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:20%;"
                            type="text"
                            id="resultDistanceInput"
                            class="route-watch"> km
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路IC　乗り口</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:50%;"
                            type="text"
                            id="icStartInput"
                            class="route-watch">
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路IC　降り口</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:50%;"
                            type="text"
                            id="icEndInput"
                            class="route-watch">
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路片道料金</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:20%;"
                            type="text"
                            id="tollPriceInput"
                            class="route-watch"> 円
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>別ルート　理由</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:100%;"
                            type="text"
                            id="betsuRouteRiyuInput"
                            class="route-watch">
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路無料</p><p>片道／往復</p></div>
                  <div>
                     <label>
                        <input type="radio"
                               name="resultOfukuKbn"
                               id="resultOfukuOneWay"
                               class="route-watch"
                               value="1">片道利用
                     </label>
         　          <label>
                        <input type="radio"
                               name="resultOfukuKbn"
                               id="resultOfukuRound"
                               class="route-watch"
                               value="2">往復利用
                     </label>
                  </div>
               </div>
            </div>

            <div id="content2">
               <img src="/resources/img/back_btn01.gif" alt="back_btn01" id="btnBack">
               <img src="/resources/img/keiro_btn02.gif" alt="keiro_btn02">
               <img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
            </div>
         </div>

         <!-- 일시저장용 폼 (자동차 경로용) -->
         <form id="carRouteTempForm" method="post" action="<c:url value='/keiroinput/tempSave'/>">
            <!-- ShinseiIcDataVO (+ keiro) JSON 문자열 -->
            <input type="hidden" name="commuteJson" value="">

            <!-- 이 화면에서의 action 이름 (ICHIJI_HOZON.ACTION_NM) -->
            <input type="hidden" name="actionUrl" value="/keiroinput/07_keiroInput_03">

            <!-- 저장 후 이동할 URL (비워두면 /shinsei/ichiji?hozonUid=... 로 이동) -->
            <input type="hidden" name="redirectUrl" value="">
            
            <input type="hidden"
       				name="hozonUid"
       				value="${empty hozonUid ? 0 : hozonUid}">
       				
       		<input type="hidden" name="shinseiNo" value="${shinseiNo}">
       		
    		
         </form>

         <%@ include file="/WEB-INF/views/common/footer.jsp"%>
      </div>
   </div>

	<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVcLQp5Bph7NiWqwiYJUQEBMRyCOEsTnU&libraries=maps"
      defer></script>

   <script>
  // 뒤로가기
  (function () {
    var backBtn = document.getElementById('btnBack');
    if (!backBtn) {
      return;
    }

    backBtn.addEventListener('click', function () {
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
  })();
  
  
  
  
  		function parseLatLng(latlng) {
	    if (!latlng || latlng.indexOf(",") === -1) return null;
	    var parts = latlng.split(",");
	    var lat = parseFloat(parts[0]);
	    var lng = parseFloat(parts[1]);
	    if (isNaN(lat) || isNaN(lng)) return null;
	    return { lat: lat, lng: lng };
	  	}

	  // 전역: 자택/근무지 좌표 & 거리
	  var homePos = null;
	  var workPos = null;
	  
	  var homeFullAddress = null;
	  var workFullAddress = null;

	  // 선택된 루트 거리
	  var distance      = null;  // 현재 선택된 루트 km
	  
	  var addressDiv      = document.getElementById('address');
	  var kinmuAddressDiv = document.getElementById('kinmuAddress');
	  
	  const startAddr = "<c:out value='${startAddr}' default='' />";
	  const endAddr   = "<c:out value='${endAddr}' default='' />";
	  const startPos  = "<c:out value='${startPos}' default='' />";
	  const endPos    = "<c:out value='${endPos}' default='' />";
	  
	  var routeNoTollKm = null;  // 검색結果1
	  var routeTollKm   = null;  // 검색結果2

	  // 위치 정보 로딩
	  function loadShainLocation() {
	    fetch('/keiroinput/shain/location', { method: 'GET' })
	      .then(function (res) {
	        if (!res.ok) {
	          console.error('HTTP 오류:', res.status);
	          throw new Error('HTTP error ' + res.status);
	        }
	        return res.json();
	      })
	      .then(function (data) {
	        console.log('사원 위치 정보:', data);
	        
	        
	        var a1 = data.address1 || '';
	        var a2 = data.address2 || '';
	        var a3 = data.address3 || '';
	        var k1 = data.kinmuAddress1 || '';
	        var k2 = data.kinmuAddress2 || '';
	        var k3 = data.kinmuAddress3 || '';

	        // 1) 기본값: SHAIN/근무지 주소 기준 문자열
	        var defaultHomeAddr = (a1 + ' ' + a2 + ' ' + a3).trim();
      		var defaultWorkAddr = (k1 + ' ' + k2 + ' ' + k3).trim();

	        // 2) startAddr/endAddr/startPos/endPos가 넘어왔는지 체크
	        var hasParams =
	          	(startAddr && startAddr !== '') &&
	          	(endAddr   && endAddr   !== '') &&
	          	(startPos  && startPos  !== '') &&
	          	(endPos    && endPos    !== '');
	        
	        if (hasParams) {
	        	homeFullAddress = startAddr;
	            workFullAddress = endAddr;
	            homePos = parseLatLng(startPos);
	            workPos = parseLatLng(endPos);
	        } else {
	        	homeFullAddress = defaultHomeAddr;
	            workFullAddress = defaultWorkAddr;

	            homePos = parseLatLng(data.addressIdoKeido);
	            workPos = parseLatLng(data.kinmuAddressIdoKeido);
	        }
	        
	        // 화면 표시
	        if (addressDiv)      addressDiv.textContent      = homeFullAddress;
	        if (kinmuAddressDiv) kinmuAddressDiv.textContent = workFullAddress;
	        
	        console.log("homePos:", homePos, "workPos:", workPos);

	        if (!homePos || !workPos) {
	          console.error('위도/경도 정보 부족:', data);
	        }
	      })
	      .catch(function (err) {
	        console.error('위치 정보 요청/처리 오류:', err);
	      });
	  }
  
  
  
  
  
  
	  
	  
  
	//=== 자동차 지급 계산용 상수 (전역) ===
  	//  - 연비: 10km/L
  	//  - 월 지급 일수: 24일
  	//  - 휘발유 단가: 나중에 서버/마스터에서 내려줄 때까지 0으로 두고, 계산 결과는 JSON에 기록만 해둔다.
  	var CAR_FUEL_EFFICIENCY_KM_PER_L = 10;
 	var CAR_MONTHLY_WORK_DAYS        = 24;
  	var CAR_FUEL_UNIT_PRICE_PER_L    = 200; // TODO: 실제 단가 내려오면 이 값 교체

  
	//1ヶ月通勤費支給額 上限
  	var CAR_MONTHLY_LIMIT_SHATAKU     = 13300; // 社宅利用者
 	var CAR_MONTHLY_LIMIT_NON_SHATAKU = 39700; // 社宅を利用されていない方
 	
 	var CAR_IS_SHATAKU = false;
 	
  // === 자동차 1개월 금액 계산 함수 (전역) ===
  //  - kmNumber: 편도 거리(km)
  //  - tollOneWayFare: 유료도로 편도 요금(엔) (없으면 null)
  //  - yuryoOfukuKbn: "1"(편도), "2"(왕복), 그 외(미설정)
  function buildCarPaymentCalc(kmNumber, tollOneWayFare, yuryoOfukuKbn) {
    var oneWayKm = (kmNumber != null && !isNaN(kmNumber)) ? kmNumber : null;

    var fuelUnitPrice = CAR_FUEL_UNIT_PRICE_PER_L;
    var fuelEff       = CAR_FUEL_EFFICIENCY_KM_PER_L;
    var days          = CAR_MONTHLY_WORK_DAYS;

    // ---- 1) 편도 기본 요금(유료도로 제외) ----
    //  편도요금(엔) = 편도거리(km) × 휘발유 단가(엔/L) / 연비(km/L)
    var oneWayBaseFare    = null;    // g. 편도요금
    var monthlyBaseAmount = null;    // a. 연료 기반 월 지급 금액(유료도로 제외)

    if (oneWayKm != null &&
        fuelUnitPrice != null && fuelUnitPrice > 0 &&
        fuelEff != null && fuelEff > 0 &&
        days != null && days > 0) {

      oneWayBaseFare = Math.round(oneWayKm * fuelUnitPrice / fuelEff);
      // 월지급: 편도요금 × 2(왕복) × 월 지급 일수
      monthlyBaseAmount = oneWayBaseFare * 2 * days;
    }
	
    
    var tollFare = (tollOneWayFare != null &&
            !isNaN(tollOneWayFare) &&
            Number(tollOneWayFare) > 0)
			? Number(tollOneWayFare)
			: null;

    // 유료도로 이용 구분(편도/왕복)에 따른 계수
    //   - 편도 이용: 하루에 1회
    //   - 왕복 이용: 하루에 2회
    var tollUseFactor = 0;
    if (yuryoOfukuKbn === "1") {
      tollUseFactor = 1;
    } else if (yuryoOfukuKbn === "2") {
      tollUseFactor = 2;
    }

    var monthlyTollAmount = null;   // a.식의 "(유료도로 거리 요금 × 이용구분 × 월지급일수)" 부분
    if (tollFare != null && tollUseFactor > 0 && days != null && days > 0) {
      monthlyTollAmount = tollFare * tollUseFactor * days;
    }

    // ---- 3) 월 지급 총액(연료 + 유료도로) ----
    var monthlyTotalAmount = null;
    if (monthlyBaseAmount != null || monthlyTollAmount != null) {
      monthlyTotalAmount = (monthlyBaseAmount || 0) + (monthlyTollAmount || 0);
    }
    
    if (monthlyTotalAmount != null) {
        var limit = CAR_IS_SHATAKU
          ? CAR_MONTHLY_LIMIT_SHATAKU
          : CAR_MONTHLY_LIMIT_NON_SHATAKU;

        if (limit != null && limit > 0 && monthlyTotalAmount > limit) {
          monthlyTotalAmount = limit;
        }
      }

    // ※ 최초 지급 금액은 대상일/월말 정보가 없어서 여기서는 계산하지 않고 null로 둔다.
    var firstMonthAmount = null;

    return {
      oneWayKm:             oneWayKm,
      fuelUnitPrice:        fuelUnitPrice,
      fuelEfficiencyKmPerL: fuelEff,
      monthlyWorkDays:      days,

      oneWayBaseFare:       oneWayBaseFare,
      monthlyBaseAmount:    monthlyBaseAmount,

      tollOneWayFare:       tollFare,
      tollUseFactor:        tollUseFactor,
      monthlyTollAmount:    monthlyTollAmount,

      monthlyTotalAmount:   monthlyTotalAmount,
      firstMonthAmount:     firstMonthAmount
    };
  }
  
  
  
  
  
  
//공통 경로 그리기
  function drawRoute(mapDivId, avoidTolls, callback) {
    var mapDiv = document.getElementById(mapDivId);
    if (!mapDiv) {
      console.error('[' + mapDivId + '] 요소를 찾을 수 없습니다.');
      if (callback) callback(null, 'NO_ELEMENT');
      return;
    }

    var centerPos = {
      lat: (homePos.lat + workPos.lat) / 2,
      lng: (homePos.lng + workPos.lng) / 2
    };

    var map = new google.maps.Map(mapDiv, {
      center: centerPos,
      zoom: 13
    });

    var directionsService  = new google.maps.DirectionsService();
    var directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);

    var viaInput  = document.getElementById('viaPlace1Input');
    var viaText   = viaInput ? viaInput.value.trim() : '';
    var waypoints = [];

    if (viaText) {
      waypoints.push({
        location: viaText,
        stopover: true
      });
    }

    var request = {
      origin:      homePos,
      destination: workPos,
      travelMode:  google.maps.TravelMode.DRIVING,
      avoidTolls:  !!avoidTolls
    };

    if (waypoints.length > 0) {
      request.waypoints = waypoints;
    }

    directionsService.route(request, function (result, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        directionsRenderer.setDirections(result);
        if (callback) callback(result, status);
      } else {
        console.error('[' + mapDivId + '] 경로 검색 실패:', status);
        if (callback) callback(null, status);
      }
    });
  }

  // 전체 거리(km) 계산
  function calcTotalDistanceKm(route) {
    if (!route || !route.legs || route.legs.length === 0) return null;
    var meters = 0;
    route.legs.forEach(function (leg) {
      if (leg.distance && leg.distance.value) {
        meters += leg.distance.value;
      }
    });
    if (meters === 0) return null;
    return (meters / 1000).toFixed(1);
  }

  /**
   * 검색結果 라디오 선택에 따른 요약/표시 제어
   */
  function applyRouteDetails(routeType) {
    var km = null;
    var tollUseText = '';

    if (routeType === 'noToll') {
      km = routeNoTollKm;
      tollUseText = '利用しない';
    } else if (routeType === 'toll') {
      km = routeTollKm;
      tollUseText = '利用する';
    }

    // 선택된 루트 거리 전역 저장
    if (km != null) {
      distance = km;
    }

    var distLabel = document.getElementById('routeSummaryDistance');
    var tollLabel = document.getElementById('routeSummaryTollUse');

    if (distLabel && km != null) {
      distLabel.textContent = km + 'km';
    }
    if (tollLabel && tollUseText) {
      tollLabel.textContent = tollUseText;
    }

    // IC/片道料金 블록 표시/비표시
    var tollBlock = document.getElementById('tollDetailBlock');
    if (tollBlock) {
      if (routeType === 'toll') {
        tollBlock.classList.remove('hidden');   // 유료도로 선택 시 표시
      } else {
        tollBlock.classList.add('hidden');      // 그 외에는 숨김
      }
    }
  }

  // 검색 버튼 클릭 시 지도/경로 표시
  function initMapAndRoute() {
    if (!homePos || !workPos) {
      alert('位置情報がまだ準備できていません。少し待ってから再度お試しください。');
      console.error('homePos/workPos 없음:', homePos, workPos);
      return;
    }

    // 검색結果1 (유료도로 미이용)
    drawRoute('mapNoToll', true, function (result, status) {
      if (!result) return;

      var route = result.routes[0];
      var km = calcTotalDistanceKm(route);

      routeNoTollKm = km;
      distance      = km;

      var distanceDiv = document.getElementById('distance');
      if (distanceDiv && km != null) {
        distanceDiv.textContent = '一般経路で距離：' + km + 'km';
      }

      hasRouteSearched = true;
      
      // 기본값은 검색結果1 선택
      var noTollRadio = document.getElementById('routeNoTollRadio');
      if (noTollRadio) {
        noTollRadio.checked = true;
        applyRouteDetails('noToll');
      }
    });

    // 검색結果2 (유료도로 이용)
    drawRoute('mapToll', false, function (result, status) {
      if (!result) {
        console.warn('유료도로 포함 루트를 찾지 못했습니다:', status);
        return;
      }
      var route = result.routes[0];
      var km = calcTotalDistanceKm(route);
      routeTollKm = km;
    });
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // 초기 바인딩
  window.addEventListener('load', function () {
    loadShainLocation();

    var searchBtn = document.getElementById('search');
    if (searchBtn) {
      searchBtn.addEventListener('click', function () {
        initMapAndRoute();
      });
    }

    var radioNoToll = document.getElementById('routeNoTollRadio');
    var radioToll   = document.getElementById('routeTollRadio');

    if (radioNoToll) {
      radioNoToll.addEventListener('change', function () {
        if (this.checked) {
          applyRouteDetails('noToll');
        }
      });
    }
    if (radioToll) {
      radioToll.addEventListener('change', function () {
        if (this.checked) {
          applyRouteDetails('toll');
        }
      });
    }
  });
  
  
  
  
  
  
  
  
  
  
  
  

  var hasRouteSearched = false;
  
  
  
  // 초기처리 + 일시저장
  document.addEventListener("DOMContentLoaded", function () {
    var form = document.getElementById("carRouteTempForm");
    if (!form) {
      return;
    }
    
    const shudanType = "<c:out value='${shudanType}' default='' />";
    const shudanNm   = "<c:out value='${shudanNm}' default='' />";
    
    var commuteJsonInput = form.querySelector('input[name="commuteJson"]');
    /* var actionUrlInput   = form.querySelector('input[name="actionUrl"]'); */
    var redirectUrlInput = form.querySelector('input[name="redirectUrl"]');

    // 버튼 (이미지) 찾기
    var hozonBtn = document.querySelector('img[alt="hozon_btn01"]');   // 일시저장
    var keiroBtn = document.querySelector('img[alt="keiro_btn02"]');   // 경로확정(지금은 같은 처리)

    
    
    /**
     * 저장 전에 체크할 공통 검증
     * - 검색결果2(유료도로) 선택 + 片道/往復 미선택 → 저장 불가
     */
     function validateBeforeSave() {
         // ===== 0) 공통으로 쓸 입력값들 먼저 읽기 =====
         var viaInput          = document.getElementById("viaPlace1Input");
         var viaPlace1         = viaInput ? viaInput.value.trim() : "";

         var viaPlaceRiyuInput = document.getElementById("viaPlaceRiyuInput");
         var viaPlaceRiyu      = viaPlaceRiyuInput ? viaPlaceRiyuInput.value.trim() : "";

         var yuryoRiyoRiyuInput = document.getElementById("yuryoRiyoRiyuInput");
         var yuryoRiyoRiyu      = yuryoRiyoRiyuInput ? yuryoRiyoRiyuInput.value.trim() : "";

         var betsuRouteRiyuInput = document.getElementById("betsuRouteRiyuInput");
         var betsuRouteRiyu      = betsuRouteRiyuInput ? betsuRouteRiyuInput.value.trim() : "";

         // 별도 루트 영역 입력들
         var resultDistanceInput = document.getElementById("resultDistanceInput");
         var icStartInput        = document.getElementById("icStartInput");
         var icEndInput          = document.getElementById("icEndInput");
         var tollPriceInput      = document.getElementById("tollPriceInput");

         var resultOfukuSelected = document.querySelector('input[name="resultOfukuKbn"]:checked');

         // ===== 1) 별도 루트 입력 여부 / 유료도로 판단 =====
         var betsuKm = null;
         if (resultDistanceInput && resultDistanceInput.value.trim() !== "") {
           var tmpKm = parseFloat(resultDistanceInput.value.trim());
           if (!isNaN(tmpKm)) {
             betsuKm = tmpKm;
           }
         }

         var yuryoIcS = (icStartInput && icStartInput.value.trim() !== "")
           ? icStartInput.value.trim() : null;
         var yuryoIcE = (icEndInput && icEndInput.value.trim() !== "")
           ? icEndInput.value.trim() : null;

         var yuryoKatamichiKin = null;
         if (tollPriceInput && tollPriceInput.value.trim() !== "") {
           var p = tollPriceInput.value.replace(/,/g, "").trim();
           var tmpPrice = parseInt(p, 10);
           if (!isNaN(tmpPrice)) {
             yuryoKatamichiKin = tmpPrice;
           }
         }

         // 별도 루트 영역에 뭔가 하나라도 들어있으면 “별도 루트 입력 있음”
         var hasBetsuRouteInput = !!(
           (betsuKm !== null) ||
           (yuryoIcS !== null) ||
           (yuryoIcE !== null) ||
           (yuryoKatamichiKin !== null) ||
           (betsuRouteRiyu !== "") ||
           (resultOfukuSelected != null)
         );

         // 별도 루트 쪽 IC/요금 있는 경우 → 유료도로 이용으로 판단
         var hasTollInfo = !!(
           (yuryoIcS !== null) ||
           (yuryoIcE !== null) ||
           (yuryoKatamichiKin !== null && yuryoKatamichiKin > 0)
         );

         // ===== 2) 검색결果1/2 선택값(유료도로 여부) =====
         var selectedRouteRadio = document.querySelector('input[name="routeSelect"]:checked');
         var routeType = selectedRouteRadio ? selectedRouteRadio.value : null; // "noToll" | "toll" | null

         // 기본 유료도로 여부 (검색결과 기준)
         var isTollByRoute = (routeType === "toll");

         // 최종적으로 "유료도로 이용"으로 볼지 여부
         var isTollUse = false;
         if (hasBetsuRouteInput) {
           // 별도 루트 영역이 활성화되어 있으면 그쪽 기준
           isTollUse = hasTollInfo;
         } else {
           // 아니면 검색결과1/2 라디오 기준
           isTollUse = isTollByRoute;
         }

         // ===== 3) 편도/왕복 선택 필수 (유료도로 이용 시) =====
         if (isTollUse) {
           // 기본 ofukuKbn (검색결과1/2 영역)
           var ofukuSelected = document.querySelector('input[name="ofukuKbn"]:checked');
           // 별도 루트쪽 resultOfukuKbn이 있으면 그것을 우선
           var ofukuForUse = resultOfukuSelected || ofukuSelected;

           if (!ofukuForUse) {
             alert('有料道路を利用する場合は、「片道利用」または「往復利用」を選択してください。');
             return false;
           }
         }

         // ===== 4) 유료도로 선택 시 유료도로이용이유 필수 =====
         // (설계서 ⑨-1)
         if (isTollUse && yuryoRiyoRiyu === "") {
           alert('有料道路を利用する場合は、「有料道路利用理由」を入力してください。');
           return false;
         }

         // ===== 5) 경유지 입력 시, 경유지입력이유 필수 =====
         // (설계서 ⑨-2)
         if (viaPlace1 !== "" && viaPlaceRiyu === "") {
           alert('経由地を入力した場合は、「経由地入力理由」を入力してください。');
           return false;
         }

         // ===== 6) 다른 경로 검색結果 입력 시, 다른루트理由 필수 =====
         // (설계서 ⑨-3)
         if (hasBetsuRouteInput && betsuRouteRiyu === "") {
           alert('別ルートの検索結果を入力した場合は、「別ルート理由」を入力してください。');
           return false;
         }

         // 그 외에는 설계서에 "일시저장은 그 외 체크는 하지 않는다" 고 되어있으므로 OK
         return true;
       }

    
    /**
     * 검색 결과(지도, 요약, 하단 입력란)를 모두 초기화
     */
    function resetRouteResults() {
      // 전역 플래그/거리 초기화
      hasRouteSearched = false;
      if (typeof distance      !== "undefined") distance      = null;
      if (typeof routeNoTollKm !== "undefined") routeNoTollKm = null;
      if (typeof routeTollKm   !== "undefined") routeTollKm   = null;

      // 상단 거리 표시
      var distanceDiv = document.getElementById('distance');
      if (distanceDiv) {
        distanceDiv.textContent = '一般経路で距離：';
      }

      // 요약 영역
      var distLabel = document.getElementById('routeSummaryDistance');
      var tollLabel = document.getElementById('routeSummaryTollUse');
      if (distLabel) distLabel.textContent = '-';
      if (tollLabel) tollLabel.textContent = '-';

      // 검색결果 라디오
      var r1 = document.getElementById('routeNoTollRadio');
      var r2 = document.getElementById('routeTollRadio');
      if (r1) r1.checked = false;
      if (r2) r2.checked = false;

      // 지도 영역 비우기
      var map1 = document.getElementById('mapNoToll');
      var map2 = document.getElementById('mapToll');
      if (map1) map1.innerHTML = '';
      if (map2) map2.innerHTML = '';

      // 하단 입력란 클리어
      [
        'resultCapturePathInput',
        'resultDistanceInput',
        'icStartInput',
        'icEndInput',
        'tollPriceInput',
        'yuryoRiyoRiyuInput',
        'viaPlaceRiyuInput',
        'betsuRouteRiyuInput'
      ].forEach(function (id) {
        var el = document.getElementById(id);
        if (el) el.value = '';
      });

      // 하단 片道/往復 라디오
   
      var rr1 = document.getElementById('resultOfukuOneWay');
      var rr2 = document.getElementById('resultOfukuRound');
      if (rr1) rr1.checked = false;
      if (rr2) rr2.checked = false;

      // 상단 IC / 片道料金 요약도 초기화
      var icStartLabel = document.getElementById('tollIcStartLabel');
      var icEndLabel   = document.getElementById('tollIcEndLabel');
      var priceLabel   = document.getElementById('tollPriceLabel');

      if (icStartLabel) icStartLabel.textContent = '';
      if (icEndLabel)   icEndLabel.textContent   = '';
      if (priceLabel)   priceLabel.textContent   = '';
    }
    
    function updateTollDetailSummaryFromInputs() {
        var icStartInput   = document.getElementById("icStartInput");
        var icEndInput     = document.getElementById("icEndInput");
        var tollPriceInput = document.getElementById("tollPriceInput");

        var icS = icStartInput ? icStartInput.value.trim() : "";
        var icE = icEndInput   ? icEndInput.value.trim()   : "";
        var priceStr = tollPriceInput ? tollPriceInput.value.trim() : "";

        var icStartLabel = document.getElementById('tollIcStartLabel');
        var icEndLabel   = document.getElementById('tollIcEndLabel');
        var priceLabel   = document.getElementById('tollPriceLabel');

        if (icStartLabel) icStartLabel.textContent = icS;
        if (icEndLabel)   icEndLabel.textContent   = icE;

        if (priceLabel) {
          if (priceStr) {
            priceLabel.textContent = priceStr + '円';
          } else {
            priceLabel.textContent = '';
          }
        }

        // 별도 루트에 IC/요금이 하나라도 있으면 상단 블럭은 무조건 표시
        var tollBlock = document.getElementById('tollDetailBlock');
        if (tollBlock) {
          if (icS || icE || priceStr) {
            tollBlock.classList.remove('hidden');
          }
        }
      }
    
    function updateBetsuRouteSummaryFromInputs() {
        var resultDistanceInput = document.getElementById("resultDistanceInput");
        var icStartInput        = document.getElementById("icStartInput");
        var icEndInput          = document.getElementById("icEndInput");
        var tollPriceInput      = document.getElementById("tollPriceInput");

        var distanceLabel = document.getElementById('routeSummaryDistance');
        var tollUseLabel  = document.getElementById('routeSummaryTollUse');

        // 1) 거리 문자열 읽기
        var resultDistanceStr = resultDistanceInput ? resultDistanceInput.value.trim() : "";
        var km = null;
        if (resultDistanceStr) {
          var tmpKm = parseFloat(resultDistanceStr);
          if (!isNaN(tmpKm)) {
            km = tmpKm;
          }
        }

        // 2) IC / 요금 문자열 읽기
        var icS      = icStartInput ? icStartInput.value.trim() : "";
        var icE      = icEndInput   ? icEndInput.value.trim()   : "";
        var priceStr = tollPriceInput ? tollPriceInput.value.trim() : "";

        // 3) “별도 루트에 뭔가라도 입력이 있는지” 판단
        var hasAnyManualInput = !!(resultDistanceStr || icS || icE || priceStr);
        if (hasAnyManualInput) {
          // 별도 루트도 “경로를 정한 상태”로 본다
          hasRouteSearched = true;
        }

        // 4) 상단 거리 요약 + 전역 distance 갱신
        if (km != null && distanceLabel) {
          distanceLabel.textContent = km + 'km';
          distance = km;   // JSON 생성 시 사용할 최종 거리
        }

        // 5) 유료도로 이용 여부 요약
        var hasTollInfo = !!(icS || icE || priceStr);
        if (tollUseLabel) {
          if (hasTollInfo) {
            tollUseLabel.textContent = '利用する';
          } else if (hasAnyManualInput) {
            // 별도 루트는 있지만 IC/요금 정보는 없는 경우 → 일단 "利用しない"로 표기
            tollUseLabel.textContent = '利用しない';
          } else {
            // 아무것도 없으면 초기표시
            tollUseLabel.textContent = '-';
          }
        }

        // 6) 별도 루트가 입력되면, 검색結果1/2 라디오는 해제
        if (hasAnyManualInput) {
          var r1 = document.getElementById('routeNoTollRadio');
          var r2 = document.getElementById('routeTollRadio');
          if (r1) r1.checked = false;
          if (r2) r2.checked = false;
        }

        // 7) 상단 IC / 片道料金 라벨 + 블록 표시 갱신
        updateTollDetailSummaryFromInputs();
      }
    
    function updateBetsuRouteSummary() {
        var resultDistanceInput = document.getElementById("resultDistanceInput");
        var icStartInput        = document.getElementById("icStartInput");
        var icEndInput          = document.getElementById("icEndInput");
        var tollPriceInput      = document.getElementById("tollPriceInput");

        // 1) 거리 → 상단 요약 + 전역 distance 갱신
        var km = null;
        if (resultDistanceInput && resultDistanceInput.value.trim() !== "") {
          var tmpKm = parseFloat(resultDistanceInput.value.trim());
          if (!isNaN(tmpKm)) {
            // 소수 1자리로 맞춰줌 (설계서 스타일에 맞게)
            km = tmpKm.toFixed(1);
          }
        }

        if (km != null) {
          distance = km;           // 전역 distance도 별도 루트 기준으로 설정
          hasRouteSearched = true; // "검색했다" 플래그도 켜줌

          var distLabel = document.getElementById('routeSummaryDistance');
          if (distLabel) {
            distLabel.textContent = km + 'km';
          }

          // 상단 텍스트 "一般経路で距離：" 도 별도 루트 기준으로 보여주고 싶으면:
          var distanceDiv = document.getElementById('distance');
          if (distanceDiv) {
            distanceDiv.textContent = '一般経路で距離：' + km + 'km';
          }
        }

        // 2) 유료도로 이용 여부 판단 (IC / 요금 기준)
        var icS = icStartInput ? icStartInput.value.trim() : "";
        var icE = icEndInput   ? icEndInput.value.trim()   : "";
        var priceStr = tollPriceInput ? tollPriceInput.value.trim() : "";
        var priceNum = null;

        if (priceStr) {
          var cleaned = priceStr.replace(/,/g, '');
          var tmpPrice = parseInt(cleaned, 10);
          if (!isNaN(tmpPrice)) {
            priceNum = tmpPrice;
          }
        }

        var hasTollInfo = !!(
          icS ||
          icE ||
          (priceNum != null && priceNum > 0)
        );

        var tollLabel = document.getElementById('routeSummaryTollUse');
        if (tollLabel) {
          // IC/요금이 하나라도 있으면 "利用する", 아니면 "利用しない"
          tollLabel.textContent = hasTollInfo ? '利用する' : '利用しない';
        }

        // 3) IC/片道料金 라벨 및 블록 표시/숨김은 기존 함수에 위임
        updateTollDetailSummaryFromInputs();

        // IC/요금이 전혀 없으면, 검색결과 기반으로만 블록 제어하고 싶으면
        // 여기서 굳이 숨기진 않고, hasTollInfo === false 라면
        // routeSummaryTollUse만 "利用しない"로 맞춰두는 정도로 마무리
      }

    /**
     * 住所／勤務地／経由地／片道・往復 변경 시 경고 + 결과 초기화/롤백
     *  - 지금은 경유지(viaPlace1) + 片道/往復(ofukuKbn)만 감시
     */
    (function setupRouteChangeGuard() {
      // 1) 경유지
      var viaInput = document.getElementById('viaPlace1Input');
      var prevViaValue = null;

      if (viaInput) {
        viaInput.addEventListener('focus', function () {
          prevViaValue = this.value;
        });

        viaInput.addEventListener('change', function () {
          // 아직 검색 전이면 그냥 통과
          if (!hasRouteSearched) return;

          var ok = window.confirm(
            '経由地を変更すると、検索結果を初期化します。よろしいですか？'
          );
          if (ok) {
            // 새 값은 유지, 아래 결과만 초기화
            resetRouteResults();
          } else {
            // 변경 취소 → 이전 값으로 되돌리기
            this.value = (prevViaValue != null) ? prevViaValue : '';
          }
        });
      }

      // 2) 片道／往復 (name="ofukuKbn")
      var prevOfukuValue = null;

      function getCurrentOfukuValue() {
        var checked = document.querySelector('input[name="ofukuKbn"]:checked');
        return checked ? checked.value : null;
      }

      ['ofukuOneWay', 'ofukuRound'].forEach(function (id) {
        var el = document.getElementById(id);
        if (!el) return;

        el.addEventListener('focus', function () {
          prevOfukuValue = getCurrentOfukuValue();
        });

        el.addEventListener('change', function () {
          if (!hasRouteSearched) return;

          var ok = window.confirm(
            '片道／往復を変更すると、検索結果を初期化します。よろしいですか？'
          );
          if (ok) {
            // 새 선택은 유지, 결과만 초기화
            resetRouteResults();
          } else {
            // 이전 선택으로 롤백
            var targetVal = prevOfukuValue;
            ['ofukuOneWay', 'ofukuRound'].forEach(function (id2) {
              var r = document.getElementById(id2);
              if (!r) return;
              r.checked = (r.value === targetVal);
            });
          }
        });
      });
    })();
    
    
    
    
    
    
    
    
    
    /**
     * 유료도로 특례 / 거리하한 체크 플래그 계산
     * - 인자:
     *   kmNumber: 편도 거리(km, Number 또는 null)
     *   yuryoRiyoKbn: "1"(유료 미이용) / "2"(유료 이용)
     *   yuryoOfukuKbn: "1"(편도) / "2"(왕복) / null
     *   isShataku: true=사택, false=사택 미이용
     *
     * - 반환:
     *   { yuryoTokurei: "0" | "1", kyoriKagenTokurei: "0" | "1" | "2" }
     *
     * 설계서 요약:
     *   kyoriKagenTokurei:
     *     0: 정상
     *     1: 사택 이용 편도 25km 이상 조건 미충족
     *     2: 사택 미이용 편도 20km 이상 조건 미충족
     *
     *   yuryoTokurei:
     *     0: 통상
     *     1: 유료도로 특례 (거리 요건 미충족 등)
     */
    function buildCarTollFlags(kmNumber, yuryoRiyoKbn, yuryoOfukuKbn, isShataku) {
      var result = {
        yuryoTokurei: "0",
        kyoriKagenTokurei: "0"
      };

      // 거리 정보 없거나, 유료도로 미이용이면 모두 0(정상/통상)
      if (kmNumber == null || isNaN(kmNumber) || yuryoRiyoKbn !== "2") {
        return result;
      }

      var oneWayKm = Number(kmNumber);

      if (isShataku) {
        // [사택 이용] 편도 25km 미만 → 특례 + 체크구분=1
        if (oneWayKm < 25) {
          result.yuryoTokurei = "1";
          result.kyoriKagenTokurei = "1";
        }
      } else {
        // [사택 미이용] 설계서:
        //  - 왕복 이용이면 편도 25km 이상 필요
        //  - 편도 이용이면 편도 20km 이상 필요
        if (yuryoOfukuKbn === "2") {
          if (oneWayKm < 25) {
            result.yuryoTokurei = "1";
            result.kyoriKagenTokurei = "2";
          }
        } else if (yuryoOfukuKbn === "1") {
          if (oneWayKm < 20) {
            result.yuryoTokurei = "1";
            result.kyoriKagenTokurei = "2";
          }
        }
      }

      return result;
    }

   

    /**
     * 자동차 경로 화면의 "현재 상태"를
     * ShinseiIcDataVO + ShinseiStartKeiroVO 구조로 JSON 생성
     */
    function buildCarInitialJson() {
      // JSP에서 내려온 주소/근무지 (초기처리 1,2번과 동일 데이터)
      var homeAddress = homeFullAddress || null;
        
      var workAddress = workFullAddress || null;
        

      // 1) 경유지 + 경유지 이유
      var viaInput = document.getElementById("viaPlace1Input");
      var viaPlace1 = viaInput ? viaInput.value.trim() : null;

      var viaPlaceRiyuInput = document.getElementById("viaPlaceRiyuInput");
      var viaPlaceRiyu = viaPlaceRiyuInput ? viaPlaceRiyuInput.value.trim() : null;

      // 2) 메인 루트(검색結果1/2) 선택 정보
      //    name="routeSelect" / value="noToll" | "toll"
      var selectedRouteRadio = document.querySelector('input[name="routeSelect"]:checked');
      var routeType = selectedRouteRadio ? selectedRouteRadio.value : null; // "noToll" or "toll"

      // 1: 유료도로 미이용, 2: 유료도로 이용
      var yuryoRiyoKbn = null;
      if (routeType === "noToll") {
        yuryoRiyoKbn = "1";
      } else if (routeType === "toll") {
        yuryoRiyoKbn = "2";
      }

      // 3) 메인 루트 편도/왕복 (상단 라디오)
      var ofukuSelected = document.querySelector('input[name="ofukuKbn"]:checked');
      var ofukuMain = ofukuSelected ? ofukuSelected.value : null; // "1" or "2"

      // 4) 유료도로 이용 이유
      var yuryoRiyoRiyuInput = document.getElementById("yuryoRiyoRiyuInput");
      var yuryoRiyoRiyu = yuryoRiyoRiyuInput ? yuryoRiyoRiyuInput.value.trim() : null;

      // 5) 별도 루트 입력 영역 값들
      var resultCapturePathInput = document.getElementById("resultCapturePathInput");
      var resultCapturePath      = resultCapturePathInput ? resultCapturePathInput.value.trim() : "";

      var resultDistanceEl   = document.getElementById("resultDistanceInput");
      var resultDistanceStr  = resultDistanceEl ? resultDistanceEl.value.trim() : "";
      var betsuKm            = resultDistanceStr ? parseFloat(resultDistanceStr) : null;

      var icStartInput       = document.getElementById("icStartInput");
      var icEndInput         = document.getElementById("icEndInput");
      var tollPriceInput     = document.getElementById("tollPriceInput");
      var betsuRouteRiyuInput= document.getElementById("betsuRouteRiyuInput");

      var yuryoIcS           = icStartInput ? icStartInput.value.trim() : null;
      var yuryoIcE           = icEndInput   ? icEndInput.value.trim() : null;
      var yuryoKatamichiKinStr = tollPriceInput ? tollPriceInput.value.trim() : "";
      var yuryoKatamichiKin = null;
      if (tollPriceInput) {
        var raw = tollPriceInput.value.trim();
        if (raw) {
          var cleaned = raw.replace(/,/g, '');
          var tmpPrice = parseInt(cleaned, 10);
          if (!isNaN(tmpPrice)) {
            yuryoKatamichiKin = tmpPrice;
          }
        }
      }

      var betsuRouteRiyu     = betsuRouteRiyuInput ? betsuRouteRiyuInput.value.trim() : null;

      // 별도 루트 입력이 있는지 여부
      var hasBetsuRouteInput =
        !!(resultCapturePath || resultDistanceStr || yuryoIcS || yuryoIcE || yuryoKatamichiKinStr || betsuRouteRiyu);

      var kekkaSelect = null;
      if (hasBetsuRouteInput) {
        kekkaSelect = "9";
      } else if (routeType === "noToll") {
        kekkaSelect = "1";
      } else if (routeType === "toll") {
        kekkaSelect = "2";
      }
      
      
   		//  별도 루트 쪽에 IC/요금이 하나라도 있으면 유료도로 이용으로 판단
      var hasTollInfoForBetsu =
        !!(yuryoIcS ||
           yuryoIcE ||
           (yuryoKatamichiKin != null && !isNaN(yuryoKatamichiKin) && yuryoKatamichiKin > 0));

      if (hasBetsuRouteInput) {
        // 별도 루트가 존재하면 그쪽 기준으로 유료도로 이용 여부를 세팅
        yuryoRiyoKbn = hasTollInfoForBetsu ? "2" : "1";  // "2": 이용, "1": 미이용
      }

      // 6) 별도 루트 편도/왕복 (하단 라디오)
      var resultOfukuSelected = document.querySelector('input[name="resultOfukuKbn"]:checked');
      var ofukuBetsu = resultOfukuSelected ? resultOfukuSelected.value : null; // "1" or "2"

      // 최종 편도/왕복 값 (별도 루트가 있으면 그것을 우선)
      var yuryoOfukuKbn = null;
      if (hasBetsuRouteInput && ofukuBetsu) {
        yuryoOfukuKbn = ofukuBetsu;
      } else if (!hasBetsuRouteInput && ofukuMain) {
        yuryoOfukuKbn = ofukuMain;
      }

      // 7) 거리(km) 결정
      var km = null;
      if (hasBetsuRouteInput && betsuKm != null && !isNaN(betsuKm)) {
        // 별도 루트 입력이 있으면 그 km를 우선 사용
        km = betsuKm;
      } else if (typeof distance !== "undefined" && distance != null && distance !== "") {
        // 그렇지 않으면 지도에서 선택된 루트 distance 사용
        km = parseFloat(distance);
      }
      var kmNumber = (km != null && !isNaN(km)) ? km : null;

      // ==== 1개월 금액 관련 내부 계산 ====
      //  - 편도요금, 월 지급 금액, 연료/유료도로 부분을 계산해서
      //    ShinseiStartKeiroVO의 기존 필드에 매핑한다.
      var carPayment = null;
      var tollOneWayFareForCalc = null;

      if (yuryoKatamichiKin != null && !isNaN(yuryoKatamichiKin) && yuryoKatamichiKin > 0) {
        tollOneWayFareForCalc = yuryoKatamichiKin;
      }

      if (kmNumber != null && !isNaN(kmNumber)) {
        carPayment = buildCarPaymentCalc(kmNumber, tollOneWayFareForCalc, yuryoOfukuKbn);
      }
      
   		// 1개월 금액(월 지급 금액) 공통 변수
      var monthlyAmount = null;
      if (carPayment && carPayment.monthlyTotalAmount != null && !isNaN(carPayment.monthlyTotalAmount)) {
        monthlyAmount = Number(carPayment.monthlyTotalAmount);
      }
      
   		// ==== 유료도로 특례 / 거리하한 체크 플래그 ==== 
      var tollFlags = buildCarTollFlags(kmNumber, yuryoRiyoKbn, yuryoOfukuKbn, CAR_IS_SHATAKU);
   
   
      const kbn        = shudanType || null;   
      const shudanNmLable  = shudanNm ||  null;    

      // ====== ShinseiKeiroVO (요약) ======
      var keiro = {
        tsukinShudan: kbn,           // 자동차
        shudanName:   shudanNmLable,
        startPlace:   homeAddress || null,
        endPlace:     workAddress || null,
        shinseiKm:    kmNumber,       // 최종 적용 거리
        tsuki:        monthlyAmount
      };

      // ====== ShinseiStartKeiroVO (상세) ======
      var startKeiro = {
        tsukinShudanKbn: "3",                  // 自動車
        startPlace:      homeAddress || null,
        endPlace:        workAddress || null,
        viaPlace1:       viaPlace1 || null,

        kekkaSelect:     kekkaSelect,
        kekkaUrl:        resultCapturePath || null,

        // 거리 / 유료도로 / 편도·왕복
        shinseiKm:       kmNumber,            // SHINSEI_KM
        yuryoRiyoKbn:    yuryoRiyoKbn,        // YURYO_RIYO_KBN (1: 미이용, 2: 이용)
        yuryoOfukuKbn:   yuryoOfukuKbn,       // YURYO_OFUKU_KBN (1:片道, 2:往復)

         //  설계서 ⑧-2: 유료도로 특례 / 거리하한 체크 결과
         yuryoTokurei:        tollFlags.yuryoTokurei,        // YURYO_TOKUREI
         kyoriKagenTokurei:   tollFlags.kyoriKagenTokurei,   // KYORI_KAGEN_TOKUREI
        
        // IC / 편도요금: 별도 루트 입력이 있으면 그 값을 사용
        yuryoIcS:          hasBetsuRouteInput ? (yuryoIcS || null) : null,  // YURYO_IC_S
        yuryoIcE:          hasBetsuRouteInput ? (yuryoIcE || null) : null,  // YURYO_IC_E
        yuryoKatamichiKin: hasBetsuRouteInput && yuryoKatamichiKin != null && !isNaN(yuryoKatamichiKin)
                            ? yuryoKatamichiKin                              // YURYO_KATAMICHI_KIN
                            : null,

        // ---- 1개월 금액 계산 결과를 기존 필드에 매핑 ----
        // 편도 요금(유료도로 제외)
        katamichiKin:   (carPayment && carPayment.oneWayBaseFare != null)
                        ? carPayment.oneWayBaseFare
                        : null,                              // KATAMICHI_KIN

        // 월 지급 금액(연료 + 유료도로)  → TSUKI_SHIKYU_KIN
        tsukiShikyuKin: monthlyAmount,

        // 연료 부분 월액 → GASORIN_DAI_MAE
        gasorinDaiMae:  (carPayment && carPayment.monthlyBaseAmount != null)
                        ? carPayment.monthlyBaseAmount
                        : null,

        // 유료도로 부분 월액 → YURYO_DAI_MAE
        yuryoDaiMae:    (carPayment && carPayment.monthlyTollAmount != null)
                        ? carPayment.monthlyTollAmount
                        : null,

        // 이유 항목
        yuryoRiyoRiyu:  yuryoRiyoRiyu || null,    // YURYO_RIYO_RIYU
        viaPlaceRiyu:   viaPlaceRiyu || null,     // VIA_PLACE_RIYU
        betsuRouteRiyu: betsuRouteRiyu || null    // BETSU_ROUTE_RIYU
      };

      // ====== 최종 ShinseiIcDataVO 구조 ======
      var data = {
        // 상단 메타 정보 (지금은 전부 null, 필요시 다른 화면에서 채움)
        kigyoCd:       null,
        shinseiNo:     null,
        shinseiYmd:    null,
        shinseiKbn:    null,
        shinchokuKbn:  null,

        // 주소 관련
        genAddress1:    null,
        genAddress2:    null,
        genAddress3:    null,
        newAddress1:    homeAddress || null,
        newAddress2:    null,
        newAddress3:    null,
        
        // 소속/근무지 관련
        genShozoku:    null,
        newShozoku:    null,
        genKinmuchi1:   null,
        genKinmuchi2:   null,
        genKinmuchi3:   null,
        newKinmuchi1:   workAddress || null,
        newKinmuchi2: 	null,
        newKinmuchi3: 	null,

        // 기타 공통 필드들
        riyu:          null,
        idoYmd:        null,
        itenYmd:       null,
        tennyuYmd:     null,
        riyoStartYmd:  null,
        ssmdsYmd:      null,
        moComment:     null,
        codeNm:        null,
        shinseiName:   null,

        // 통근수단 요약 (ShinseiKeiroVO)
        keiro: keiro,

        // 자동차 상세 경로 (ShinseiStartKeiroVO)
        startKeiro: startKeiro
      };

      return JSON.stringify(data);
    }

	

    // [일시저장] 버튼
    if (hozonBtn) {
      hozonBtn.addEventListener("click", function () {
        if (!validateBeforeSave()) {
          return;
        }
        var json = buildCarInitialJson();
        if (!json) {
          return;
        }
        commuteJsonInput.value = json;
        
     	
        
        console.log("=== [HOZON] commuteJson (raw string) ===");
        console.log(json);
        try {
          console.log("=== [HOZON] commuteJson (parsed object) ===");
          console.log(JSON.parse(json));
        } catch (e) {
          console.error("JSON parse error (HOZON):", e);
        }
        console.log(JSON.parse(
        		  document.querySelector('#carRouteTempForm input[name="commuteJson"]').value
        		));
        
        
   
        redirectUrlInput.value = "";
        form.submit();
      });
    }

    // [경로 확정] 버튼
    if (keiroBtn) {
      keiroBtn.addEventListener("click", function () {
        if (!validateBeforeSave()) {
          return;
        }
        var json = buildCarInitialJson();
        if (!json) {
          return;
        }
        
     // 경로확정 전 1ヶ月金額(월 지급액) 0원 체크
        // 경로확정 전 1ヶ月金額(월 지급액) 0원 체크
    try {
      var obj = JSON.parse(json);
      var startKeiro = obj && obj.startKeiro;
      var tsukiShikyuKin    = startKeiro ? startKeiro.tsukiShikyuKin    : null;
      var yuryoTokurei      = startKeiro ? startKeiro.yuryoTokurei      : null;
      var kyoriKagenTokurei = startKeiro ? startKeiro.kyoriKagenTokurei : null;

      // 숫자로 해석
      var monthly = (tsukiShikyuKin != null && tsukiShikyuKin !== "")
          ? Number(tsukiShikyuKin)
          : 0;

      // 거리 하한 특례인지 여부:
      //  - buildCarTollFlags()에서 유료도로 + 거리요건 미충족일 때
      //    yuryoTokurei = "1", kyoriKagenTokurei = "1" or "2" 로 세팅해 둠
      var isDistanceLowerLimitSpecial =
        (yuryoTokurei === "1" &&
         kyoriKagenTokurei != null &&
         kyoriKagenTokurei !== "" &&
         kyoriKagenTokurei !== "0");

      // ▶ 월 지급액이 0인데, "거리 하한 특례"도 아닌 경우만 에러로 막기
      if (monthly <= 0 && !isDistanceLowerLimitSpecial) {
        alert('1ヶ月金額が0円のため、経路を確定できません。');
        return;
      }

      // ※ 거리 하한 특례(isDistanceLowerLimitSpecial === true)인 경우에는
      //    0엔이어도 그대로 경로 확정을 허용한다.
      //    (필요하면 여기서 안내 문구를 추가해도 됨)
      //    예:
      //    if (monthly <= 0 && isDistanceLowerLimitSpecial) {
      //      alert('距離下限未満の有料道路特例のため、1ヶ月金額は0円で登録されます。');
      //    }

    } catch (e) {
      console.error("경로확정 전 1ヶ月金額 체크 중 JSON 파싱 에러:", e);
      // 파싱 에러 시에는 일단 막아두는 쪽이 안전
      alert('経路情報の内部データ取得に失敗しました。再度やり直してください。');
      return;
    }
        
        
        commuteJsonInput.value = json;
        
        console.log("=== [KEIRO] commuteJson (raw string) ===");
        console.log(json);
        try {
          console.log("=== [KEIRO] commuteJson (parsed object) ===");
          console.log(JSON.parse(json));
        } catch (e) {
          console.error("JSON parse error (KEIRO):", e);
        }
        
        
        const nextPath = "<c:url value='/idoconfirm/keiroInfo'/>";
        
        
        //나중에 URL넣어주기
        redirectUrlInput.value = nextPath;
        form.submit();
      });
    }
    
    var betsuBtn = document.querySelector('img[alt="root_btn01"]');
    if (betsuBtn) {
      betsuBtn.addEventListener('click', function () {
        var block = document.getElementById('betsuRouteBlock');
        if (!block) return;

        // 처음에는 hidden 되어 있다가, 버튼 누르면 표시
        block.classList.remove('hidden');

        // ※ 나중에 "1ヶ月金額" 입력란이 생기면,
        //    여기에서 그 값을 클리어하는 로직을 추가하면 됨.
        //    예:
        // var monthlyAmtInput = document.getElementById('monthlyAmountInput');
        // if (monthlyAmtInput) monthlyAmtInput.value = '';
      });
    }
    
 		// ---- 別ルート入力 ⇔ 上部IC/片道料金 요약 연동 ----
    (function bindBetsuRouteSummary() {
      var resultDistanceInput = document.getElementById("resultDistanceInput");
      var icStartInput        = document.getElementById("icStartInput");
      var icEndInput          = document.getElementById("icEndInput");
      var tollPriceInput      = document.getElementById("tollPriceInput");

      [resultDistanceInput, icStartInput, icEndInput, tollPriceInput].forEach(function (el) {
        if (!el) return;
        el.addEventListener('input', function () {
          updateBetsuRouteSummaryFromInputs();
        });
      });
    })();
 		
 		
    // ---- 서버에서 내려온 startKeiro 값으로 화면 초기 상태 복원 ----
    function setupInitialFromStartKeiro() {
      // JSP에서 내려오는 값들
      var kekkaSelect   = "${startKeiro.kekkaSelect}";    // "1","2","9" 등
      var kmStr         = "${startKeiro.shinseiKm}";
      var yuryoRiyoRiyu = "${startKeiro.yuryoRiyoRiyu}";
      var viaPlaceRiyu  = "${startKeiro.viaPlaceRiyu}";
      var betsuRouteRiyu = "${startKeiro.betsuRouteRiyu}";
      var yuryoOfukuKbn = "${startKeiro.yuryoOfukuKbn}";  // "1","2" 중 하나

      var yuryoIcS      = "${startKeiro.yuryoIcS}";
      var yuryoIcE      = "${startKeiro.yuryoIcE}";
      var yuryoKatamichiKinStr = "${startKeiro.yuryoKatamichiKin}";
      
      var kekkaUrl      = "${startKeiro.kekkaUrl}";

      // 값이 하나도 없으면(신규 진입) 그냥 리턴
      if (!kekkaSelect && !kmStr && !yuryoOfukuKbn && !yuryoIcS && !yuryoIcE && !yuryoKatamichiKinStr) {
        return;
      }

      // km 파싱
      var km = null;
      if (kmStr && kmStr !== "") {
        var tmp = parseFloat(kmStr);
        if (!isNaN(tmp)) {
          km = tmp;
        }
      }

      // --- 공통 입력 복원 (이유 계열) ---
      var yuryoRiyoRiyuInput = document.getElementById("yuryoRiyoRiyuInput");
      if (yuryoRiyoRiyuInput && yuryoRiyoRiyu) {
        yuryoRiyoRiyuInput.value = yuryoRiyoRiyu;
      }

      var viaPlaceRiyuInput = document.getElementById("viaPlaceRiyuInput");
      if (viaPlaceRiyuInput && viaPlaceRiyu) {
        viaPlaceRiyuInput.value = viaPlaceRiyu;
      }

      var betsuRouteRiyuInput = document.getElementById("betsuRouteRiyuInput");
      if (betsuRouteRiyuInput && betsuRouteRiyu) {
        betsuRouteRiyuInput.value = betsuRouteRiyu;
      }

      // --- 편도/왕복 상단 라디오 (ofukuKbn) ---
      if (yuryoOfukuKbn === "1") {
        var r1 = document.getElementById("ofukuOneWay");
        if (r1) r1.checked = true;
      } else if (yuryoOfukuKbn === "2") {
        var r2 = document.getElementById("ofukuRound");
        if (r2) r2.checked = true;
      }

      // --- 거리 공통 표시(상단 거리 라벨 + 텍스트) ---
      if (km != null && !isNaN(km)) {
        distance = km;             // 전역 distance 갱신
        hasRouteSearched = true;   // 이미 “검색된 상태”로 취급

        var distLabel = document.getElementById("routeSummaryDistance");
        if (distLabel) {
          distLabel.textContent = km + "km";
        }

        var distanceDiv = document.getElementById("distance");
        if (distanceDiv) {
          distanceDiv.textContent = "一般経路で距離：" + km + "km";
        }
      }

      // --- 패턴별 분기: 검색결과1/2 vs 별도ルート ---
      if (kekkaSelect === "9") {
        // ===== 별도ルート 선택되어 저장된 경우 =====
        var block = document.getElementById("betsuRouteBlock");
        if (block) {
          block.classList.remove("hidden");
        }
        
     	// 검색결과 화면 경로(resultCapturePathInput) 복원
        var resultCapturePathInput = document.getElementById("resultCapturePathInput");
        if (resultCapturePathInput && kekkaUrl) {
          resultCapturePathInput.value = kekkaUrl;
        }

        // 별도ルート 거리 입력에 km 채워넣기
        var resultDistanceInput = document.getElementById("resultDistanceInput");
        if (resultDistanceInput && km != null && !isNaN(km)) {
          resultDistanceInput.value = km;
        }

        // IC / 요금 입력 복원
        var icStartInput = document.getElementById("icStartInput");
        var icEndInput   = document.getElementById("icEndInput");
        var tollPriceInput = document.getElementById("tollPriceInput");

        if (icStartInput && yuryoIcS) {
          icStartInput.value = yuryoIcS;
        }
        if (icEndInput && yuryoIcE) {
          icEndInput.value = yuryoIcE;
        }
        if (tollPriceInput && yuryoKatamichiKinStr && yuryoKatamichiKinStr !== "0") {
          tollPriceInput.value = yuryoKatamichiKinStr;
        }

        // 별도ルート 편도/왕복 라디오(resultOfukuKbn)도 yuryoOfukuKbn 기준으로 맞춰줌
        if (yuryoOfukuKbn === "1") {
          var rr1 = document.getElementById("resultOfukuOneWay");
          if (rr1) rr1.checked = true;
        } else if (yuryoOfukuKbn === "2") {
          var rr2 = document.getElementById("resultOfukuRound");
          if (rr2) rr2.checked = true;
        }

        // 상단 요약(距離/有料道路/IC/片道料金)까지 한 번에 동기화
        updateBetsuRouteSummaryFromInputs();

      } else if (kekkaSelect === "1" || kekkaSelect === "2") {
        // ===== 검색結果1 또는 2를 쓴 경우 =====
        var tollUseLabel = document.getElementById("routeSummaryTollUse");
        var tollBlock = document.getElementById("tollDetailBlock");

        if (kekkaSelect === "1") {
          // 검색結果1(유료도로 미이용)
          var radioNoToll = document.getElementById("routeNoTollRadio");
          if (radioNoToll) {
            radioNoToll.checked = true;
          }
          if (tollUseLabel) {
            tollUseLabel.textContent = "利用しない";
          }
          if (tollBlock) {
            tollBlock.classList.add("hidden");
          }
        } else if (kekkaSelect === "2") {
          // 검색結果2(유료도로 이용)
          var radioToll = document.getElementById("routeTollRadio");
          if (radioToll) {
            radioToll.checked = true;
          }
          if (tollUseLabel) {
            tollUseLabel.textContent = "利用する";
          }
          if (tollBlock) {
            tollBlock.classList.remove("hidden");
          }

          // 만약 저장된 IC/요금이 있다면, 상단 박스 라벨도 채워줌
          var icStartLabel = document.getElementById("tollIcStartLabel");
          var icEndLabel   = document.getElementById("tollIcEndLabel");
          var priceLabel   = document.getElementById("tollPriceLabel");

          if (icStartLabel && yuryoIcS) icStartLabel.textContent = yuryoIcS;
          if (icEndLabel && yuryoIcE)   icEndLabel.textContent   = yuryoIcE;
          if (priceLabel && yuryoKatamichiKinStr && yuryoKatamichiKinStr !== "0") {
            priceLabel.textContent = yuryoKatamichiKinStr + "円";
          }
        }
      }
    }
    
    (function initFromServer() {
        try {
          setupInitialFromStartKeiro();
        } catch (e) {
          console.error('setupInitialFromStartKeiro error:', e);
        }
      })();
    
  });
   </script>
 
</body>
</html>




