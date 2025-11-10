<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜完了</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
  /* 중앙 메시지 박스 */
  .finish-wrap{ display:flex; justify-content:center; }
  .finish-box{
    width: 720px;
    background:#fff;
    border:1px solid #ddd;
    border-radius:8px;
    padding:28px 32px;
    margin-top:18px;
    text-align:left;
  }
  .finish-title{
    background:#e6f5ea;
    color:#1a7f37;
    border:1px solid #bfe3c3;
    border-radius:4px;
    padding:8px 12px;
    font-weight:700;
    margin-bottom:18px;
    display:inline-block;
  }
  .finish-msg{ line-height:1.8; margin-top:6px; }
  .center-area{ text-align:center; margin-top:22px; }

  /* 빨간 메인 버튼 */
  .btn-top {
    display:inline-block;
    min-width:180px;
    padding:12px 28px;
    border-radius:24px;
    background:linear-gradient(#e85151, #c93737);
    color:#fff; font-weight:700; text-decoration:none;
    box-shadow:0 2px 0 #9a2a2a;
  }
  .btn-top:active{ transform:translateY(1px); box-shadow:0 1px 0 #9a2a2a; }
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
        <div class="flow_others">経路</div>
        <div class="flow_others">確認</div>
        <div class="flow_current">完了</div>
      </div>
      <div class="subtitle">完了</div>
    </div>


<style>

  .finish-wrap{display:flex;justify-content:center;}
  .finish-box{
    width:520px;            /* 스샷처럼 좁게 */
    background:#fff;
    border:0;               /* 테두리/라운드 없음 */
    padding:0;              /* 내부 여백 제거 */
    margin-top:10px;
    text-align:left;        /* 본문은 좌측 정렬 */
  }
  .finish-msg{line-height:1.8; margin:8px 0;}
  .center-area{ text-align:center; margin-top:18px; }
</style>

<div class="finish-wrap">
  <div class="finish-box">
 

    <div class="finish-msg">
      日割申請が完了しました。<br>
      「申請番号：<strong><c:out value='${apply.requestNo}' default='123000644'/></strong>」
    </div>

    <div class="finish-msg">
      お問い合わせの際は、上記の申請番号をお伝え下さい。<br>
      申請番号はメールでもお知らせしております。
    </div>

    <div class="center-area">
      <a href="<c:url value='/'/>">
        <img src="/resources/img/top_btn01.gif" alt="トップへ">
      </a>
    </div>
  </div>
</div>

  
<br>
<br>
  <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>
</html>
