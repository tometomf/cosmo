<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>異動有無確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
/* [디자인/CSS 원본 유지] */
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

				<div style="display: flex; flex-direction: column; width: 1010px; margin: auto; padding-top: 40px; padding-bottom: 20px;">
					<div> 
						勤務地および住所に変更がありますか？<br> それぞれ選択して、「次へ」をクリックしてください。<br>
					</div>
					
					<div style="padding-top: 10px;">
						(注)異動にともなって転居がある方は、転居先が確定した後に申請してください。
					</div>
				</div>

				<c:if test="${not empty errorMessage}">
					<div style="color: red; margin-top: 10px; text-align: center; font-weight: bold;">
						※ ${errorMessage}
					</div>
				</c:if>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column1" style="padding-top: 10px; padding-bottom: 10px;">現勤務地 </div>
					<div class="form_Normal" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px;">
						<c:out value="${view.curKinmuPlace}" default="なし" />
					</div>
				</div>
				
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column1" style="padding-top: 10px; padding-bottom: 10px;">現住所</div>
					<div class="form_Normal" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px;">
						<c:out value="${view.curAddress}" default="なし" />
					</div>
				</div>
			</div>

			<form id="idoConfirmForm" action="<c:url value='/idoconfirm/next'/>" method="post">

				<input type="hidden" name="shinseiNo" value="${param.shinseiNo}" />

				<input type="hidden" name="alertType" value="<c:choose>
						<c:when test='${not empty param.alertType}'>${param.alertType}</c:when>
						<c:when test='${not empty alertType}'>${alertType}</c:when>
						<c:otherwise>JISHIN</c:otherwise> 
					</c:choose>" />
					<div class="content_Form1" style="width: 580px; margin-left: 3.1%;">

					<div class="form_Text1" id="form_Text2">
						<div class="form_Column"
							style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">勤務地が</div>
							
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

				<div class="button_Left">
					<div class="button_Left_Group">

						<button type="button" onclick="history.back()"
							style="border: none; background: none; padding: 0; cursor: pointer;">
							<img src="/resources/img/back_btn01.gif" alt="back_btn01">
						</button>

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

	<script>
		document.addEventListener('DOMContentLoaded', function() {

			const form = document.getElementById('idoConfirmForm');
			if (!form)
				return;

			form.addEventListener('submit', function(e) {

				const kinmu = document.querySelector('input[name="kinmuChange"]:checked');
				const jusho = document.querySelector('input[name="jushoChange"]:checked');

				if (!kinmu || !jusho) {
					alert("「勤務地が」「住所が」をそれぞれ選択してください.");
					e.preventDefault();
					return;
				}
			});
		});
	</script>
</body>
</html>