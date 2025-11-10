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
	background-color: #f8f8f8; /* ← 표 아래로 깔릴 배경 */
	padding: 16px; /* 표 주변 여백 */
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

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 5fr;
}

.form_Column {
	text-align: center;
	padding: 5px;
}

.form_Normal {
	text-align: left;
	padding: 5px;
}

.search-box {
	width: 1010px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.result-box {
	width: 1010px;
	margin: auto;
	border: 1px solid #ccc;
	display: flex;
	flex-direction: column;
	background-color: #fff;
}

.result-box>div:first-child {
	width: 100%; background-color : #595860; color : #fff; font-weight :
	bold; display : flex; align-items : center; padding : 8px 12px;
	font-size : 14px; height : 31px;
	box-sizing: border-box;
	height: 31px;
	font-size: 14px;
	padding: 8px 12px;
	align-items: center;
	display: flex;
	font-weight: bold;
	color: #fff;
	background-color: #595860;
}

.result-box>div:first-child input[type="radio"] {
	margin-right: 6px;
}

.result-box>div:last-child {
	width: 100%; height : 275px;
	overflow: hidden;
	height: 275px;
}

.result-box>div:last-child img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 비율 맞추며 꽉 채움 */
	display: block;
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
				<div class="transport">手段：徒歩</div>
			</div>
			<div class="content_Form1">
				<div id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal">神奈川県川崎市中原区新丸子2-1-2-3 レオパレス新丸子201</div>
				</div>
				<div id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">東京都中野区本町3-30-4KDX中野坂上ビル8F</div>
				</div>
			</div>
			<div class="search-box">
				<div>上記の住所から勤務地までを検索します。</div>
				<img src="/resources/img/tn/search_btn01.gif" alt="back_btn01">
			</div>
			<div class="result-box">
				<div>
					<input type="radio" name="result1" value="1" />検索結果
				</div>
				<div>
					<img src="/resources/img/tn/image_map.jpg">
				</div>
			</div>
			<div class="content_Form1">
				<div id="form_Text1">
					<div class="form_Column">距離</div>
					<div class="form_Normal">1.5km</div>
				</div>
			</div>
			<div class="button_box">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						id="btnBack"> <img src="/resources/img/keiro_btn02.gif"
						alt="nyuryoku_btn01"> <img
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