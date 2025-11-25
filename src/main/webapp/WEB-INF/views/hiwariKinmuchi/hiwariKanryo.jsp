<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 유지희 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜完了</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
 
  .finish-wrap { display:flex; justify-content:center; }
  .finish-box {
    width:520px;            
    background:#fff;
    border:0;               
    padding:0;              
    margin-top:10px;
    text-align:left;       
  }
  .finish-msg { line-height:1.8; margin:8px 0; }
  .center-area { text-align:center; margin-top:18px; }
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
	申請番号：<c:out value='${shinseiNo}'/>
        </div>

        <div class="finish-msg">
          お問い合わせの際は、上記の申請番号をお伝え下さい。<br>
          申請番号はメールでもお送りしております。
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
