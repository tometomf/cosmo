<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜完了</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
  /* ====== 完了 화면 전용 스타일 (중복 제거본) ====== */
  .finish-wrap { display:flex; justify-content:center; }
  .finish-box {
    width:520px;            /* 스샷처럼 좁게 */
    background:#fff;
    border:0;               /* 테두리/라운드 제거 */
    padding:0;              /* 내부 여백 제거 */
    margin-top:10px;
    text-align:left;        /* 본문은 좌측 정렬 */
  }
  .finish-msg { line-height:1.8; margin:8px 0; }
  .center-area { text-align:center; margin-top:18px; }
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
        <div class="flow_others">経路入力</div>
        <div class="flow_others">確認</div>
        <div class="flow_current">完了</div>
      </div>
      <div class="subtitle">完了</div>
    </div>

    <div class="finish-wrap">
      <div class="finish-box">
        <div class="finish-msg">
          日割申請が完了しました。<br>
          「申請番号：<c:out value='${apply.requestNo}' default='123000644'/>」
        </div>

        <div class="finish-msg">
          お問い合わせの際は、上記の申請番号をお伝え下さい。<br>
          申請番号はメールでもお知らせしております。
        </div>

		<br>
        <div class="center-area">
          <a href="<c:url value='/'/>">
            <img src="/resources/img/top_btn01.gif" alt="トップへ">
          </a>
        </div>
      </div>
    </div>

    <br><br>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </div>
</div>
</body>
</html>
