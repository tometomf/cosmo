<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住所入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

<style>
/* 기존 JSP의 스타일을 유지합니다. */
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

			<form action="<c:url value='/idoconfirm/addressinput' />"
				method="post">

				<div class="content_Form1">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column2">住所</div>
						<div class="form_Normal">大阪府大阪市東淀川区瑞光1－1－1ハイツ瑞光３０２</div>

						<div class="form_Normal">
							<button type="submit" name="reflect" value="Y"
								style="border: none; background: none; cursor: pointer;">
								<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映">
							</button>
						</div>
					</div>
				</div>
			</form>

			<div class="content_Form1">

				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>現住所</div>
					<div>新住所</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">郵便番号</div>
					<div class="form_Normal">213-0001</div>

					<div class="form_Normal">
						<input type="text" value="211" class="zipcode" name="zip1" size="4" maxlength="3">
						<div>-</div>
						<input type="text" value="0001" class="zipcode" name="zip2" size="5" maxlength="4" 
							onKeyUp="AjaxZip3.zip2addr('zip1','zip2','pref','addr1');">
						<button type="button" class="search_btn">検索</button>
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">都道府県</div>
					<div class="form_Normal">神奈川県</div>

					<div class="form_Normal">
						<input type="text" name="pref" value="神奈川県" class="zipcode2">
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">市区町村～番地</div>
					<div class="form_Normal">川崎市高津区上作延1-2-3</div>
					<div class="form_Normal">
						<input type="text" name="addr1" value="川崎市高津区上作延1-2-3"
							class="zipcode2">
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">建物名～号室</div>
					<div class="form_Normal">レオパレス溝の口103</div>
					<div class="form_Normal_mid">
						<input type="text" name="addr2" value="レオパレス新丸子201"
							class="zipcode2">
					</div>
				</div>

			</div>

			<div class="content_Form3">
				<div class="form_Text1" id="form_Text4">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">

						<input type="date" name="tenyuDate" id="tenyuDateInput"
							style="display: none;">

						<input type="text" id="tenyuDateText" value="2013/04/13">

						<img src="/resources/img/cal_icon.gif" id="calendarIcon"
							style="cursor: pointer;" alt="Calendar Icon">
						</div>
					</div>
				</div>
			</div>

			<div class="button_Left">
				<div class="button_Left_Group" style="display:flex; gap:10px;">
					<button type="button"
						style="border:none; background:none; padding:0; cursor:pointer;"
						onclick="goBack()">
						<img src="/resources/img/back_btn01.gif" alt="戻る">
					</button>

					<button type="button"
						style="border:none; background:none; padding:0; cursor:pointer;"
						onclick="goNext()">
						<img src="/resources/img/next_btn01.gif" alt="次へ">
					</button>

					<button type="button"
						style="border:none; background:none; padding:0; cursor:pointer;"
						onclick="goTempSave()">
						<img src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</button>
				</div>
			</div>

		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		// AjaxZip3는 onKeyUp 이벤트로 작동하기 때문에 별도의 JavaScript 검색 로직은 제거했습니다.
		
		// 달력 스크립트 (기존 로직 유지)
		var dateInput = document.getElementById("tenyuDateInput");
		var dateText = document.getElementById("tenyuDateText"); 
		var calendarIcon = document.getElementById("calendarIcon");

		calendarIcon.onclick = function() {
			if (dateInput.showPicker) {
				dateInput.showPicker();
			} else {
				dateInput.focus();
			}
		};

		dateInput.addEventListener("change",
				function() {
					var v = this.value;
					if (v) {
						var parts = v.split("-");
						dateText.value = parts[0] + "/" + parts[1] + "/"
								+ parts[2];
					} else {
						dateText.value = "";
					}
				});
		
		// 하단 버튼 함수 (기존 로직 유지)
		function goBack() {
			history.back();
		}

		function goNext() {
			// 실제 유효성 검사 (위도/경도, 거리 체크) 로직은 여기에 추가되어야 합니다.
			location.href = "<c:url value='/idoconfirm/keiroInfo' />";
		}

		function goTempSave() {
			alert("一時保存しました。");
			// 실제 서버 통신 로직은 여기에 추가되어야 합니다.
		}

    </script>
</body>
</html>