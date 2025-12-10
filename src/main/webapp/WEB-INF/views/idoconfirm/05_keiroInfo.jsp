<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>		<!-- 조우진 -->
<head>
<meta charset="UTF-8">
<title>通勤経路情報画面</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">



<style>
.keiro {
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: #EDEDED;
	border-top: 2px solid #3AC238; /* 박스 상단 녹색 줄 */
	padding-bottom: 20px;
	margin-bottom: 20px; /* 박스 사이 간격 추가 */
}

.keiro-box {
	border-bottom-right-radius: 5px;
	background: linear-gradient(to bottom, #C6F2BF, #ECFBEA);
	color: green;
	padding: 3px 20px;
	width: fit-content;
	border-bottom: 1px solid #86E378;
	border-right: 1px solid #86E378;
}

.keiro-header {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding: 0 0 5px 0;
}

.content_Form3 {
	width: 1010px;
	margin: auto;
	border: solid 1px #a0a0a0;
}

.content_Form4 {
	width: 400px;
	border: solid 1px #a0a0a0;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr;
	background-color: white;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 2fr 3fr;
	background-color: white;
}

#form_Text3 {
	display: grid;
	grid-template-columns: 1fr 4fr;
	background-color: white;
}

.form_Keiro {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
}

.form_Normal1 {
	border: solid 1px white;
	display: flex;
	gap: 5px;
}

.form_Normal2 {
	display: flex;
	background-color: #ECFBEA;
	width: 99.5%;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 5px;
}

.form_Normal3 {
	display: flex;
	width: 99.5%;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 5px;
}

.form_Column1 {
	display: flex;
	align-items: center;
	color: white;
	background-color: #545454;
	border: solid 1px white;
	justify-content: center;
}

.form_Column2 {
	background-color: #dddddd;
	display: flex;
	align-items: center;
	justify-content: center;
}

.form_Text2>div {
	min-width: 25px;
	text-align: left;
	font-size: 13px;
	align-items: center;
}
/* 레이아웃 보조 */
.content_Form1 {
	width: 1010px;
	margin: auto;
	border: solid 1px #a0a0a0;
	margin-top: -1px;
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
	
			<div class="main_Content">
				<div
					style="display: flex; justify-content: space-between; margin-bottom: 10px;">
					<div>
						自動車・徒歩・自転車は、住所から勤務地まで、その手段のみを利用する場合に限ります。<br>
						電車・バスは、複数手段の利用(乗り継ぎ)が可能です。<br>
						複数手段を利用する場合、手段ごとに経路を分割して登録してください。
					</div>
					<div>
						<button type="button" onclick="reflectAddress()"
								style="border: none; background: none; cursor: pointer;">
								<img src="/resources/img/map_mini_btn01.gif" alt="kakunin">
							</button>
					</div>
				</div>


				<div class="keiro">

					<div class="keiro-header">
						<div class="keiro-box">経路1</div>
						<div
							style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;">
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="변경">
								<div style="white-space: nowrap;">変更する</div>
							</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/clear_icon.gif" alt="삭제">
								<div style="white-space: nowrap;">削除する</div>
							</div>
						</div>
					</div>

					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">自動車</div>
						</div>
					</div>

					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3" style="height: 60px;">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">



								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="시작">
									神奈川県川崎市中原区新丸子 1-2-3
								</div>
								<div class="form_Normal3">
									<img src="/resources/img/tn/icon_keiro_02.gif" alt="종료">
									東京都中野区本町 3-30-4
								</div>


							</div>
						</div>
					</div>

				</div>

				<div class="keiro">

					<div class="keiro-header">
						<div class="keiro-box">経路1</div>
						<div
							style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;">
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="변경">
								<div style="white-space: nowrap;">変更する</div>
							</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/clear_icon.gif" alt="삭제">
								<div style="white-space: nowrap;">削除する</div>
							</div>
						</div>
					</div>

					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">bus</div>
						</div>
					</div>

					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3" style="height: 60px;">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">



								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="시작">
									test
								</div>
								<div class="form_Normal3">
									<img src="/resources/img/tn/icon_keiro_02.gif" alt="종료">
									test1
								</div>


							</div>
						</div>
					</div>

				</div>

				<div class="keiro">

					<div class="keiro-header">
						<div class="keiro-box">経路2</div>
						<div
							style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;">
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="변경">
								<div style="white-space: nowrap;">変更する</div>
							</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/clear_icon.gif" alt="삭제">
								<div style="white-space: nowrap;">削除する</div>
							</div>
						</div>
					</div>

					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">電車</div>
						</div>
					</div>

					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">



								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="시작">

									宮崎台駅
								</div>

								<div class="form_Normal3"
									style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東急田園都市線</div>


								<div class="form_Normal2">渋谷駅</div>

								<div class="form_Normal3"
									style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東京メトロ半蔵門線</div>


								<div class="form_Normal2">大手町</div>

								<div class="form_Normal3"
									style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東京メトロ丸の内線</div>


								<div class="form_Normal2">

									<img src="/resources/img/tn/icon_keiro_02.gif" alt="종료">
									東京駅
								</div>





							</div>
						</div>
					</div>

				</div>



				<div class="keiro">
					<div class="keiro-header">
						<div class="keiro-box">経路追加</div>
						<div
							style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;">
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="추가">
								<div style="white-space: nowrap;">追加する</div>
							</div>
						</div>
					</div>
				</div>


				<div class="content_Form4" style="margin-top: 20px;">
					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">経路変更日</div>
						<div class="form_Normal3">
							<input type="date" name="changeDate" value=""> <img
								src="/resources/img/cal_icon.gif" alt="달력">
						</div>
					</div>
				</div>

				<div class="button_Left_Group" style="margin-top: 20px;">
					<img src="/resources/img/back_btn01.gif" alt="뒤로"> <img
						src="/resources/img/next_btn01.gif" alt="다음"> <img
						src="/resources/img/hozon_btn01.gif" alt="저장">
				</div>

			</div>
		</div>





		<meta charset="UTF-8">
		<title>title</title>
		<link rel="stylesheet" href="/resources/css/main.css" type="text/css">


		<div class="footer">
			<div>Copyright (c) 2010-2012 Leopalace leasing Corporation. All
				Right Reserved.</div>
		</div>



	</div>
</body>
</html>