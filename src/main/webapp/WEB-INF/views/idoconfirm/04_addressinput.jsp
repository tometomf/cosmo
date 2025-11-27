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
	margin-top: 30px !important;
}

.content_Form3 {
	width: 400px;
	margin-left: 35px;
	border: solid 1px #a0a0a0;
	margin-top: 30px !important;
}

.button_Left {
	display: flex;
	gap: 10px;
	margin-top: 20px;
	margin-right: 30px;
	margin-top: 30px !important;
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

/* 알림/에러 메시지 스타일 */
.error-msg {
	color: red;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 10px;
}

.info-msg {
	color: blue;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 10px;
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

			<c:if test="${not empty errorMessage}">
				<div class="error-msg">${errorMessage}</div>
			</c:if>
			<c:if test="${not empty message}">
				<div class="info-msg">${message}</div>
			</c:if>

			<form action="<c:url value='/idoconfirm/addressinput' />"
				method="post">

				<div class="content_Form1">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column2">住所</div>

						<div class="form_Normal">
							${view.middlePref} ${view.middleAddr1} ${view.middleAddr2} <input
								type="hidden" id="h_middleZip" value="${view.middleZip}" /> <input
								type="hidden" id="h_middlePref" value="${view.middlePref}" /> <input
								type="hidden" id="h_middleAddr1" value="${view.middleAddr1}" />
							<input type="hidden" id="h_middleAddr2"
								value="${view.middleAddr2}" />
						</div>

						<div class="form_Normal">
							<button type="button" onclick="reflectAddress()"
								style="border: none; background: none; cursor: pointer;">
								<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映">
							</button>
						</div>
					</div>
				</div>

				<div class="content_Form1">

					<div class="form_Title1" id="form_Title1">
						<div></div>
						<div>現住所</div>
						<div>新住所</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">郵便番号</div>
						<div class="form_Normal">${view.currentZip}</div>

						<div class="form_Normal">
							<input type="text" name="zip1" id="newZip1"
								value="${addressInputForm.zip1}" class="zipcode" size="4"
								maxlength="3"> - <input type="text" name="zip2"
								id="newZip2" value="${addressInputForm.zip2}" class="zipcode"
								size="5" maxlength="4">

							<button type="button" class="search_btn"
								onclick="AjaxZip3.zip2addr('zip1','zip2','pref','addr1');">
								検索</button>
						</div>
					</div>
					<div></div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">都道府県</div>
						<div class="form_Normal">${view.currentPref}</div>

						<div class="form_Normal">
							<input type="text" name="pref" id="newPref"
								value="${addressInputForm.pref}" class="zipcode2">
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">市区町村～番地</div>
						<div class="form_Normal">${view.currentAddr1}</div>
						<div class="form_Normal">
							<input type="text" name="addr1" id="newAddr1"
								value="${addressInputForm.addr1}" class="zipcode2">
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">建物名～号室</div>
						<div class="form_Normal">${view.currentAddr2}</div>
						<div class="form_Normal_mid">
							<input type="text" name="addr2" id="newAddr2"
								value="${addressInputForm.addr2}" class="zipcode2">
						</div>
					</div>

				</div>

				<div class="content_Form3">
					<div class="form_Text1" id="form_Text4">
						<div class="form_Column">転入日</div>
						<div class="form_Normal">
							<input type="date" name="tenyuDate" id="tenyuDateInput"
								value="${addressInputForm.tenyuDate}" style="display: none;">

							<input type="text" id="tenyuDateText" readonly> <img
								src="/resources/img/cal_icon.gif" id="calendarIcon"
								style="cursor: pointer;" alt="Calendar Icon">
						</div>
					</div>
				</div>
				<div class="button_Left">
					<div class="button_Left_Group" style="display: flex; gap: 10px;">
						<button type="button"
							style="border: none; background: none; padding: 0; cursor: pointer;"
							onclick="goBack()">
							<img src="/resources/img/back_btn01.gif" alt="戻る">
						</button>

						<button type="submit" name="action" value="next"
							style="border: none; background: none; padding: 0; cursor: pointer;">
							<img src="/resources/img/next_btn01.gif" alt="次へ">
						</button>

						<button type="submit" name="action" value="tempsave"
							style="border: none; background: none; padding: 0; cursor: pointer;">
							<img src="/resources/img/hozon_btn01.gif" alt="一時保存">
						</button>
					</div>
				</div>
		</div>

		</form>

	</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
		// ==========================================
		// ★ [핵심 3] 주소 반영 스크립트 (이 주소를 반영 버튼 클릭 시) ★
		// ==========================================
		function reflectAddress() {
			// 1. 숨겨둔 값 가져오기 (DB에서 온 중간주소)
			var zip = document.getElementById("h_middleZip").value;
			var pref = document.getElementById("h_middlePref").value;
			var addr1 = document.getElementById("h_middleAddr1").value;
			var addr2 = document.getElementById("h_middleAddr2").value;

			// 2. 우편번호 처리 (하이픈 제거 후 앞3/뒤4 분리)
			if (zip) {
				var cleanZip = zip.replace(/-/g, ""); // 하이픈 제거
				if (cleanZip.length >= 3) {
					document.getElementById("newZip1").value = cleanZip
							.substring(0, 3);
					document.getElementById("newZip2").value = cleanZip
							.substring(3);
				} else {
					document.getElementById("newZip1").value = cleanZip;
				}
			}

			// 3. 나머지 주소 값 채워넣기 (신주소 입력란)
			document.getElementById("newPref").value = pref; // 도도부현
			document.getElementById("newAddr1").value = addr1; // 시구정촌
			document.getElementById("newAddr2").value = addr2; // 건물명

			// (선택사항) 반영되었다는 알림
			// alert("住所が反映されました。");
		}

		// ==========================================
		// 날짜 처리 스크립트
		// ==========================================
		var dateInput = document.getElementById("tenyuDateInput");
		var dateText = document.getElementById("tenyuDateText");
		var calendarIcon = document.getElementById("calendarIcon");

		// 1. 페이지 로드 시: 저장된 날짜가 있으면 텍스트 박스에도 보여주기
		window.onload = function() {
			var v = dateInput.value; // YYYY-MM-DD
			if (v) {
				var parts = v.split("-");
				// YYYY/MM/DD 형식으로 변환해서 보여줌
				dateText.value = parts[0] + "/" + parts[1] + "/" + parts[2];
			}
		};

		// 2. 달력 아이콘 클릭 시
		calendarIcon.onclick = function() {
			if (dateInput.showPicker) {
				dateInput.showPicker(); // 브라우저 달력 띄우기
			} else {
				dateInput.focus();
			}
		};

		// 3. 달력에서 날짜를 선택했을 때
		dateInput.addEventListener("change", function() {
			var v = this.value; // YYYY-MM-DD
			if (v) {
				var parts = v.split("-");
				dateText.value = parts[0] + "/" + parts[1] + "/" + parts[2];
			} else {
				dateText.value = "";
			}
		});

		function goBack() {
			history.back();
		}
	</script>
</body>
</html>