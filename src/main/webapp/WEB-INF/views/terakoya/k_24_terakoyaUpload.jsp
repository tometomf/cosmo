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
</style>

<body>
	<div class="header">
		<div style="display: flex; justify-content: space-between;">
			<div>
				<img src="/resources/img/logo.gif" alt="logo"
					style="display: block;">
			</div>
			<div>
				<img src="/resources/img/ll/head_btn01.gif" alt=""> <img
					src="/resources/img/ll/head_btn02.gif" alt=""> <img
					src="/resources/img/ll/head_btn03.gif" alt=""> <img
					src="/resources/img/ll/head_btn04_sel.gif" alt="">
			</div>
		</div>
		<div>
			<div class="userName">
				<div>ログイン名:</div>
				<div style="font-weight: bold;"></div>
			</div>
			<div class="header_Btn">
				<img src="/resources/img/logout_btn.gif" alt="logout_btn">
			</div>
		</div>
		<div class="userInfo">
			<div>
				<div class="userInfo_Title">法人名</div>
				<div class="userInfo_Text"></div>
			</div>
			<div>
				<div class="userInfo_Title">現在の支給月</div>
				<div class="userInfo_Text"></div>
			</div>
		</div>
	</div>
	<div id="stepsArea">
		<div class="stepItem">代理申請</div>
		<div class="stepItem">付随書類管理</div>
		<div class="stepItem">異動情報確認</div>
		<div class="stepItem active">
			社宅寺子屋<br>アップロード
		</div>
		<div class="stepItem">
			メッセージ<br>送信
		</div>
		<div class="stepItem">
			メッセージ<br>履歴
		</div>

	</div>

	<div class="content_Form1" style="width: 1080px; margin: 0 auto;">



		<div class="form_Title1"
			style="display: grid; grid-template-columns: 1fr;">
			<div style="text-align: left; padding-left: 8px;">絞り込み条件</div>
		</div>


		<div class="form_Text1"
			style="display: grid; grid-template-columns: 200px 880px;">

			<div class="form_Column">社宅寺子屋データ</div>

			<div class="form_Normal">
				<div style="display: flex; align-items: center;">


					<input type="text" id="shatakuFileName" readonly
						style="width: 50%; max-width: 200px; height: 24px; border: 1px solid #a0a0a0; box-sizing: border-box;">


					<button type="button"
						onclick="document.getElementById('shatakuFile').click();"
						style="height: 24px; padding: 0 10px; font-size: 12px; white-space: nowrap;">
						参照...</button>

					<input type="file" id="shatakuFile" name="shatakuFile"
						style="display: none;"
						onchange="document.getElementById('shatakuFileName').value = this.files.length ? this.files[0].name : '';">
				</div>
			</div>
		</div>
	</div>

	<!-- 가운데 버튼 예제 -->
	<div class="button_Center">
		<div class="button_Center_Group">
			<div>
				<img src="/resources/img/up_btn01.gif" alt="up_btn01">
			</div>
		</div>
	</div>

	<!-- 오른쪾 정렬 버튼 예제 -->
	<div class="button_Right">
		<div class="button_Right_Group">
			<div>필요한경우 글자 넣기 아니면 빼기</div>
			<img src="/resources/img/dl_btn01.gif" alt="dl_btn01">
		</div>
	</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
