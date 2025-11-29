<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 유지희 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜経路入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>

/* ===== 공통 레이아웃 ===== */

.route-actions a {
    display: inline-flex;
    align-items: center;
    gap: 4px;
}

.route-actions img {
    width: 15px;
    height: 15px;
    vertical-align: middle;
}

.page-width {
    width: 950px;
    margin: 0 auto;
}

.hint-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin: 8px 0 10px;
}

.hint-text {
    color: #333;
    line-height: 1.9;
    flex: 1;
}

.map-btn img {
    display: block;
}

.route-section {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ccc;
    border-top: 3px solid #228B22;
    padding: 20px 10px 18px;
    margin-top: 8px;
}

.route-section .content_Form1 {
    width: 100%;
    margin: 0 0 8px 0;
}

.route-section .shudan-table .form_Column {
    background-color: #4a4a4a !important;
    color: #fff;
}

.route-head {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

.route-label {
    position: relative;
    top: -23px;
    margin-left: -10px;
    margin-top: 3px;
    display: inline-block;
    width: 106px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 15px;
    color: #1f6b1f;
    background: url("<c:url value='/resources/img/tn/bg_keirotitle.gif'/>") no-repeat center top;
    background-size: 100% 100%;
    border: 1px solid #64c764;
    border-top-color: #46b946;
    border-left: none;
    border-radius: 0 0 6px 0;
}

.route-add {
    position: relative;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 13px;
    color: #7d3fb2;
    cursor: pointer;
}

.route-add img {
    width: 14px;
    height: 14px;
}

.route-add:hover {
    text-decoration: underline;
}

.route-actions {
    margin-top: -18px;
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
}

.route-actions a {
    color: #7d3fb2;
    text-decoration: none;
}

.route-actions a:hover {
    text-decoration: underline;
}

#form_Text1 {
    display: grid;
    grid-template-columns: 120px 1fr;
}

.route-section .form_Column {
    padding: 8px 10px;
    font-size: 13px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.route-section .form_Normal {
    padding: 8px 15px;
    font-size: 13px;
}

/* ===== 전철 아님(버스/도보/자전거 등) ===== */

.keiro-container {
    display: flex;
    flex-direction: column;
    gap: 0;
}

.keiro-item {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 6px 0;
}

.keiro-item img {
    width: 20px;
    height: 20px;
}

/* ===== 전철용 레이아웃 ===== */

.form_Keiro {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 0;
}

/* 역이 표시되는 줄 (발/경유/도착역 줄) */
.form_Keiro .form_Normal2 {
    display: flex;
    align-items: center;
    width: 100%;
    padding: 5px 0 5px 8px;
    background-color: #ECFBEA;
    box-sizing: border-box;
}

/* 노선 줄 (세로선 + 노선명) */
.form_Keiro .form_Normal3 {
    display: flex;
    align-items: center;
    width: 100%;
    padding: 5px 0 5px 5px;
    box-sizing: border-box;
}

/* 노선 줄 전용 세로줄 위치 및 간격 */
.keiro-line-block {
    border-left: 5px solid #999;
    margin-left: 50px;
    padding-left: 50px;
}

</style>

</head>

<body>
<div class="layout">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main">
		<div class="main_title">
			<div class="flow">
				<div class="flow_others">勤務地入力</div>
				<div class="flow_others">住所入力</div>
				<div class="flow_others">申請理由入力</div>
				<div class="flow_current">経路入力</div>
				<div class="flow_others">確認</div>
				<div class="flow_others">完了</div>
			</div>
			<div class="subtitle">日割　通勤経路情報</div>
		</div>

		<%
		String[] maruDigits = {"", "①","②","③","④","⑤","⑥","⑦","⑧","⑨"};
		pageContext.setAttribute("maruDigits", maruDigits);
		%>

		<div class="page-width">

			<c:if test="${not empty errorMsg}">
				<div style="color:#d00; margin:4px 0 6px; font-size:12px;">
					<c:out value="${errorMsg}"/>
				</div>
			</c:if>

			<div class="hint-row">
		
				<div class="hint-text">
					自転車・徒歩・自転車は、住所から勤務地まで、その手段のみを利用する場合に限ります。<br><br>
					電車・バスは、複数手段の利用（乗り継ぎ）が可能です。<br>
					複数手段を利用する場合、手段ごとに線路を分割して登録してください。
				</div>

			<div class="map-btn">
    <br>
    <a href="#" onclick="showMapInside(); return false;">
        <img src="/resources/img/map_mini_btn01.gif" alt="地図を確認">
    </a>
</div>


			</div>
		<!-- ===== 지도 표시 영역 ===== -->
<div id="mapArea"
     style="width:100%; height:450px; display:none; margin:10px 0; border:1px solid #ccc;">
</div>
		
			<br>

		<form action="<c:url value='/hiwariKinmuchi/keiro'/>" method="post">

    <c:url var="keiroInputUrl" value="/hiwariKinmuchi/keiroInput" />

    <%-- 1) keiroList가 있을 때만 DB 경로들 출력 --%>
    <c:if test="${not empty keiroList}">

        <c:forEach var="row" items="${keiroList}" varStatus="st">

            <c:url var="editUrl" value="/hiwariKinmuchi/keiroInput">
                <c:param name="keiroSeq" value="${row.keiroSeq}"/>
            </c:url>
            <c:url var="deleteUrl" value="/hiwariKinmuchi/keiro/delete">
                <c:param name="keiroSeq" value="${row.keiroSeq}"/>
            </c:url>

            <div class="route-section">

                <div class="route-head">
                    <span class="route-label">経路${maruDigits[st.index + 1]}</span>

                    <div class="route-actions">
                        <a href="${editUrl}" class="route-edit-link">
                            <img src="/resources/img/pencil_icon.gif"> 変更する
                        </a>
                        <span>｜</span>
                        <a href="${deleteUrl}" class="route-delete-link"
                           onclick="return confirm('この経路を削除しますか？');">
                            <img src="/resources/img/clear_icon.gif"> 削除する
                        </a>
                    </div>
                </div>

                <div class="content_Form1 shudan-table">
                    <div class="form_Text1" id="form_Text1">
                        <div class="form_Column">通勤手段</div>
                        <div class="form_Normal">
                            <c:out value="${row.tsukinShudanNm}"/>
                        </div>
                    </div>
                </div>

                <div class="content_Form1">
                    <div class="form_Text1" id="form_Text1">
                        <div class="form_Column">経路</div>
                        <div class="form_Normal">


                            <%-- ★ 전철 / 그 외 분기 --%>
                            <c:choose>
<c:when test="${row.tsukinShudanKbn == 1}">
    <div class="form_Keiro">

        <%-- ① 출발역 줄: 아이콘 + 출발역 --%>
        <c:if test="${not empty row.startPlace}">
            <div class="form_Normal2">
                <img src="<c:url value='/resources/img/tn/icon_keiro_01.gif'/>" alt="発">
                <c:out value="${row.startPlace}"/>
            </div>
        </c:if>

        <%-- ② 출발역 아래 줄: 노선1 (東急田園都市線 같은 것) --%>
        <c:if test="${not empty row.viaPlace1}">
            <div class="form_Normal3 keiro-line-block">
                <c:out value="${row.viaPlace1}"/>
            </div>
        </c:if>

        <%-- ③ 중간역1 줄 (渋谷駅 같은 것) --%>
    <c:if test="${not empty row.viaPlace2}">
    <div class="form_Normal2" style="padding-left: 25px;">
        <c:out value="${row.viaPlace2}"/>
    </div>
</c:if>
        <%-- ④ 중간역1 아래 줄: 노선2 (東京メトロ半蔵門線 등) --%>
        <c:if test="${not empty row.viaPlace3}">
            <div class="form_Normal3 keiro-line-block">
                <c:out value="${row.viaPlace3}"/>
            </div>
        </c:if>

        <%-- ⑤ 중간역2 줄 --%>
       <c:if test="${not empty row.viaPlace4}">
    <div class="form_Normal2" style="padding-left: 25px;">
        <c:out value="${row.viaPlace4}"/>
    </div>
</c:if>

        <%-- ⑥ 중간역2 아래 줄: 노선3 (東京メトロ丸の内線 등) --%>
        <c:if test="${not empty row.viaPlace5}">
            <div class="form_Normal3 keiro-line-block">
                <c:out value="${row.viaPlace5}"/>
            </div>
        </c:if>

        <%-- ⑦ 마지막 줄: 도착역 + 아이콘 --%>
        <c:if test="${not empty row.endPlace}">
            <div class="form_Normal2">
                <img src="<c:url value='/resources/img/tn/icon_keiro_02.gif'/>" alt="着">
                <c:out value="${row.endPlace}"/>
            </div>
        </c:if>

    </div>
</c:when>




                                <%-- ② 전철이 아닌 경우: 기존 2줄 구조 --%>
                                <c:otherwise>
                                    <div class="keiro-container">
                                        <div class="keiro-item">
                                            <img src="<c:url value='/resources/img/tn/icon_keiro_01.gif'/>" alt="発">
                                            <span><c:out value="${row.startPlace}"/></span>
                                        </div>
                                        <div class="keiro-item">
                                            <img src="<c:url value='/resources/img/tn/icon_keiro_02.gif'/>" alt="着">
                                            <span><c:out value="${row.endPlace}"/></span>
                                        </div>
                                    </div>
                                </c:otherwise>

                            </c:choose>
                            <%-- ★ 분기 끝 --%>

                        </div>
                    </div>
                </div>

            </div>

        </c:forEach>

    </c:if>

    <%-- 2) 맨 아래에 항상 '경로追加' 박스 하나 --%>
    <c:set var="nextRouteNo" value="${empty keiroList ? 1 : fn:length(keiroList) + 1}" />

    <div class="route-section">
        <div class="route-head">
            <span class="route-label">経路${maruDigits[nextRouteNo]}</span>

            <button type="button"
                    class="route-add"
                    style="border:none;background:none;padding:0;top:-15px;"
                    onclick="location.href='${keiroInputUrl}'">
                <img src="/resources/img/tuika_icon.gif" alt="追加">
                追加する
            </button>
        </div>
    </div>

    <br><br>

				<div class="button_Left">
					<div class="button_Left_Group">

						<a href="<c:url value='/hiwariKinmuchi/riyu'/>">
							<img src="/resources/img/back_btn01.gif" alt="戻る">
						</a>

						<button type="submit" name="action" value="apply"
						        style="border:none;background:none;padding:0;cursor:pointer;">
							<img src="/resources/img/next_btn01.gif" alt="次へ">
						</button>

						<button type="submit" name="action" value="temp"
						        style="border:none;background:none;padding:0;cursor:pointer;">
							<img src="/resources/img/hozon_btn01.gif" alt="一時保存">
						</button>

					</div>
				</div>

			</form>

			<br><br>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</div>
</body>
</body>

<script>
  // 자택 / 근무지 좌표 (현재는 임시 더미 좌표)
  let homePos = { lat: 35.681236, lng: 139.767125 }; 
  let workPos = { lat: 35.628471, lng: 139.738760 }; 

  // 지도 초기화 상태 플래그 + 객체
  let mapInited = false;
  let mapObj = null;
  let directionsService = null;
  let directionsRenderer = null;

  // 구글 지도 + 자택/근무지 마커 표시
  function initMapAndRoute() {
    if (!homePos || !workPos) {
      alert('位置情報がまだ準備できていません。（위치 정보가 아직 준비되지 않았습니다）');
      console.error('homePos / workPos 없음:', homePos, workPos);
      return;
    }

    const centerPos = {
      lat: (homePos.lat + workPos.lat) / 2,
      lng: (homePos.lng + workPos.lng) / 2
    };

    const mapDiv = document.getElementById('mapArea');
    if (!mapDiv) {
      console.error('mapArea 요소를 찾을 수 없습니다.');
      return;
    }

    mapObj = new google.maps.Map(mapDiv, {
      center: centerPos,
      zoom: 13
    });

    // 自宅 마커
    new google.maps.Marker({
      position: homePos,
      map: mapObj,
      title: '自宅（자택）'
    });

    // 勤務先 마커
    new google.maps.Marker({
      position: workPos,
      map: mapObj,
      title: '勤務先（근무지）'
    });

    // 경로 서비스(지금은 선을 안 그려도 설계서에는 문제 없음)
    directionsService = new google.maps.DirectionsService();
    directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(mapObj);
  }

  // 「地図を確認」 버튼 → 지도 열기
  function showMapInside() {
    const mapArea = document.getElementById("mapArea");
    mapArea.style.display = "block";

    if (!mapInited) {
      initMapAndRoute();
      mapInited = true;
    }
  }

  // 지도 닫기 (필요하면 사용)
  function hideMapInside() {
    document.getElementById("mapArea").style.display = "none";
  }
</script>

<script
 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVcLQp5Bph7NiWqwiYJUQEBMRyCOEsTnU&libraries=maps"
   defer>
</script>

</html>
