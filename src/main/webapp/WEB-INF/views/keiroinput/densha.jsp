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
	display : flex;
	flex-direction : column;
	background-color: #e9f7d3;
	border: 2px solid #a8cf71;
	width: 100%;
	height: 80px;
	margin : 40px;
	justify-content: center;
	align-items: flex-start;

}

.station_flow>div{
	white-space : normal;
}

.station_flow_name{
	font-size: 24px;
	font-weight: bold;
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

			<div class="station_layout">
				<div class="left_space">
					<div class="form_array">
						<div class="grid">
							<div class="background">出発地</div>
							<div>
								<input type="text" name="From_station">
							</div>
							<div class="swapbotton">
								<img src="/resources/img/tn/change_btn.gif">
							</div>
							<div class="background">到着地</div>
							<div>
								<input type="text" name="To_station">
							</div>
						</div>
						<div></div>
						<div class="grid2">
							<div class="background">経由地</div>
							<div>
								<input type="text" name="middle_station">
							</div>
						</div>
						<div class="button_layout">
							<img src="/resources/img/keiyu_mini_btn01.gif" class="add_btn">
							<img src="/resources/img/tn/search_btn01.gif" class="add_btn">
						</div>
					</div>
				</div>
				<div class="right_space">
					<div>
						<img src="/resources/img/tn/image_map.jpg">
					</div>
				</div>
			</div>
			<div class="station_flow">
				<div class = "station_flow_name">동두천 -> 서울 ->경주</div>
				<div>시간</div>
			</div>

		</div>


		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>