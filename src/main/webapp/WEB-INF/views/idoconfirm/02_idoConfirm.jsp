<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 
    [화면ID] 0200 異動有無確認 (이동유무확인)
    * 고객님 기존 HTML/CSS 레이아웃 및 일본어 텍스트를 유지하고, 로직 주석은 한국어입니다.
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>異動有無確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 5fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 1.2fr 1.2fr;
}

.form_Column1 {
	display: flex;
	align-items: center;
	color: white;
	background-color: #545454;
	border: solid 1px white;
	justify-content: center;
}

.form_Normal1 {
	border: solid 1px white;
	display: flex;
	gap: 5px;
}

.button_Left {
	margin-top: 50px;
}

.button_Left_Group {
	display: flex; /* 가로로 일렬 배치 */
	align-items: center; /* 세로 가운데 정렬 */
	gap: 24px; /* 버튼 사이 간격(px) */
}

=======
#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 5fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 1.2fr 1.2fr;
}

.form_Column1 {
	display: flex;
	align-items: center;
	color: white;
	background-color: #545454;
	border: solid 1px white;
	justify-content: center;
}

.form_Normal1 {
	border: solid 1px white;
	display: flex;
	gap: 5px;
}

.button_Left {
	margin-top: 30px !important;
}
</style>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main">
		<div class="main_title">
			<div class="subtitle">異動有無確認</div>

			<div
				style="display: flex; flex-direction: column; width: 1010px; margin: auto; padding-top: 40px; padding-bottom: 20px;">
				<div>
					勤務地および住所に変更がありますか？<br> それぞれ選択して、「次へ」をクリックしてください。<br>
				</div>
				<div style="padding-top: 10px;">
					(注)異動にともなって転居がある方は、転居先が確定した後に申請してください。</div>
			</div>

			<!-- 에러 메시지 표시 -->
			<c:if test="${not empty errorMessage}">
				<div style="color: red; margin-top: 10px; text-align: center;">
					${errorMessage}</div>
			</c:if>
		</div>

		<!-- ★★ 표시용 (현 근무지/현 주소) ★★ -->
		<div class="content_Form1">
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column1"
					style="padding-top: 10px; padding-bottom: 10px;">現勤務地</div>
				<div class="form_Normal"
					style="padding-top: 10px; padding-bottom: 10px;">
					東京都中野区本町3-30-4KDX中野坂上ビル8F
					<%-- 나중에 ${view.beforeKinmuAddr} 로 변경 예정 --%>
				</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column1"
					style="padding-top: 10px; padding-bottom: 10px;">現住所</div>
				<div class="form_Normal"
					style="padding-top: 10px; padding-bottom: 10px;">
					神奈川県川崎市高津区下作延1-2-3 レオパレス溝の口 103
					<%-- 나중에 ${view.beforeJusho} 로 변경 예정 --%>
				</div>
			</div>
		</div>

		<!-- ★★ 폼 영역: 라디오 + 버튼 ★★ -->
		<!-- form action: POST /idoconfirm/next -->
		<form id="idoConfirmForm" action="<c:url value='/idoconfirm/next'/>"
			method="post">
			<div class="content_Form1" style="width: 580px; margin-left: 3.1%;">

				<!-- 勤務地が -->
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						勤務地が</div>
					<div class="form_Normal"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="radio" name="kinmuChange" value="Y"
							<c:if test="${form.kinmuChange == 'Y'}">checked</c:if> /> 変わる
					</div>
					<div class="form_Normal"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="radio" name="kinmuChange" value="N"
							<c:if test="${form.kinmuChange == 'N'}">checked</c:if> /> 変わらない
					</div>
				</div>

				<!-- 住所が -->
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						住所が</div>
					<div class="form_Normal"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="radio" name="jushoChange" value="Y"
							<c:if test="${form.jushoChange == 'Y'}">checked</c:if> /> 変わる
					</div>
					<div class="form_Normal"
						style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="radio" name="jushoChange" value="N"
							<c:if test="${form.jushoChange == 'N'}">checked</c:if> /> 変わらない
					</div>
				</div>
			</div>

			<!-- 버튼 영역 -->
			<div class="button_Left">
				<div class="button_Left_Group">

					<!-- 뒤로가기 -->
					<button type="button" onclick="history.back()"
						style="border: none; background: none; padding: 0; cursor: pointer;">
						<img src="/resources/img/back_btn01.gif" alt="back_btn01">
					</button>

					<!-- 다음 (submit) -->
					<button type="submit"
						style="border: none; background: none; padding: 0; cursor: pointer;">
						<img src="/resources/img/next_btn01.gif" alt="next_btn01">
					</button>

				</div>
			</div>
		</form>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	<!-- ★★ 여기서부터 자바스크립트: 조합 체크 + 경고창 ★★ -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {

			const form = document.getElementById('idoConfirmForm');
			if (!form)
				return;

			form.addEventListener('submit', function(e) {

				const kinmu = document
						.querySelector('input[name="kinmuChange"]:checked');
				const jusho = document
						.querySelector('input[name="jushoChange"]:checked');

				// 아무 것도 안 고른 경우
				if (!kinmu || !jusho) {
					alert("「勤務地が」「住所が」をそれぞれ選択してください。");
					e.preventDefault();
					return;
				}

				const k = kinmu.value; // "Y" or "N"
				const j = jusho.value; // "Y" or "N"

				// ③ 勤務地:変わらない, 住所:変わる → 선택 불가능
				if (k === 'N' && j === 'Y') {
					alert("勤務先：変わらない、住所：変わる の組み合わせは選択できません。");
					e.preventDefault();
					return;
				}

				// ④ 勤務地:変わらない, 住所:変わらない → 선택 불가능
				if (k === 'N' && j === 'N') {
					alert("勤務先：変わらない、住所：変わらない の組み合わせは選択できません。");
					e.preventDefault();
					return;
				}

				// 나머지 조합(Y,Y / Y,N)은 그대로 submit → 컨트롤러에서 분기
			});
		});
	</script>
	>>>>>>> refs/remotes/origin/idoconfirm
</body>
</html>
