<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜経路入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
  /* 전체 폭 통일 컨테이너 */
  .page-width {
    width: 950px;      /* 스크린샷 기준 정확한 폭 */
    margin: 0 auto;    /* 중앙 정렬 */
  }

  /* 안내문 + 지도 버튼 */
  .hint-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin: 8px 0 10px;
  }
  .hint-text { color: #333; line-height: 1.9; flex: 1; }
  .map-btn img { display: block; }

  /* 경로 영역 */
  .route-section {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ccc;
    border-top: 3px solid #46b946;
    border-radius: 0;
    padding: 20px 10px 18px;
    margin-top: 8px;
  }

  .route-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* 탭(배경 이미지 유지) */
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
    color: #1f6b1f;
    background: url("<c:url value='/resources/img/tn/bg_keirotitle.gif'/>") no-repeat center top;
    background-size: cover;
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

  /* --- 하단 버튼: main.css 폭(1010px) 오버라이드 & 좌측 정렬/간격 보강 --- */
  .button_Left {
    width: 100%;           /* 부모(.page-width 950px)에 맞춤 */
    margin: 12px 0 0;      /* 위 여백 약간 */
  }
  .button_Left_Group {
    display: flex;
    justify-content: flex-start;  /* 왼쪽 정렬 명시 */
    align-items: center;          /* 수직 중앙 정렬 */
    gap: 14px;                    /* 버튼 간 간격(원하면 조정) */
  }
  .button_Left_Group img {
    display: block;
  }

  /* 사용하지 않으므로 제거: .button_Center_Group, .btn-row-left 등 */
</style>
</head>

<body>
<div class="layout">
  <%@ include file="/WEB-INF/views/common/header.jsp"%>

  <div class="main">
    <!-- 상단 플로우 -->
    <div class="main_title">
      <div class="flow">
        <div class="flow_others">勤務地入力</div>
        <div class="flow_others">住所入力</div>
        <div class="flow_others">申請理由入力</div>
        <div class="flow_current">経路入力</div>
        <div class="flow_others">確認</div>
        <div class="flow_others">完了</div>
      </div>
      <div class="subtitle">通勤経路情報</div>
    </div>

    <!-- 중앙 컨테이너 시작 -->
    <div class="page-width">
      <!-- 안내문 + 지도확인 버튼 -->
      <div class="hint-row">
        <div class="hint-text">
          自転車・徒歩・中型二輪は、住所から勤務先まで、その手段のみを申請する場合に限ります。<br><br>
          電車・バスは、複数手段の利用（乗り継ぎ）での運用が可能です。<br>
          複数手段を利用する場合、手段ごとに経路を分割して登録してください。
        </div>
        <div class="map-btn">
          <a href="<c:url value='/hiwariKinmuchi/map'/>">
            <img src="/resources/img/map_mini_btn01.gif" alt="地図を確認">
          </a>
        </div>
      </div>
      <br>

      <!-- 경로① 섹션 -->
      <div class="route-section">
        <div class="route-head">
          <span class="route-label">経路①</span>
          <a class="route-add" href="<c:url value='/hiwariKinmuchi/route/add'/>">
            <img src="/resources/img/tuika_icon.gif" alt="追加アイコン">
            追加する
          </a>
        </div>
      </div>

	<br><br>
	
      <!-- 하단 버튼: 실제 동작(링크) 연결 -->
      <div class="button_Left">
        <div class="button_Left_Group">
          <a href="<c:url value='/hiwariKinmuchi/back'/>">
            <img src="/resources/img/back_btn01.gif" alt="戻る">
          </a>
          <a href="<c:url value='/hiwariKakunin'/>">
            <img src="/resources/img/shinsei_btn01.gif" alt="申請へ">
          </a>
          <a href="<c:url value='/hiwariKinmuchi/saveTemp'/>">
            <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
          </a>
        </div>
      </div>

      <br><br>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </div>
</div>
</body>
</html>
