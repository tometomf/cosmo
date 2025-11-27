<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 유지희 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜地図確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
.map-container {
    width: 950px;
    margin: 0 auto;
    padding: 20px;
}

.map-info {
    background: #f7f7f7;
    border: 1px solid #ccc;
    padding: 15px;
    margin-bottom: 20px;
}

.map-info p {
    margin: 8px 0;
    font-size: 14px;
}

.map-placeholder {
    width: 100%;
    height: 400px;
    border: 2px dashed #ccc;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fafafa;
    color: #999;
    font-size: 16px;
}

.close-btn {
    text-align: center;
    margin-top: 20px;
}

.close-btn button {
    padding: 10px 40px;
    font-size: 14px;
    cursor: pointer;
    background: #fff;
    border: 1px solid #999;
    border-radius: 3px;
}

.close-btn button:hover {
    background: #f0f0f0;
}
</style>
</head>

<body>
<div class="layout">
    <%@ include file="/WEB-INF/views/common/header.jsp"%>

    <div class="main">
        <div class="main_title">
            <div class="subtitle">地図確認</div>
        </div>

        <div class="map-container">
            
          <div class="map-info">
    <p><strong>住所:</strong> <c:out value="${address}"/></p>
    <p><strong>勤務地:</strong> <c:out value="${kinmuchi}"/></p>
</div>

            <div class="map-placeholder">
                ※ 地図機能は準備中です
            </div>

           <div class="close-btn">
    <a href="<c:url value='/hiwariKinmuchi/keiro'/>">
        <button type="button">閉じる</button>
    </a>
</div>
        </div>

        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>
</div>
</body>
</html>