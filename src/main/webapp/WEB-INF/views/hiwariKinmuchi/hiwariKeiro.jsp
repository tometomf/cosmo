<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜経路入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
  /* ===== 상단 안내 + 지도 버튼 ===== */
  .hint-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin: 8px 0 10px;
  }
  .hint-text { color: #333; line-height: 1.9; flex: 1; }
  .map-btn img { display: block; }

  /* ===== 경로 영역 ===== */
  .route-section {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ccc;
    border-top: 3px solid #46b946; /* 🔹 스크린샷의 밝은 초록색으로 변경 */
    border-radius: 0;
    padding: 20px 10px 18px;
    margin-top: 8px;
  }

  .route-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* ✅ 탭: 이미지 유지 + 초록색 계열 맞춤 */
  .route-label {
    position: relative;
    top: -23px;
    margin-left: -1px;
    display: inline-block;
    width: 90px;
    height: 33px;
    line-height: 33px;
    text-align: center;
    font-size: 13px;
    font-weight: 700;
    color: #1f6b1f; /* 탭 글자색도 조화롭게 맞춤 */

    /* 이미지 그대로 활용 */
    background: url("<c:url value='/resources/img/tn/bg_keirotitle.gif'/>") no-repeat center top;
    background-size: cover;

    /* 테두리: 동일한 밝은 초록톤 */
    border: 1px solid #64c764;
    border-top-color: #46b946;
    border-radius: 0;
  }

  .route-add {
    position: relative;
    top: -6px;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 13px;
    color: #7d3fb2;
    text-decoration: none;
  }
  .route-add img { width: 14px; height: 14px; }
  .route-add:hover { text-decoration: underline; }

  /* ===== 하단 버튼: 왼쪽 정렬 고정 ===== */
  .btn-row-left {
    display: block;
    width: 100% !important;
    text-align: left !important;
    margin: 24px 0 0 0 !important;
  }

  .button_Center_Group {
    display: flex !important;
    justify-content: flex-start !important;
    align-items: center !important;
    gap: 14px;
    width: 100% !important;
    margin: 0 !important;
  }

  .button_Center_Group a {
    display: inline-flex;
    align-items: center;
    text-decoration: none;
  }

  .button_Center_Group img { display: block; }
</style>
</head>

<body>
<div class="layout">
  <%@ include file="/WEB-INF/views/common/header.jsp"%>

  <div class="main">
    <!-- 상단 플로우 -->
    <div class="main_title">
      <div class="flow">
        <div class="flow_others">申請内容</div>
        <div class="flow_others">勤務地</div>
        <div class="flow_others">住所</div>
        <div class="flow_current">経路入力</div>
        <div class="flow_others">確認</div>
        <div class="flow_others">完了</div>
      </div>
      <div class="subtitle">経路入力</div>
    </div>

    <!-- 안내문 + 지도확인 버튼 -->
    <div class="hint-row">
      <div class="hint-text">
        自転車・徒歩・中型二輪は、住所から勤務先まで、その手段のみを申請する場合に限ります。<br>
        電車・バスは、扶養手段の併用(乗継)運用が可能です。<br>
        複数手段を利用する場合、手段ごとに経路を分割して登録してください。
      </div>
      <div class="map-btn">
        <a href="<c:url value='/hiwariKinmuchi/map'/>">
          <img src="/resources/img/map_mini_btn01.gif" alt="地図を確認">
        </a>
      </div>
    </div>

    <!-- 경로① 섹션 -->
    <div class="route-section">
      <div class="route-head">
        <span class="route-label">経路①</span>
        <a class="route-add" href="<c:url value='/hiwariKinmuchi/route/add'/>">
          <img src="/resources/img/tuika_icon.gif" alt="追加アイ콘">
          追加する
        </a>
      </div>
    </div>

    <!-- 하단 버튼: 왼쪽 정렬 고정 -->
    <div class="btn-row-left">
      <div class="button_Center_Group">
        <a href="<c:url value='/hiwariKinmuchi/back'/>">
          <img src="/resources/img/back_btn01.gif" alt="戻る">
        </a>
        <a href="<c:url value='/hiwariKakunin'/>">
          <img src="/resources/img/next_btn01.gif" alt="次へ">
        </a>
        <a href="<c:url value='/hiwariKinmuchi/saveTemp'/>">
          <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
        </a>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>
</html>
