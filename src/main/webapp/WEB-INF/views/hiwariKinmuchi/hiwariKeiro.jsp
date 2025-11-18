<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜経路入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
  html { overflow-y: scroll; }

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
  .hint-text { color: #333; line-height: 1.9; flex: 1; }
  .map-btn img { display: block; }

  /* ===== 경로 박스 전체 ===== */
  .route-section {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ccc;
    border-top: 3px solid #228B22;
    padding: 20px 10px 18px;
    margin-top: 8px;
  }

  .route-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* 초록탭 */
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

  /* 추가하기 버튼 (원래 위치/스타일) */
  .route-add {
    position: relative;
    top: -15px;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 13px;
    color: #7d3fb2;
    text-decoration: none;
    cursor: pointer;
  }
  .route-add img {
    width: 14px;
    height: 14px;
  }
  .route-add:hover { text-decoration: underline; }

  /* DB 경로 표시 박스 */
  .keiro-box {
    background: #ffffff;
    border: 1px solid #dcdcdc;
    padding: 10px 14px;
    margin-top: 6px;
  }

  .keiro-row {
    font-size: 13px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    column-gap: 20px;
    row-gap: 4px;
  }

  .keiro-row span { white-space: nowrap; }

  /* 버튼 */
  .button_Left {
    margin-top: 18px;
  }
  .button_Left_Group {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 14px;
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

    <div class="page-width">

      <!-- 안내문 + 지도 버튼 (원래 쓰던 문구) -->
      <div class="hint-row">
        <div class="hint-text">
          自転車・徒歩・自転車は、住所から勤務地まで、その手段のみを利用する場合に限ります。<br><br>
          電車・バスは、複数手段の利用（乗り継ぎ）が可能です。<br>
          複数手段を利用する場合、手段ごとに線路を分割して登録してください。
        </div>

        <div class="map-btn">
          <br>
          <a href="<c:url value='/hiwariKinmuchi/map'/>">
            <img src="/resources/img/map_mini_btn01.gif" alt="地図を確認">
          </a>
        </div>
      </div>

      <br>

      <!-- form: apply/temp 버튼용. 입력 항목 없음 -->
      <form action="<c:url value='/hiwariKinmuchi/keiro'/>" method="post">

        <!-- 통근수단 입력화면 URL 생성 (추가하기용) -->
        <c:url var="tsukinInputUrl" value="/tsukinInput">
          <c:param name="mode" value="add"/>
          <c:param name="shinseiNo" value="${shinseiNo}"/>
        </c:url>

        <div class="route-section">
          <div class="route-head">
            <!-- ★ 초록탭: repRouteNo = keiroList.size() -->
            <span class="route-label">経路${repRouteNo}</span>

            <!-- ★ 추가하기: 원래 위치/아이콘/스타일, 동작만 다른 화면으로 이동 -->
            <button type="button"
                    class="route-add"
                    style="border:none;background:none;padding:0;"
                    onclick="location.href='${tsukinInputUrl}'">
              <img src="/resources/img/tuika_icon.gif" alt="追加">
              追加する
            </button>
          </div>

          <!-- DB에 데이터가 없을 때 -->
          <c:if test="${empty keiroList}">
            <div class="keiro-box">
              <div class="keiro-row">現在登録されている経路はありません。</div>
            </div>
          </c:if>

          <!-- DB 경로 출력 (읽기 전용, 대표경로 표시는 없음) -->
          <c:forEach var="row" items="${keiroList}">
            <div class="keiro-box">
              <div class="keiro-row">
                <span>通勤手段：<c:out value="${row.tsukinShudanNm}"/></span>
                <span>出発地：<c:out value="${row.startPlace}"/></span>
                <span>到着地：<c:out value="${row.endPlace}"/></span>
              </div>
            </div>
          </c:forEach>

        </div>

        <br><br>

        <!-- 하단 버튼 3개 왼쪽 정렬 -->
        <div class="button_Left">
          <div class="button_Left_Group">

            <a href="<c:url value='/hiwariKinmuchi/back'/>">
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
</html>
