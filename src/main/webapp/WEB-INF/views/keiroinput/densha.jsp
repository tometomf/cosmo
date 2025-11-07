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
.transport-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	min-width: 500px;
	align-items: center;
}

.transport {
	padding: 0.3rem;
	padding-left: 10px;
	margin: 1rem;
	text-align: left;
	font-weight: bold;
	border-left: 4px solid #666;
	border-bottom: 1px dotted #999;
	padding-bottom: 4px;
	color: #333;
	width: 90%;
}

.route-box {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

.route-row {
	display: contents;
}

.route-swap {
	grid-column: 3;
	grid-row: 1/span 2;
	justify-self: center;
	align-self: center;
}

.route-box>.station_form_Text1 {
	display: contents;
}

#form_Ttile1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

.station_form_Text1 {
	border: solid 1px #f5f5f5;
	
}

.station_form_Text1>div {
	min-width: 15px;
	text-align: left;
	padding: 5px;
	font-size: 13px;
	border: solid 1px white;
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<!-- <div class="subtitle"> -->
			<div class="flow">
				<div class="flow_current">勤務地入力</div>
				<div class="flow_others">住所入力</div>
				<div class="flow_others">経路入力</div>
				<div class="flow_others">付随書類入力</div>
				<div class="flow_others">確認</div>
				<div class="flow_others">完了</div>
			</div>
			<div class="subtitle">申請内容選択</div>
			<div class="transport-wrapper">
				<div class="transport">手段：電車</div>
			</div>
			<!-- ここまで上位タイトル -->


			<!-- 제목예제1 -->
			<div class="route-box">
				<div class="station_form_Text1">
					<div class="form_Column">出発駅</div>
					<div>
						<input type="text" name="from_station">
					</div>
				</div>
				<div class="station_form_Text1">
					<div class="form_Column">到着駅</div>
					<div>
						<input type="text" name="from_station">
					</div>
				</div>
				<div class="route-swap">
					<img src="/resources/img/tn/change_btn.gif" alt="swap">
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>