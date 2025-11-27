<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 하나 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一時保存中案件 詳細</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Title2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}
</style>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<div class="subtitle">
					<div>一時保存中案件 詳細</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">状況</div>
					<div>${empty view? '一時保存中' : view.codeNm}</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">一時保存日</div>
					<div>${empty view? hozon.addDate : view.shinseiYmd}</div>
				</div>
			</div>

			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="location.href='/'"> <img
						src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01"
						onclick="location.href='/shinsei/reload?hozonUid=${hozonUid}'">
				</div>
				<div class="button_Side_Group">
					<c:choose>
						<c:when test="${not empty view and not empty view.shinseiNo}">
							<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
								onclick="location.href='/shinsei/torikesu?no=${view.shinseiNo}'">
						</c:when>
						<c:otherwise>
							<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
								onclick="location.href='/shinsei/torikesu?hozonUid=${hozonUid}'">
						</c:otherwise>
					</c:choose>
				</div>

			</div>


			<div class="content_Form1">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal">${empty view ? ichiji.genAddress : view.genAddress}</div>
					<div class="form_Normal">${empty view ? ichiji.newAddress : view.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${empty view ? ichiji.genShozoku : view.genShozoku}</div>
					<div class="form_Normal">${empty view ? ichiji.newShozoku : view.newShozoku}</div>

				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${empty view ? ichiji.genKinmuchi : view.genKinmuchi}</div>
					<div class="form_Normal">${empty view ? ichiji.newKinmuchi : view.newKinmuchi}</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路&#${9311 + (empty view.keiroSeq ? 0 : view.keiroSeq)};</div>

					<c:choose>
						<c:when test="${view.tsukinShudan eq '1' }">
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">${empty view ? ichiji.keiro.shudanName : view.shudanName}</div>
				</div>
			</div>
			</c:when>
			</c:choose>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${empty view ? ichiji.shinseiName : view.shinseiName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${empty view ? ichiji.riyu : view.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移転日</div>
					<div class="form_Normal">
						<c:set var="ido"
							value="${empty view ? ichiji.idoYmd  : view.idoYmd}" />
						<c:set var="iten"
							value="${empty view ? ichiji.itenYmd : view.itenYmd}" />

						<c:if test="${not empty ido}">${ido}</c:if>
						<c:if test="${not empty ido and not empty iten}">/</c:if>
						<c:if test="${not empty iten}">${iten} </c:if>
					</div>
				</div>


				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${empty view ? ichiji.tennyuYmd : view.tennyuYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">${empty view ? ichiji.riyoStartYmd : view.riyoStartYmd}</div>
				</div>
			</div>

			<div class="button_Left">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="location.href='/'">
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>
