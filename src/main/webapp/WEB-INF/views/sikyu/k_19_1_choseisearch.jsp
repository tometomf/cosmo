<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>調整金 社員検索画面</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
#stepsArea {
	display: flex;
	gap: 5px;
	width: 1080px;
	margin: 0 auto;
	border-bottom: 2px solid #b5a6ff;
	margin-top: 10px;
}

.stepItem {
	width: 130px;
	padding: 10px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	background: linear-gradient(180deg, #ffffff 0%, #ffffff 30%, #e1e1e1 100%);
	font-size: 13px;
	color: #666;
	border: 1px solid #a8a8a8;
	user-select: none;
	align-items: center;
	text-align: center;
	text-align: center;
}

.stepItem.active {
	background: linear-gradient(180deg, #ffffff 0%, #f8f6ff 30%, #c6baff 70%);
	color: #4a36c5;
	font-weight: bold;
	border: 2px solid #d6cdff;
	border-bottom: none;
	position: relative;
	top: 1px;
	z-index: 2;
}

/* 🔹 content_Form1 padding 제거 (여백때문에 티나던 부분) */
#fullFormArea .content_Form1 {
	width: 1080px;
	margin: auto;
	border: solid 1px #a0a0a0;
	padding: 0; /* ← 여백 삭제 */
	box-sizing: border-box;
}

/* 🔹 새로운 Form Text Line */
.form_Text3 {
	display: grid;
	grid-template-columns: 120px 400px 120px 400px;
	width: 1080px;
	border: 1px solid #a0a0a0;
	border-top: none;
	box-sizing: border-box;
}

/* 컬럼 공통 */
.form_Text3 .form_Column {
	background: #dddddd;
	padding: 5px;
	display: flex;
	align-items: center;
	border-right: 1px solid #a0a0a0;
}

/* 값 영역 */
.form_Text3 .form_Normal {
	padding: 5px;
	display: flex;
	align-items: center;
	position: relative;
	border-right: 1px solid #a0a0a0;
}

.form_Text3 .form_Column, .form_Text3 .form_Normal {
	font-size: 13px;
}

/* 마지막 칸 border 제거 */
.form_Text3 .form_Normal:last-child {
	border-right: none;
}

/* 이미지만 가운데 */
.form_Text3 .form_Normal img {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
</style>
<body>

	<%@ include file="/WEB-INF/views/common/header_ll.jsp"%>

	<div id="stepsArea">
		<div class="stepItem">
			支給データ<br>作成
		</div>
		<div class="stepItem">一括支給停止</div>
		<div class="stepItem">
			支給データ<br>ダウンロード
		</div>
		<div class="stepItem">支給管理 一覧</div>
		<div class="stepItem active">調整金登録</div>
		<div class="stepItem">
			支給データ<br>UL/DL
		</div>
		<div class="stepItem">
			支給データ<br>ロック
		</div>
	</div>

	<div class="layout">
		<div class="main">
			<div class="button_Center">
				<div class="button_Center_Group" style="margin-top: 50px;">
					<img src="/resources/img/choseidl_btn01.gif" alt="choseidl_btn01"
						onclick="location.href='/'">
				</div>
			</div>

			<div id="fullFormArea">
				<div class="content_Form1">
					<div class="form_Text3">
						<div class="form_Column">社員番号</div>
						<div class="form_Normal">
							<span style="padding-left: 5px;">1255</span> <img
								src="/resources/img/ll/search_btn02.gif" class="searchBtn"
								onclick="location.href='/'">
						</div>

						<div class="form_Column">社員名</div>
						<div class="form_Normal">
							<span style="padding-left: 5px;">1255</span>
						</div>
					</div>

				</div>
			</div>

			<div class="button_Right_Group">
				<img src="/resources/img/new_btn01.gif" onclick="location.href='/'">
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>

</body>

</html>