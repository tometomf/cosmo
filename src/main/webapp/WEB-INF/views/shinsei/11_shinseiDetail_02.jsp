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
					<div>一時保存中</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">一時保存日</div>
					<div>2018/07/30</div>
				</div>
			</div>

			<!-- 링크 나중에 수정해야됨 -->
			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="location.href='/'"> <img
						src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01"
						onclick="location.href='/'">
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
					<div class="form_Normal">${ichiji.genAddress}</div>
					<div class="form_Normal">${ichiji.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${ichiji.genShozoku}</div>
					<div class="form_Normal">${ichiji.newShozoku}</div>

				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${ichiji.genKinmuchi}</div>
					<div class="form_Normal">${ichiji.newKinmuchi}</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">${ichiji.keiro.shudanName}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${ichiji.shinseiName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${ichiji.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移転日</div>
					<div class="form_Normal">${ichiji.idoYmd}/ ${ichiji.itenYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${ichiji.tennyuYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">${ichiji.riyoStartYmd}</div>
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
