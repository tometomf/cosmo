<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

.swapbutton {
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
								<input type="text" name="From_station"
									value="${keiro.startPlace}">
							</div>
							<div class="swapbutton">
								<img src="/resources/img/tn/change_btn.gif" id="ekiSwapButton">
							</div>
							<div class="background">到着地</div>
							<div>
								<input type="text" name="To_station" value="${keiro.endPlace}">
							</div>
						</div>
						<div></div>
						<!-- 경유역 그리드 -->
						<!-- <div class="grid2" id="stationContainer">
							<div class="background">経由地1</div>
							<div>
								<input type="text" name="middle_station_01">
							</div>
						</div> -->

						<div class="grid2" id="stationContainer">
							<!-- 항상 1개는 보여주기 -->
							<div class="background">経由地1</div>
							<div>
								<input type="text" name="middle_station_01"
									value="${keiro.viaPlace1}">
							</div>

							<!-- 2번 경유지 -->
							<c:if test="${not empty keiro.viaPlace2}">
								<div class="background">経由地2</div>
								<div>
									<input type="text" name="middle_station_02"
										value="${keiro.viaPlace2}">
								</div>
							</c:if>

							<!-- 3번 경유지 -->
							<c:if test="${not empty keiro.viaPlace3}">
								<div class="background">経由地3</div>
								<div>
									<input type="text" name="middle_station_03"
										value="${keiro.viaPlace3}">
								</div>
							</c:if>

							<!-- 4번 경유지 -->
							<c:if test="${not empty keiro.viaPlace4}">
								<div class="background">経由地4</div>
								<div>
									<input type="text" name="middle_station_04"
										value="${keiro.viaPlace4}">
								</div>
							</c:if>

							<!-- 5번 경유지 -->
							<c:if test="${not empty keiro.viaPlace5}">
								<div class="background">経由地5</div>
								<div>
									<input type="text" name="middle_station_05"
										value="${keiro.viaPlace5}">
								</div>
							</c:if>
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
				<div id="kensakuTime"></div>
			</div>

			<div class="charge_info">
				<img src="/resources/img/tn/tab_keiro_02.gif">
				<div class="charge_flow" id="routeContainer"></div>
			</div>

			<div class="final_charge" id="chargeList">
				<div class="final_charge_title">
					<div>路線</div>
					<div>区間</div>
					<div>１ヶ月</div>
					<div>3ヶ月</div>
					<div>6ヶ月</div>
				</div>

				<div class="final_charge_detail" id="chargeContainer">
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
					src="/resources/img/keiro_btn02.gif" id="keiroKakutei"> <img
					src="/resources/img/hozon_btn01.gif" id="denshaHozonBtn"
					style="cursor: pointer;">
			</div>
		</div>

		<!-- 임시저장용 폼 -->
		<form id="denshaTempForm" method="post"
			action="<c:url value='/keiroinput/tempSave'/>">
			<input type="hidden" name="commuteJson" value="">

			<!-- 이 화면에서의 action 이름(= DTO.actionNm) -->
			<input type="hidden" name="actionUrl"
				value="/keiroinput/07_keirodtInput">

			<!-- 이동용 URL, hozonBtn은 비워서 보내고 keiroBtn은 채워서 보냄 -->
			<input type="hidden" name="redirectUrl" value="">
		</form>



		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>


</body>
</html>


<script>
document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("denshaTempForm");
    const commuteJsonInput = document.querySelector('input[name="commuteJson"]');
    const redirectUrlInput = document.querySelector('input[name="redirectUrl"]');
    const hozonBtn = document.getElementById("denshaHozonBtn");

    function buildCommuteJson() {

        const fromStation = document.querySelector('input[name="From_station"]').value.trim();
        const middleInputs = document.querySelectorAll('#stationContainer input[type="text"]');
        const middles = [];
        middleInputs.forEach(input => {
            const v = input.value.trim();
            if (v !== "") {
                middles.push(v);
            }
        });
        const toStation = document.querySelector('input[name="To_station"]').value.trim();
        const ikkagetsukingaku    = total1;
        
        if (total1 === 0) {
            alert("定期券情報がありません。");
            return null;
        }

        const shinseiKin     = total1;
        const tsukiShikyuKin = total1;
        const teikiKikan     = "1";

        const shinseiIcData = {
            kigyoCd:   null,
            shinseiNo: null,
            shinseiYmd: null,
            shinseiKbn: null,
            shinchokuKbn: null,
            genAddress: null,
            newAddress: null,
            genShozoku: null,
            newShozoku: null,
            genKinmuchi: null,
            newKinmuchi: null,
            riyu: null,
            idoYmd: null,
            itenYmd: null,
            tennyuYmd: null,
            riyoStartYmd: null,
            ssmdsYmd: null,
            moComment: null,
            codeNm: null,
            shinseiName: null,

            
             keiro: {
            tsukinShudan : "1",
            shudanName :   "電車",
            startPlace :   fromStation,
            endPlace :     toStation,
            tsuki : ikkagetsukingaku //버스랑 같이 tsuki에 1개월 금액 넣어둠
        }
        };

        return JSON.stringify(shinseiIcData);
    }

    
    if (hozonBtn) {
        hozonBtn.addEventListener("click", function () {
            const jsonString = buildCommuteJson();
            if (!jsonString) return;
            commuteJsonInput.value = jsonString;
            redirectUrlInput.value = "";

            form.submit();
        });
    }

});
</script>



<script>
		document.addEventListener("DOMContentLoaded", function() {

			const container = document.getElementById("stationContainer");
			const addBtn = document.getElementById("addStationBtn");
			const returnToTop = document.getElementById("returnToTop");
			const keiro = document.getElementById("keiro");
			const kensaku = document.getElementById("SearchStationBtn");
			
			const ekiSwap = document.getElementById("ekiSwapButton");
			
			const Kakutei = document.getElementById("keiroKakutei");
			let searchedRoute = null;

	    	const baseInput = container.querySelector('input[name="middle_station_01"]');

	    	
	    	
	    	function addMiddleRow(initialValue) {
	    	    const container = document.getElementById("stationContainer");
	    	    const count = container.querySelectorAll(".background").length;
	    	    const newIndex = count + 1;

	    	    const newLabel = document.createElement("div");
	    	    newLabel.className = "background";
	    	    newLabel.textContent = "経由地" + newIndex;

	    	    const newInputDiv = document.createElement("div");
	    	    const newInput = document.createElement("input");
	    	    newInput.type = "text";
	    	    newInput.name = "middle_station_" + String(newIndex).padStart(2, "0");

	    	    if (initialValue) {
	    	        newInput.value = initialValue;
	    	    }

	    	    newInputDiv.appendChild(newInput);
	    	    container.appendChild(newLabel);
	    	    container.appendChild(newInputDiv);
	    	}
			
	    	
	    	
	    	
	    	
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
				
				
				document.getElementById("kensakuTime").innerText = getCurrentTime();
				
				
				routes = [
					{
						depart: "17:31",
						arrive: "18:07",
						duration: "36分",     // 분
						transfer: "1回",      // 회
						fare: 370,        // 엔
						icons: ["icon_jr"]
					},
					{
						depart: "17:40",
						arrive: "18:20",
						duration: "40分",
						transfer: "2回",
						fare: 340,
						icons: ["icon_shitetu", "icon_jr"]
					},
					{
						depart: "17:20",
						arrive: "18:10",
						duration: "50分",
						transfer: "0回",
						fare: 410,
						icons: ["icon_subway", "icon_jr"]
					}
				];
				
				
				teikiken = [
					{
					name : "東武東上線",
					from: "渋谷",
					to: "新宿",
					onemonth: 8500,     // 분
					threemonth: 13170,      // 회
					sixmonth: 24950        // 엔
					},
					{
					name : "東京メトロ丸ノ内線",
					from: "渋谷",
					to: "新宿",
					onemonth: 4260,     // 분
					threemonth: 24230,      // 회
					sixmonth: 45900        // 엔
					},
					{
					name : "東京メトロ丸ノ内線",
					from: "渋谷",
					to: "新宿",
					onemonth: "↓",     // 분
					threemonth: "↓",      // 회
					sixmonth: "↓"        // 엔
					}
				];
				
				routes.sort(function(a,b) {
					return a.fare - b.fare;
				});
				
				renderRoutes();
				chargeList();
			});
			
			ekiSwap.addEventListener("click", function() {
				const startStation = document.querySelector('input[name="From_station"]');
				const endStation = document.querySelector('input[name="To_station"]');

				
				const emptyStation = startStation.value;
				startStation.value = endStation.value;
				endStation.value = emptyStation;
			});
			
			Kakutei.addEventListener("click", function(){
				
				const displayedRoute = keiro.innerText.trim();
				
				if(!displayedRoute || displayedRoute === "経路を入力してください。"){
			        alert("経路を入力してください。");
			        return;
				}
				
				const formStation = document.querySelector('input[name="From_station"]').value;
				const middleInputs = document.querySelectorAll('#stationContainer input[type="text"]');
					const middles = [];
					middleInputs.forEach(input => {
						const v = input.value.trim();
						if(v !== ""){
							middles.push(v);
						}
					});
								
				const ToStation = document.querySelector('input[name="To_station"]').value;
				const currentRoute = [formStation, ...middles, ToStation].join(" -> ");

			    // 3. 비교
			    if (currentRoute !== displayedRoute) {
			        alert("입력한 경로와 조회된 경로가 일치하지 않습니다.");
			        return;
			    }

			    if (total1 === 0){
			        alert("정기권 정보가 없습니다.");
			        return;
			    }
			    			    // 4. 여기까지 왔으면 OK → 다음 로직
			    alert("경로가 일치합니다. 다음 단계로 진행합니다.");
			    // TODO: 실제 제출 처리 (폼 submit 등) 넣기
			    
			    
			    
			});
			
			
			
			
		});
		/* document.addEventListener("click", function()) */
		
		function getCurrentTime(){
			const kensakuTime = new Date();
			
			const year = kensakuTime.getFullYear();
			const month = String(kensakuTime.getMonth()+1).padStart(2,'0');
			const day = String(kensakuTime.getDate()).padStart(2,'0');
			const hour = String(kensakuTime.getHours()).padStart(2,'0');
			const minute = String(kensakuTime.getMinutes()).padStart(2,'0');
			
			 return year +"年"+month+"月"+day+"日"+hour+"時"+minute+"分出発";
		}
		
	</script>

<script>
	
	let routes = [];

/* 	
	routes.sort(function(a,b) {
		return a.fare - b.fare;
	}); */
	
	
	function renderRoutes(){
	const container = document.getElementById("routeContainer");
	container.innerHTML = "";
	
		routes.forEach(function(route, index){
			const row = document.createElement("div");
			row.className = "charge_flow_row";
			
			const iconsHTML = route.icons.map(function(icon){
				
				return '<img src = "/resources/img/tn/'+icon+'.gif">';}).join(" ");

			
				row.innerHTML = 
				'<div>'+
					'<input type="radio" name="seletRoute" value =" ' + index + '">経路'+(index + 1)+'</div>' + 
				'<div>' + route.depart + '発 -> ' + route.arrive + '着</div>' + 
				'<div>'+route.duration+'</div>' + 
				'<div>'+route.transfer+'</div>' + 
				'<div>'+route.fare+'円</div>' + 
				'<div>'+iconsHTML+'</div>'
				;
		
/* 				row.innerHTML = 
				`<div>
					<input type="radio" name="seletRoute" value = "${index}">経路${index + 1}
				</div>
				<div>${route.depart}発 -> ${route.arrive}着</div>
				<div>${route.duration}</div>
				<div>${route.transfer}</div>
				<div>${route.fare}</div>
				<div>${iconsHTML}</div>
				`; */
		
				container.appendChild(row);	
		});
	}

	document.addEventListener("DOMContentLoaded", function() {
		renderRoutes();
	});
	</script>

<script>
		



	let teikiken = [];
	
    const shozokuCD = '${sessionScope.shain.shozoku_Cd}'.trim();

	let total1 = 0;
	let total3 = 0;
	let total6 = 0;

	function chargeList(){
		const container = document.getElementById("chargeContainer");
		container.innerHTML = "";
		
		total1 = 0;
		total3 = 0;
		total6 = 0;
		
		teikiken.forEach(function(route,index) {
			const row = document.createElement("div");
			row.className = "final_charge_detail_row";
			
			
			if(shozokuCD == "006"){
				row.innerHTML = 
				'<div>'+route.name+'</div>'+
				'<div>'+route.from+'->'+route.to+'</div>'+
				'<div>'+route.onemonth+'</div>'+
				'<div>'+route.threemonth+'</div>'+
				'<div>'+route.sixmonth+'</div>'
			;
			}else{
				row.innerHTML = 
				'<div>'+route.name+'</div>'+
				'<div>'+route.from+'->'+route.to+'</div>'+
				'<div>'+route.onemonth+'</div>'+
				'<div></div>' +
				'<div></div>'
				;
			}

			container.appendChild(row);
			
			if(typeof route.onemonth === "number"){
	        	total1 += route.onemonth;
			} 
			if(typeof route.threemonth === "number" && shozokuCD == "006"){
	        	total3 += route.threemonth;
			}
	        if(typeof route.sixmonth === "number" && shozokuCD == "006"){
	        	total6 += route.sixmonth;
	        }
		});
		
		const finalRow = document.createElement("div");
		finalRow.className="final_charge_result";
		
		if(shozokuCD == "006"){
		finalRow.innerHTML =
			'<div>合計</div>'+
			'<div></div>'+
			'<div>'+total1+'円</div>'+
			'<div>'+total3+'円</div>'+
			'<div>'+total6+'円</div>'
		;
			
		}else{
			finalRow.innerHTML =
			'<div>合計</div>'+
			'<div></div>'+
			'<div>'+total1+'円</div>' +
			'<div></div>' +
			'<div></div>'
		}
		
		
		container.appendChild(finalRow);
	}
	document.addEventListener("DOMContentLoaded", function() {
		chargeList();
	});
	</script>



<script>
		
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

