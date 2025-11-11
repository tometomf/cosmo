<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<body>
	<div class = "header">
		<img src="/resources/img/logo.gif" alt="logo" style = "display: block;">
		<div class = "userName">
			<div>ログイン名:</div>
			<div style = "font-weight: bold;">${shain.shain_No}</div>
		</div>
		<div class = "header_Btn">
			<img src="/resources/img/top_btn.gif" alt="top_btn">
			<img src="/resources/img/logout_btn.gif" alt="logout_btn">
		</div>
		<div class = "userInfo">
			<div>
				<div class = "userInfo_Title">法人名</div>
				<div class = "userInfo_Text">${shain.kigyo_Nm}</div>
			</div>
			<div>
				<div class = "userInfo_Title">所属名</div>
				<div class = "userInfo_Text"></div>
			</div>
			<div>
				<div class = "userInfo_Title">現役職</div>
				<div class = "userInfo_Text"></div>
			</div>
			<div>
				<div class = "userInfo_Title">社員番号</div>
				<div class = "userInfo_Text">${shain.shain_Uid}</div>
			</div>
			<div>
				<div class = "userInfo_Title">社員名</div>
				<div class = "userInfo_Text">${shain.shain_Nm}様</div>
			</div>
		</div>
	</div>
</body>
</html>
