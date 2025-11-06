<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
.flow-wrapper {
	display: flex;
	gap: 16px;
	justify-content: center;
	align-items: center;
}

.flow-current {
	position: relative;
	flex: 1 1 0;
	min-width: 0;
	width: 100%;
	height: 100px;
	background-image: url('<c:url value="/resources/img/bg_flow_01.gif"/>');
	background-size: auto;
	background-position: center;
	background-repeat: no-repeat;
}

.flow-other {
	position: relative;
	flex: 1 1 0;
	min-width: 0;
	width: 100%;
	height: 100px;
	background-image: url('<c:url value="/resources/img/bg_flow_02.gif"/>');
	background-size: auto;
	background-position: center;
	background-repeat: no-repeat;
}

.flow-currenttext {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: clamp(12px, 2vw, 7px);
	font-weight: 700;
	text-align: center;
}

.flow-othertext {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #808080;
	font-size: clamp(12px, 2vw, 7px);
	font-weight: 700;
	text-align: center;
}

.station-background {
	position : relative;
	width : 40%;
	height : 200px;
	background-color: #cecece;
	background-size : auto;
	backgorund-position : left;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<!-- <div class="subtitle"> -->
				<div class="flow-wrapper">
					<div class="flow-other">
						<span class="flow-othertext">勤務地入力</span>
					</div>
					<div class="flow-other">
						<span class="flow-othertext">住所入力</span>
					</div>
					<div class="flow-current">
						<span class="flow-currenttext">経路入力</span>
					</div>
					<div class="flow-other">
						<span class="flow-othertext">付随書類入力</span>
					</div>
					<div class="flow-other">
						<span class="flow-othertext">確認</span>
					</div>
					<div class="flow-other">
						<span class="flow-othertext">完了</span>
					</div>
				<!-- </div> -->
			</div>
			<div class="subtitle">
				<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle"
					style="width: 100%"> <span>申請内容選択</span>
			</div>
			
			<!-- ここまで上位タイトル -->
			
			<div class = "station-background">
				<table>
					<tr>出発駅</tr>
				</table>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>