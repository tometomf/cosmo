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
		<div style = "display: flex; justify-content: space-between;">
			<div><img src="/resources/img/logo.gif" alt="logo" style = "display: block;"></div>
			<div>
				<img src="/resources/img/ll/head_btn01.gif" alt="">
				<img src="/resources/img/ll/head_btn02_sel.gif" alt="">
				<img src="/resources/img/ll/head_btn03.gif" alt="">
				<img src="/resources/img/ll/head_btn04.gif" alt="">
			</div>
		</div>
		<div>
			<div class = "userName">
				<div>ログイン名:</div>
				<div style = "font-weight: bold;"></div>
			</div>
			<div class = "header_Btn">
				<img src="/resources/img/logout_btn.gif" alt="logout_btn">
			</div>
		</div>
		<div class = "userInfo">
			<div>
				<div class = "userInfo_Title">法人名</div>
				<div class = "userInfo_Text"></div>
			</div>
			<div>
				<div class = "userInfo_Title">現在の支給月</div>
				<div class = "userInfo_Text"></div>
			</div>
		</div>
	</div>
</body>
</html>
