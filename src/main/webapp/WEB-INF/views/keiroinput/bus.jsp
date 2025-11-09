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
	width: 1010px;
	margin: auto;
	display: flex;
}

.transport {
	width: 1010px;
	padding: 0.5rem;
	padding-left: 10px;
	text-align: left;
	font-weight: bold;
	border-left: 5px solid #666;
	border-bottom: 2px dotted #999;
	color: #333;
}

.grid {
	display: grid;
	grid-template-columns: 140px 1fr auto;
	width: 100%;
	justify-self: center;
}

.grid>div {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
	background-color: white;
}

.grid>div.background {
	background-color: #8f8f8f;
}

.grid2 {
	display: grid;
	grid-template-columns: 140px 1fr auto;
	width: 100%;
	justify-self: center;
	margin-top: 10px;
}

.grid2>div {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
	background-color: white;
}

.grid2>div.background {
	background-color: #8f8f8f;
}

.swapbotton {
	grid-column: 3;
	grid-row: 1/span 2;
	display: flex;
}

.station_layout {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
	align-items: center;
}

.button_layout {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
	align-items: center;
}

.button_layout>img:first-child {
	justify-self: start;
}

.button_layout>img:last-child {
	justify-self: end;
}

.left_space {
	background-color: #f8f8f8;
	padding: 16px;
	width: 90%;
	margin-left: 10px;
	align-self: start;
}

.right_space {
	
}

.form_array {
	width: 90%;
	margin: 0 auto;
}

.add_btn {
	display: block;
	margin-top: 20px;
}

.station_flow {
	display: flex;
	flex-direction: column;
	background-color: #e9f7d3;
	border: 2px solid #a8cf71;
	width: 100%;
	height: 80px;
	margin: 40px;
	justify-content: center;
	align-items: flex-start;
}

.station_flow>div {
	white-space: normal;
}

.station_flow_name {
	font-size: 24px;
	font-weight: bold;
}

#form_Ttile1 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 2fr 1fr 1fr 1fr 1fr;
	background: #595860;
	color: #fff;
	text-align: center;
	font-weight: 700;
	border: 1px solid #bfbfbf;
}

#form_Ttile1>div {
	border-right: 1px solid #bfbfbf;
	padding: 6px 8px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 2fr 1fr 1fr 1fr 1fr;
	/* 	border-left: 1px solid #bfbfbf;
	border-right: 1px solid #bfbfbf;
	background: #f8f8f8; */
}

#form_Text1>.form_Column {
	display: flex;
	align-items: center;
	padding: 4px 6px;
	box-sizing: border-box;
}

#form_Text1 input[type="text"], #form_Text1 input[type="number"] {
	width: 100%;
	padding: 4px 6px;
	box-sizing: border-box;
}

#form_Text1 .form_Column:nth-child(4) {
	display: flex;
	align-items: center;
	gap: 6px;
}

#form_Text1 .arrow {
	flex: 0 0 auto;
	padding: 0 4px;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 6fr 1fr 1fr 1fr;
	align-items: center;
}

#form_Text2>.form_Column {
	padding: 6px 8px;
	box-sizing: border-box;
	background: #eeeeee;
}

#form_Text2 .form_Column:first-child {
	text-align: right;
	font-weight: bold;
}

.info-box {
	width: 1010px;
	margin: auto;
}

.button_box {
	width: 1010px;
	margin: auto;
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
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
				<div class="transport">手段：バス</div>
			</div>

			<div class="content_Form1">
				<!-- 제목예제1 -->
				<div class="form_Title1" id="form_Ttile1">
					<div>移動手段</div>
					<div>その他移動手段</div>
					<div>バス会社</div>
					<div>バス停名</div>
					<div>片道料金</div>
					<div>1ケ月</div>
					<div>3ケ月</div>
					<div>６ケ月</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">バス</div>
					<div class="form_Column">
						<input type="text" id="otherTransport" name="otherTransport">
					</div>
					<div class="form_Column">
						<input type="text" id="busCompany" name="busCompany">
					</div>
					<div class="form_Column">
						<input type="text" id="busStopFrom" name="busStopFrom"
							aria-label="バス停名(出発)"> <span class="arrow">→</span> <input
							type="text" id="busStopTo" name="busStopTo" aria-label="バス停名(到着)">
					</div>
					<div class="form_Column">
						<input type="number" id="oneWayFare" name="oneWayFare"
							inputmode="numeric" min="0" step="1">
					</div>
					<div class="form_Column">
						<input type="number" id="pass1m" name="pass1m" inputmode="numeric"
							min="0" step="1">
					</div>
					<div class="form_Column">
						<input type="number" id="pass3m" name="pass3m" inputmode="numeric"
							min="0" step="1">
					</div>
					<div class="form_Column">
						<input type="number" id="pass6m" name="pass6m" inputmode="numeric"
							min="0" step="1">
					</div>
				</div>
				<div class="form_Text2" id="form_Text2">
					<div class="form_Column">合計</div>
					<div class="form_Column">4,620円</div>
					<div class="form_Column">13,170円</div>
					<div class="form_Column">24,950円</div>
				</div>
			</div>
			<div class="info-box">
				<p>
					バス検索はこちらから（外部サイトが開きます）<br> <a
						href="http://transit.loco.yahoo.co.jp" target="_blank"
						rel="noopener noreferrer"> http://transit.loco.yahoo.co.jp </a>
				</p>
			</div>
			<div class="button_box">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01" id="btnBack"> <img
						src="/resources/img/keiro_btn02.gif" alt="nyuryoku_btn01"> <img
						src="/resources/img/hozon_btn01.gif" alt="nyuryoku_btn01">
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	<script>
		document.getElementById('btnBack').addEventListener('click',
				function() {
					if (document.referrer) {
						location.href = document.referrer;
						return;
					}
					if (history.length > 1) {
						history.go(-1);
						return;
					}
					location.href = '/';
				});
	</script>
</body>
</html>