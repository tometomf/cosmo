<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住所入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
.btn_List {
	display: flex;
	align-items: center;
	gap: 8px;
	width: 750px;
	margin: auto;
}

#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text3 {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr;
}

#form_Text4 {
	display: grid;
	grid-template-columns: 2fr 3fr;
}

.zipcode {
	width: 50px;
}

.userInfo_Text {
	flex: 1;
	word-break: break-all;
}

.wrapper {
	width: 800px;
	margin-left: 40px;
}

.info-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.info-table th, .info-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.zipcode2 {
	width: 100%;
	box-sizing: border-box;
}

.new {
	text-indent: 40px;
	margin-bottom: 20px;
}

.hanei_mini_btn02 {
	float: right;
	margin-left: 10px;
}

.content_Form1 {
	margin-top: 20px;
	margin-bottom: 20px;
}

.content_Form3 {
	width: 400px;
	margin-left: 35px;
	border: solid 1px #a0a0a0;
}

.button_Left {
	display: flex;
	gap: 10px;
	width:;
	margin-top: 20px;
	margin-left:;
	margin-right: 30px;
}

.form_Column {
	display: flex;
	align-items: center;
}

.form_Column2 {
	background-color: #dddddd;
	border-right: solid 1px white;
	border-bottom: solid 1px white;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>

<body>
	<div class="layout">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">

			<div class="main_title">

				<!-- 진척도 -->
				<div class="flow">
					<div class="flow_others">勤務地入力</div>
					<div class="flow_current">住所入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">付随書類入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>

				<div class="subtitle">住所 入力</div>
			</div>

			<div class="new">新住所を入力してください。</div>

			<!-- ★★★ FORM 시작 ★★★ -->
			<form action="<c:url value='/idoconfirm/addressinput' />"
				method="post">

				<!-- 상단 주소 -->
				<div class="content_Form1">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column2">住所</div>
						<div class="form_Normal">大阪府大阪市東淀川区瑞光1－1－1ハイツ瑞光３０２</div>

						<div class="form_Normal">
							<!-- 이 주소를 반영 버튼 -->
							<button type="submit" name="reflect" value="Y"
								style="border: none; background: none; cursor: pointer;">
								<img src="/resources/img/tn/hanei_mini_btn02.gif">
							</button>
						</div>
					</div>
				</div>
			</form>

			<!-- 입력 테이블 -->
			<div class="content_Form1">

				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>現住所</div>
					<div>新住所</div>
				</div>

				<!-- 우편번호 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">郵便番号</div>
					<div class="form_Normal">213-0001</div>

					<div class="form_Normal">
						<input type="text" name="zip1" value="211" class="zipcode">
						<div>-</div>
						<input type="text" name="zip2" value="0001" class="zipcode">

						<button type="submit" name="searchZip" value="Y">検索</button>
					</div>
				</div>

				<!-- 도도부현 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">都道府県</div>
					<div class="form_Normal">神奈川県</div>

					<div class="form_Normal">
						<input type="text" name="pref" value="神奈川県">
					</div>
				</div>

				<!-- 시구정촌 ~ 번지 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">市区町村～番地</div>
					<div class="form_Normal">川崎市高津区上作延1-2-3</div>
					<div class="form_Normal">
						<input type="text" name="addr1" value="川崎市高津区上作延1-2-3"
							class="zipcode2">
					</div>
				</div>

				<!-- 건물명 ~ 호실 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">建物名～号室</div>
					<div class="form_Normal">レオパレス溝の口103</div>
					<div class="form_Normal_mid">
						<input type="text" name="addr2" value="レオパレス新丸子201"
							class="zipcode2">
					</div>
				</div>

			</div>

			<!-- 전입일 -->
			<div class="content_Form3">
				<div class="form_Text1" id="form_Text4">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">

						<!-- 서버로 넘길 실제 날짜 -->
						<input type="date" name="tenyuDate" id="tenyuDateInput"
							style="display: none;">

						<!-- 화면에 보이는 텍스트 (사용자가 직접 입력 가능) -->
						<input type="text" id="tenyuDateText" value="2013/04/13">

						<!-- 달력 아이콘 -->
						<img src="/resources/img/cal_icon.gif" id="calendarIcon"
							style="cursor: pointer;">

					</div>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="button_Left">
				<div class="button_Left_Group">

					<!-- 뒤로가기 -->
					<a href="<c:url value='/idoconfirm/kinmuInput' />"> <img
						src="/resources/img/back_btn01.gif">
					</a>

					<!-- 다음 -->
					<a href="<c:url value='/idoconfirm/keiroInfo' />"> <img
						src="/resources/img/next_btn01.gif">
					</a>

					<button type="submit" name="saveTemp" value="Y"
        id="saveTempBtn"
        style="border:none; background:none; padding:0; margin:0;">
    <img src="/resources/img/hozon_btn01.gif" id="saveImg" style="display:block; cursor:pointer;">
</button>


			<!-- ★★★ FORM 끝 ★★★ -->

		</div>

		<script>
			document.getElementById("saveImg").onclick = function() {
				alert("一時保存!");
			};
		</script>

		<!-- 달력 스크립트 -->
		<script>
			// 요소 가져오기
			var dateInput = document.getElementById("tenyuDateInput"); // type="date" (실제 전송용)
			var dateText = document.getElementById("tenyuDateText"); // 화면에 보이는 text
			var calendarIcon = document.getElementById("calendarIcon");

			// 아이콘 클릭하면 date 픽커 열기
			calendarIcon.onclick = function() {
				// showPicker 지원되는 브라우저에서만 호출
				if (dateInput.showPicker) {
					dateInput.showPicker();
				} else {
					// 구형 브라우저용 fallback
					dateInput.focus();
				}
			};

			// date에서 날짜 선택되면 텍스트 박스에 값 넣기
			dateInput.addEventListener("change",
					function() {
						// this.value 형식: yyyy-MM-dd
						var v = this.value;
						if (v) {
							var parts = v.split("-"); // [yyyy, MM, dd]
							// 화면에는 yyyy/MM/dd 형식으로 표시
							dateText.value = parts[0] + "/" + parts[1] + "/"
									+ parts[2];
						} else {
							dateText.value = "";
						}
					});
		</script>
</body>
</html>
