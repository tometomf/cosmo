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

.grid>div:nth-child(2), .grid>div:nth-child(5) {
	text-align: left;
	padding-left: 25px;
}

.grid2 {
	display: grid;
	grid-template-columns: 140px 1fr;
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

.grid2>div:nth-child(even) {
	text-align: left;
	padding-left: 25px;
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
	margin-top: 40px;
}

.station_flow>div {
	white-space: normal;
}

.station_flow_name {
	font-size: 24px;
	font-weight: bold;
}

.charge_info {
	margin-top: 40px;
}

.charge_info>img {
	display: block;
	margin-bottom: 0;
}

.charge_flow {
	border-top: 2px solid #a8cf71;
	border-bottom: 2px solid #a8cf71;
	margin-top: 0;
}

.charge_flow_row {
	display: grid;
	grid-template-columns: 1fr 2fr 1fr 1fr 1fr 1fr;
	width: 100%;
	height: 35px;
	align-items: center;
}

.charge_flow>div:nth-child(odd) {
	background-color: #e9f7d3;
}

.charge_flow>div:nth-child(even) {
	background-color: #f5fce9;
}

.final_charge {
	border: 1px solid black;
	margin-top: 40px;
}

.final_charge_title {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr 1fr 1fr;
	background-color: #515151;
	border: 1px solid white;
	height: 25px;
	text-align: center;
	color: white;
	font-weight: bold;
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
	height: 25px;
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

.final_charge_detail>div:nth-child(1)>div:nth-child(n+3),
	.final_charge_detail>div:nth-child(2)>div:nth-child(n+3) {
	text-align: right;
}

.final_charge_detail>div:nth-child(3)>div:nth-child(n+3) {
	text-align: center;
}

.final_charge_result {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr 1fr 1fr;
	background-color: #dbdbdb;
	border: 1px solid white;
	height: 25px;
	font-weight: bold;
}

.final_charge_result>div {
	border-left: 1px solid white;
	text-align: right;
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

#map {
	width: 520px; /* 원하는 값 */
	height: 360px; /* 원하는 값 */
	/* 또는 width:100%; height:400px; */
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<!-- <div class="subtitle"> -->
			<div class="flow">
				<div class="flow_others">勤務地入力</div>
				<div class="flow_others">住所入力</div>
				<div class="flow_current">経路入力</div>
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
						<!-- 출발 도착역 그리드 -->
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
						<!-- 경유역 그리드 -->
						<div class="grid2" id="stationContainer">
							<div class="background">経由地1</div>
							<div>
								<input type="text" name="middle_station_01">
							</div>
						</div>

						<div class="button_layout">
							<img src="/resources/img/keiyu_mini_btn01.gif" id="addStationBtn"
								class="add_btn">
							<!-- 경유지 추가버튼 -->
							<img src="/resources/img/tn/search_btn01.gif"
								id="SearchStationBtn" class="add_btn">
						</div>
					</div>
				</div>
				<!-- 지도 그리드 -->
				<div class="right_space">
					<div id="map"></div>
				</div>
			</div>
			<div class="station_flow">
				<div class="station_flow_name">
					<div id="keiro">経路を入力してください。</div>
				</div>
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
					<div>路線</div>
					<div>区間</div>
					<div>１ヶ月</div>
					<div>3ヶ月</div>
					<div>6ヶ月</div>
				</div>

				<div class="final_charge_detail">
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>4,620円</div>
						<div>13,170円</div>
						<div>24,950円</div>
					</div>
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>8,500円</div>
						<div>24,230円</div>
						<div>45,900円</div>
					</div>
					<div class="final_charge_detail_row">
						<div>1</div>
						<div>1</div>
						<div>↓</div>
						<div>↓</div>
						<div>↓</div>
					</div>
					<div class="final_charge_result">
						<div>합계</div>
						<div></div>
						<div>13,120円</div>
						<div>37,400円</div>
						<div>70,850円</div>
					</div>
				</div>
			</div>

			<div class="menu_button">
				<img src="/resources/img/back_btn01.gif" id="returnToTop"> <img
					src="/resources/img/keiro_btn02.gif"> <img
					src="/resources/img/hozon_btn01.gif">
			</div>
		</div>


		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>


</body>
</html>


<script>
		document.addEventListener("DOMContentLoaded", function() {
			const container = document.getElementById("stationContainer");
			const addBtn = document.getElementById("addStationBtn");
			const returnToTop = document.getElementById("returnToTop");
			const keiro = document.getElementById("keiro");
			const kensaku = document.getElementById("SearchStationBtn");
			
			
			
			addBtn.addEventListener("click", function() {
				const count = container.querySelectorAll(".background").length;
				const newIndex = count + 1;

				const newLabel = document.createElement("div");
				newLabel.className = "background";
				newLabel.textContent = "経由地" + newIndex;

				const newInputDiv = document.createElement("div");
				const newInput = document.createElement("input");
				newInput.type = "text";
				newInput.name = "middle_station_"
						+ String(newIndex).padStart(2, "0");
				newInputDiv.appendChild(newInput);

				container.appendChild(newLabel);
				container.appendChild(newInputDiv);
				
				if(newIndex > 4){
					disableBtn = document.getElementById("addStationBtn");
					/* disableBtn.remove(); */ /*/ 스타일 떄문에 remove하니까 버튼이 당겨져버림 */
					disableBtn.style.visibility = "hidden";
					disableBtn.style.pointerEvents = "none";
					
				}
			});
			
			returnToTop.addEventListener("click", function(){
				location.href = "http://localhost:8282/keiroinput/06_keiroInput";
			});
			
			kensaku.addEventListener("click", function(){
				
				const formStation = document.querySelector('input[name="From_station"]').value;
/* 				const middleStation01 = document.querySelector('input[name="middle_station_01"]')?.value|| "";
				const middleStation02 = document.querySelector('input[name="middle_station_02"]')?.value|| "";
				const middleStation03 = document.querySelector('input[name="middle_station_03"]')?.value|| "";
				const middleStation04 = document.querySelector('input[name="middle_station_04"]')?.value|| "";
				const middleStation05 = document.querySelector('input[name="middle_station_05"]')?.value|| ""; */
				const middleInputs = document.querySelectorAll('#stationContainer input[type="text"]');
				const middles = [];
				middleInputs.forEach(input => {
					const v = input.value.trim();
					if(v !== ""){
						middles.push(v);
					}
				});
				
				
				
				const ToStation = document.querySelector('input[name="To_station"]').value;
				
				const keiroResult = [formStation, ...middles, ToStation].join(" -> ");
				
				keiro.innerText = keiroResult;
			});
			
		});
		/* document.addEventListener("click", function()) */
		
	</script>
<script
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpKeyId=ki71dhiwnl"
	defer></script>
<script>
  window.addEventListener('load', function () {
    var mapOptions = {
      center : new naver.maps.LatLng(37.3595704, 127.105399),
      zoom : 10
    };
    new naver.maps.Map('map', mapOptions);
  });
</script>

