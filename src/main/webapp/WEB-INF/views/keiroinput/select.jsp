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

.commute-container {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 2rem;
	flex-direction: column;
	display: flex;
	gap: 1rem;
}

.info-text-box {
	width: 95%;
	display: flex;
	justify-content: left;
}

.info-text {
	width: 100%;
	text-align: left;
}

.commute-box {
	width: 95%;
	display: flex;
	flex-direction: column;
	color: #333;
}

.commute-row {
	width: 65%;
	min-width: 400px;
	display: flex;
	border: 1px solid #bfbfbf;
	margin-bottom: 12px;
	display: flex;
}

.commute-label {
	width: 140px;
	padding: 8px 12px;
	border-right: 1px solid #bfbfbf;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	letter-spacing: 0.05em;
}

.commute-label.dark {
	background: #595860;
	color: #fff;
	border-right: none;
}

.commute-value {
	flex: 1;
	padding: 8px 12px;
	background: #fff;
}

.commute-panel {
	width: 65%;
	min-width: 400px;
	display: flex;
	border: 1px solid #bfbfbf;
}

.commute-label.light {
	background: #dddddd;
	border-right: 1px solid #bfbfbf;
	padding: 14px 12px;
	display: flex;
	align-items: flex-start;
}

.commute-body {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 6px;
	padding: 12px 16px;
}

.commute-body label {
	display: flex;
	align-items: center;
	gap: 6px;
	cursor: pointer;
}

.commute-body input[type="radio"] {
	accent-color: #333;
	transform: scale(1.05);
}
｝
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
			<div class="subtitle">【経路①】 通勤手段 入力</div>
			<div class="commute-container">
				<div class="info-text-box">
					<div class="info-text">通勤手段を選択してください.</div>
				</div>

				<div class="commute-box">
					<div class="commute-row">
						<div class="commute-label dark">現 通勤手段</div>
						<div class="commute-value">バス</div>
					</div>
					<div class="commute-panel">
						<div class="commute-label light">新 通勤手段</div>
						<div class="commute-body">
							<label><input type="radio" name="way" checked> 電車</label>
							<label><input type="radio" name="way"> バス</label> 
							<label><input type="radio" name="way"> 自動車</label>  
							<label><input type="radio" name="way"> 徒歩</label>
							<label><input type="radio" name="way"> その他</label>
						</div>
					</div>
				</div>

			</div>
			<!-- ここまで上位タイトル -->


		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>