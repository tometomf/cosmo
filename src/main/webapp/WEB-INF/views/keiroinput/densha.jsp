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

.grid>div:nth-child(2),
.grid>div:nth-child(5){
	text-align: left;
	padding-left : 25px;
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

.grid2>div:nth-child(2){
	text-align: left;
	padding-left : 25px;
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
	width: 100%;
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
	/* margin : 40px;  */
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

.charge_info {
	
}

.charge_info>img {
	display: block;
	margin-bottom: 0;
}

.charge_flow {
	border: 2px solid #a8cf71;
	margin-top: 0;
}

.charge_flow_row {
	display: grid;
	grid-template-columns: 1fr 2fr 1fr 1fr 1fr 1fr;
	width: 100%;
}

.charge_flow>div:nth-child(odd) {
	background-color: #e9f7d3;
}

.charge_flow>div:nth-child(even) {
	background-color: #f5fce9;
}

.final_charge {
	border: 1px solid black;
}

.final_charge_title {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr 1fr 1fr;
	background-color: #515151;
	border: 1px solid white;
}

.final_charge_title>div {
	border-left: 1px solid white;
}

.final_charge_detail {
	
}

.final_charge_detail_row {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr 1fr 1fr;
	/* background-color: #515151; */
	border: 1px solid white;
}

.final_charge_detail_row>div {
	border-left: 1px solid white;
}

.final_charge_detail>div:nth-child(odd) {
	background-color: #999999;
}

.final_charge_detail>div:nth-child(even) {
	background-color: #dbdbdb;
}

.final_charge_result {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr 1fr 1fr;
	background-color: #dbdbdb;
	border: 1px solid white;
}

.final_charge_result>div {
	border-left: 1px solid white;
}

.final_charge_result>div:first-child {
	grid-column: 1/span 2;
}

.final_charge_result>div:nth-child(2) {
	display: none;
}

.menu_button {
	display: flex;
	gap: 5px;
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
								<input type="text" name="To_station" value="新宿">
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
				<div class="station_flow_name">동두천 -> 서울 ->경주</div>
				<div>시간</div>
			</div>

			<div class="charge_info">
				<img src="/resources/img/tn/tab_keiro_02.gif">
				<div class="charge_flow">
					<div class="charge_flow_row">
						<div>
							<input type="radio" name="seletRoute">経路1
						</div>
						<div>17:31発 -> 18:07着</div>
						<div>36分</div>
						<div>乗換1回</div>
						<div>370円</div>
						<div>
							<img src="/resources/img/tn/icon_subway.gif">
						</div>
					</div>
					<div class="charge_flow_row">
						<div>
							<input type="radio" name="seletRoute">経路2
						</div>
						<div>17:31発 -> 18:07着</div>
						<div>36分</div>
						<div>乗換1回</div>
						<div>370円</div>
						<div>
							<img src="/resources/img/tn/icon_jr.gif"> <img
								src="/resources/img/tn/icon_shitetu.gif"> <img
								src="/resources/img/tn/icon_subway.gif">
						</div>
					</div>
					<div class="charge_flow_row">
						<div>
							<input type="radio" name="seletRoute">経路3
						</div>
						<div>17:31発 -> 18:07着</div>
						<div>36分</div>
						<div>乗換1回</div>
						<div>370円</div>
						<div>
							<img src="/resources/img/tn/icon_shitetu.gif"> <img
								src="/resources/img/tn/icon_subway.gif">
						</div>
					</div>
					<div class="charge_flow_row">
						<div>
							<input type="radio" name="seletRoute">経路4
						</div>
						<div>17:31発 -> 18:07着</div>
						<div>36分</div>
						<div>乗換1回</div>
						<div>370円</div>
						<div>
							<img src="/resources/img/tn/icon_shitetu.gif"> <img
								src="/resources/img/tn/icon_subway.gif">
						</div>
					</div>
					<div class="charge_flow_row">
						<div>
							<input type="radio" name="seletRoute">経路5
						</div>
						<div>17:31発 -> 18:07着</div>
						<div>36分</div>
						<div>乗換1回</div>
						<div>370円</div>
						<div>
							<img src="/resources/img/tn/icon_jr.gif"> <img
								src="/resources/img/tn/icon_shitetu.gif"> <img
								src="/resources/img/tn/icon_subway.gif">
						</div>
					</div>
				</div>
			</div>

			<div class="final_charge">
				<div class="final_charge_title">
					<div>1</div>
					<div>1</div>
					<div>1</div>
					<div>1</div>
					<div>1</div>
				</div>

				<div class="final_charge_detail">
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
					</div>
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
					</div>
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
					</div>
					<div class="final_charge_result">
						<div>합계</div>
						<div></div>
						<div>1</div>
						<div>1</div>
						<div>1</div>
					</div>
				</div>
			</div>

			<div class="menu_button">
				<img src="/resources/img/back_btn01.gif"> <img
					src="/resources/img/keiro_btn02.gif"> <img
					src="/resources/img/hozon_btn01.gif">
			</div>
		</div>


		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>