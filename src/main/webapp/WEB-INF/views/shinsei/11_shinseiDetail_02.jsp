<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<div>${empty jyohou? '一時保存中' : jyohou.codeNm}</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">一時保存日</div>
					<div>${hozon.addDate}</div>
				</div>
			</div>

			<!-- 링크 나중에 수정해야됨 -->
			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="location.href='/'"> <img
						src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01"
						 onclick="location.href='/shinsei/reload?hozonUid=${hozonUid}'">
				</div>
				<div class="button_Side_Group">
					<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
						onclick="location.href='/shinsei/torikesu?hozonUid=${hozonUid}'">
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
					<div class="form_Normal">${empty jyohou ? ichiji.genAddress : jyohou.genAddress}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newAddress : jyohou.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${empty jyohou ? ichiji.genShozoku : jyohou.genShonzoku}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newShozoku : jyohou.newShonzoku}</div>

				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${empty jyohou ? ichiji.genKinmuchi : jyohou.genKinmuchi}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newKinmuchi : jyohou.newKinmuchi}</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">${empty keiro ? ichiji.keiro.shudanName : keiro.shudanName}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${empty jyohou ? ichiji.shinseiName : jyohou.shinseiName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${empty jyohou ? ichiji.riyu : jyohou.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
    				<div class="form_Column">異動日/移転日</div>
    				<div class="form_Normal">
        				<c:set var="ido"  value="${empty jyohou ? ichiji.idoYmd  : jyohou.idoYmd}" />
        				<c:set var="iten" value="${empty jyohou ? ichiji.itenYmd : jyohou.itenYmd}" />

					        <c:if test="${not empty ido}">${ido}</c:if>
							 <c:if test="${not empty ido and not empty iten}">/</c:if>
      							  <c:if test="${not empty iten}">${iten} </c:if>
   					 </div>
				</div>


				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${empty jyohou ? ichiji.tennyuYmd : jyohou.tennyuYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">${empty jyohou ? ichiji.riyoStartYmd : jyohou.riyoStartYmd}</div>
				</div>
			</div>

			<!-- 링크 나중에 사원톱메뉴로 수정 -->
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
