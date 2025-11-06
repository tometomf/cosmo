<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.flow-current {
	position: relative;
	wiｄｔh: 100%;
	height: 10px;
	background-image: url('<c:url value="/resources/img/bg_flow_01.gif"/>');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	border-radius: 12px;
	overflow: hidden;
}

.flow-current-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: 2.5rem;
	font-weight: 700;
	text-align: center;
	text-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
}
</style>
</head>
<body>
	<div class="flow-current">
		<span class="flow-current-text">経路入力</span>
	</div>
</body>
</html>