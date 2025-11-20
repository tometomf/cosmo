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

#content1>div>div:first-child {
   
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

#content2>div>div:first-child {
   
}


#content2>div>div:last-child {
   flex: 1;
}

#content2 img {
   cursor: pointer;
   /* display: block; */
}

.transport-wrapper {
   display: flex;
   justify-content: center; align-items : center;
   width: 100%;
   min-width: 500px;
   align-items: center;
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
   width: 100%; background-color : #595860; color : #fff; font-weight :
   bold; display : flex; align-items : center; padding : 8px 12px;
   font-size : 14px; height : 31px;
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
   width: 100%; height : 275px;
   overflow: hidden;
   height: 275px;
}

.result-box>div>img {
   width: 100%;
   height: 100%;
   object-fit: cover; /* 비율 맞추며 꽉 채움 */
   display: block;
}
</style>

<body>
   <div class="layout">
      <%@ include file="/WEB-INF/views/common/header.jsp"%>
      <div class="main">
         <div class="main_Content">
            <!-- 진척도 예제 -->
            <div class = "flow">
               <div class = "flow_others">勤務地入力</div>
               <div class = "flow_others">住所入力</div>
               <div class = "flow_current">経路入力</div>
               <div class = "flow_others">付随書類入力</div>
               <div class = "flow_others">確認</div>
               <div class = "flow_others">完了</div>
            </div>
            
            <div class="subtitle">【経路③】　経路詳細　入力</div>
            
            <div class="transport-wrapper">
               <div class="transport">手段：自動車</div>
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
                  <div class="form_Normal"><p>${addr.newAddress1}${addr.newAddress2}${addr.newAddress3}</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>勤務地</p></div>
                  <div class="form_Normal"><p>${kinmuAddr.newKinmuAddress1}${kinmuAddr.newKinmuAddress2}${kinmuAddr.newKinmuAddress3}</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>経由地</p></div>
                  <div style="padding:1rem;">
                     <input style="width:100%;" type="text" id="viaPlace1Input" name="viaPlace1" value="${startKeiro.viaPlace1}"/>
                  </div>
               </div>
            </div>
            
            

            <div class="content1" id="content1">
               <div>
                  <div>上記の住所から勤務地までを検索します。</div>
                  <div><img src="/resources/img/tn/search_btn01.gif" id="search"></div>            
               </div>
               
            </div>
            
            
            
            <div class="text">一般経路で距離：　22km</div>
            
            
            <div class="result-box">
            <div>
               <input type="radio" name="result1" value="1" />検索結果 1
            </div>
            <div class="text">有料道路を利用しないルート</div>
            <div id="map">
               
            </div>
            </div>
            <div class="result-box">
            <div>
               <input type="radio" name="result1" value="1" />検索結果 2
            </div>
            <div class="text">有料道路を利用するルート</div>
            <div id="map">
               
            </div>
         </div>
         </div>
            <!--　検索結果１ -->
            <!-- 検索結果のimg1 -->
            <!--　検索結果2 -->
            <!-- 検索結果のimg2 -->
            
            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>距離</p></div>
                  <div class="form_Normal"><p>30km</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路</p></div>
                  <div class="form_Normal"><p>利用する</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路無料</p><p>片道／往復</p></div>
                  <div>
                     <input type="radio">片道利用　 <input type="radio">往復利用 
                  </div>
               </div>
            </div>
            
            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路IC 乗り口</p></div>
                  <div class="form_Normal"><p>下作延IC</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路IC  降り口</p></div>
                  <div class="form_Normal"><p>用賀IC</p></div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路    片道料金</p></div>
                  <div><p>600円</p></div>
               </div>
            </div>
            
            
            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column1"><p>有料道路利用理由</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:100%;" type>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column1"><p>経由地入力理由</p></div>
                  <div style="padding:1rem;">
                     <input style="width:100%;" type>
                  </div>
               </div>
               
            </div>
            
            <div class="text">
            <div>原則、当画面で検索された推奨ルートで申請してください。</div>
            <div>ただし、理由があって別ルートで申請した場合、このwebサイトで検索し、</div>
            <div>検索結果画面のアップロード、および必要事項を入力してください。</div>
            <br>
            <div>別ルート検索はこちらから　〈外部サイトが開きます〉　<a href=http://www.navitime.co.jp/>http://www.navitime.co.jp</a></div>
            </div>
            <br>
            
            <div id="content2">
               <img src="/resources/img/root_btn01.gif" alt=root_btn01>
            </div>
            
            
            
            <div class="table">
               <div class="form_Text1">
                  <div class="form_Column2"><p>検索結果画面</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:25%;" type> &nbsp;<button>参照</button>&nbsp;<button>アップロード</button>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>距離</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:20%;" type> km
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路IC　乗り口</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:50%;" type>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路IC　降り口</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:50%;" type>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路片道料金</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:20%;" type> 円
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>別ルート　理由</p></div>
                  <div class="form_Normal" style="padding:1rem;">
                     <input style="width:100%;" type>
                  </div>
               </div>
               <div class="form_Text1">
                  <div class="form_Column2"><p>有料道路無料</p><p>片道／往復</p></div>
                  <div>
                     <input type="radio">片道利用　 <input type="radio">往復利用 
                  </div>
               </div>
            </div>
            
            
            
            <div id="content2">
               <img src="/resources/img/back_btn01.gif" alt=back_btn01 id="btnBack">
               <img src="/resources/img/keiro_btn02.gif" alt=keiro_btn02>
               <img src="/resources/img/hozon_btn01.gif" alt=hozon_btn01>
            </div>
         </div>
         
         <!-- 일시저장용 폼 (자동차 경로용) -->
         <form id="carRouteTempForm" method="post" action="<c:url value='/keiroinput/tempSave'/>">
            <!-- ShinseiIcDataVO (+ keiro) JSON 문자열 -->
          <input type="hidden" name="commuteJson" value="">

          <!-- 이 화면에서의 action 이름 (ICHIJI_HOZON.ACTION_NM) -->
          <input type="hidden" name="actionUrl" value="TSUKIN_SHUDAN_TEMP_SAVE">

          <!-- 저장 후 이동할 URL (비워두면 /shinsei/ichiji?hozonUid=... 로 이동) -->
          <input type="hidden" name="redirectUrl" value="">
         </form>
         
         
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
      </div>
   
   
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

    // 초기처리 + 일시저장
    document.addEventListener("DOMContentLoaded", function () {
        var form = document.getElementById("carRouteTempForm");
        if (!form) {
            return;
        }

        var commuteJsonInput = form.querySelector('input[name="commuteJson"]');
        var actionUrlInput   = form.querySelector('input[name="actionUrl"]');
        var redirectUrlInput = form.querySelector('input[name="redirectUrl"]');

        // 버튼 (이미지) 찾기
        var hozonBtn = document.querySelector('img[alt="hozon_btn01"]');   // 일시저장
        var keiroBtn = document.querySelector('img[alt="keiro_btn02"]');   // 경로확정(지금은 같은 처리)

        /**
         * 자동차 경로 화면의 "초기 상태"를
         * ShinseiIcDataVO + ShinseiStartKeiroVO 구조로 JSON 생성
         */
        function buildCarInitialJson() {
            // JSP에서 내려온 주소/근무지 (초기처리 1,2번과 동일 데이터)
            var homeAddress =
                "${addr.newAddress1}${addr.newAddress2}${addr.newAddress3}";
            var workAddress =
                "${kinmuAddr.newKinmuAddress1}${kinmuAddr.newKinmuAddress2}${kinmuAddr.newKinmuAddress3}";

            // 경유지 입력값 (id는 JSP 쪽 input에 맞춰줘야 함)
            var viaInput   = document.getElementById("viaPlace1Input");
            var viaPlace1  = viaInput ? viaInput.value.trim() : null;

            // ====== ShinseiKeiroVO에 해당하는 간단한 경로 정보 ======
            // UnrecognizedProperty 피하려고, VO에 존재하는 필드만 사용
            var keiro = {
                tsukinShudan: "3",           // 자동차
                shudanName:   "自動車",
                startPlace:   homeAddress || null,
                endPlace:     workAddress || null,
                shinseiKm:    null           // 나중에 거리 계산하면 채움
                // allowed fields (참고): kigyoCd, keiroSeq, tsuki, katamichi,
                // jitsu, tsukinShudan, endPlace, shinseiNo, shinseiKm,
                // startPlace, shudanName
            };

            // ====== ShinseiStartKeiroVO 에 해당하는 상세 자동차 경로 ======
            // 여기에 유료도로/IC/경유지/편도·왕복 등을 채워나갈 예정
            var startKeiro = {
                tsukinShudanKbn: "3",            // 自動車
                startPlace:      homeAddress || null,
                endPlace:        workAddress || null,
                viaPlace1:       viaPlace1 || null,

                // 아직 검색 전이니 전부 null (나중에 API 결과로 채움)
                shinseiKm:         null,        // BigDecimal
                yuryoRiyoKbn:      null,        // 1: 미이용, 2: 이용
                yuryoOfukuKbn:     null,        // 1: 편도, 2: 왕복
                yuryoIcS:          null,        // IC 입구
                yuryoIcE:          null,        // IC 출구
                yuryoKatamichiKin: null,        // 편도 요금
                yuryoRiyoRiyu:     null,        // 유료도로 이용 이유
                viaPlaceRiyu:      null,        // 경유지 입력 이유
                betsuRouteRiyu:    null         // 다른 루트 이유
                // 필요하면 나중에 나머지 필드들도 점점 추가하면 됨
            };

            // ====== 최종 ShinseiIcDataVO 구조 ======
            var data = {
                // 상단 메타 정보 (지금은 전부 null, 필요시 채움)
                kigyoCd:       null,
                shinseiNo:     null,
                shinseiYmd:    null,
                shinseiKbn:    null,
                shinchokuKbn:  null,

                // 주소 관련 (초기처리 1번)
                genAddress:    null,
                newAddress:    homeAddress || null,

                // 소속/근무지 관련 (초기처리 2번)
                genShozoku:    null,
                newShozoku:    null,
                genKinmuchi:   null,
                newKinmuchi:   workAddress || null,

                // 기타 공통 필드들 (현재는 전부 null)
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

        // 1) [일시저장] 버튼: 초기정보만 ICHIJI_HOZON에 저장하고 일시저장 화면으로 이동
        if (hozonBtn) {
            hozonBtn.addEventListener("click", function () {
                var json = buildCarInitialJson();
                if (!json) {
                    return;
                }

                commuteJsonInput.value = json;
                
                redirectUrlInput.value = ""; // 비우면 /shinsei/ichiji?hozonUid=... 로 이동

                form.submit();
            });
        }

        // 2) [경로 확정(keiro_btn02)] 버튼:
        //    지금은 아직 경로 계산 안 하니까 "초기정보 + 일시저장"만 수행
        //    나중에 다음 화면으로 이동할 URL 정해지면 redirectUrl 만 바꾸면 됨
        if (keiroBtn) {
            keiroBtn.addEventListener("click", function () {
                var json = buildCarInitialJson();
                if (!json) {
                    return;
                }

                commuteJsonInput.value = json;
                
                // TODO: 경로확정 후 이동할 URL이 정해지면 여기 세팅
                redirectUrlInput.value = "";

                form.submit();
            });
        }
    });
</script>

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
      travelMode: google.maps.TravelMode.DRIVING
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
</script>
</body>

</html>