<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
#main_Content {
	display: flex;
	flex-direction: column;
	align-items: center; /* 전체를 가운데 정렬 */
	gap: 15px;
	margin-top: 30px;
}

#main_Content>div {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	width: 750px; /* 중앙정렬 기준 폭, 필요에 따라 조정 */
}

#main_Content>div>div:first-child {
	width: 225px; /* 버튼 영역 고정 */
	text-align: right; /* 버튼 오른쪽 정렬 (선택사항) */
}

#main_Content img {
	cursor: pointer;
	display: block;
}

#main_Content>div>div:last-child {
	flex: 1;
}

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

			<div class="content_Form1" style="margin-top: 25px;">
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">状況</div>
					<div>一時保存中</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">一時保存日</div>
					<div>2018/07/30</div>
				</div>
			</div>

			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"> <img
						src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01">
				</div>
				<div class="button_Side_Group">
					<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
					onclick="location.href='/shinsei/torikesu'">
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
					<div class="form_Normal">川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
					<div class="form_Normal">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">中野店</div>
					<div class="form_Normal">江戸川店</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div class="form_Normal">東京都江戸川区船堀2-1-5</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal"></div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal"></div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移動日</div>
					<div class="form_Normal"></div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal"></div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal"></div>
				</div>
			</div>

			<div class="button_Left">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01">
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>
