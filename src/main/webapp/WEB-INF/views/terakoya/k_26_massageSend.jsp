<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メッセージ送信</title>
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

/* 사원정보 행 스타일 */
.employee-info-row {
	display: flex;
	width: 1080px;
	margin: 10px auto 0 auto;
	border: 1px solid #a0a0a0;
}

.employee-info-row .label {
	background-color: #dddddd;
	padding: 8px 15px;
	font-size: 13px;
	border-right: 1px solid #a0a0a0;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	display: flex;
	align-items: center;
	white-space: nowrap;
	width: 80px;
	box-sizing: border-box;
}

.employee-info-row .value {
	background-color: #ffffff;
	padding: 5px 10px;
	font-size: 13px;
	border-right: 1px solid #a0a0a0;
	display: flex;
	align-items: center;
	gap: 5px;
	width: 120px;
	box-sizing: border-box;
}

.employee-info-row .value:last-child {
	border-right: none;
	flex: 1;
	width: auto;
}

.employee-info-row .value input {
	border: none;
	font-size: 13px;
	outline: none;
	background: transparent;
	width: 100%;
}

.search-btn {
	border: none;
	background: none;
	padding: 0;
	cursor: pointer;
}

.search-btn img {
	display: block;
	height: 22px;
	width: auto;
}

/* 메시지 영역 스타일 */
.message-area {
	display: flex;
	width: 1080px;
	margin: 10px auto;
	border: 1px solid #a0a0a0;
}

.message-area .msg-label {
	background-color: #dddddd;
	padding: 15px;
	font-size: 13px;
	width: 100px;
	display: flex;
	align-items: center;
	border-right: 1px solid #a0a0a0;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	box-sizing: border-box;
}

.message-area .msg-input {
	flex: 1;
	background-color: #ffffff;
	padding: 5px;
}

.message-area .msg-input textarea {
	width: 100%;
	height: 250px;
	border: none;
	resize: none;
	box-sizing: border-box;
	font-size: 13px;
	outline: none;
	font-family: inherit;
}
</style>

<body>
	<div class="header">
		<div style="display: flex; justify-content: space-between;">
			<div>
				<img src="/resources/img/logo.gif" alt="logo"
					style="display: block;">
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

	<!-- 탭 영역 (기존 유지) -->
	<div id="stepsArea">
		<div class="stepItem">代理申請</div>
		<div class="stepItem">付随書類管理</div>
		<div class="stepItem">異動情報確認</div>
		<div class="stepItem">
			社宅寺子屋<br>アップロード
		</div>
		<div class="stepItem active">
			メッセージ<br>送信
		</div>
		<div class="stepItem">
			メッセージ<br>履歴
		</div>
	</div>

	<!-- 사원정보 행 -->
	<div class="employee-info-row">
		<div class="label">社員番号</div>
		<div class="value">
			<input type="text" class="emp-no" value="1234567">
			<button type="button" class="search-btn" onclick="/* 검색 함수 */">
				<img src="<c:url value='/resources/img/ll/kensaku_btn01.gif'/>"
					alt="検索">
			</button>
		</div>
		<div class="label">社員名</div>
		<div class="value">
			<input type="text" class="emp-name" value="小林 ○○" readonly>
		</div>
		<div class="label">所属</div>
		<div class="value">
			<input type="text" class="emp-dept" value="さいたま店" readonly>
		</div>
	</div>

	<!-- 메시지 입력 영역 -->
	<div class="message-area">
		<div class="msg-label">メッセージ</div>
		<div class="msg-input">
			<textarea></textarea>
		</div>
	</div>

	<!-- 왼쪽 정렬 버튼 예제 -->
	<div class="button_Left"
		style="width: 1080px; margin: 10px auto 40px auto;">
		<div class="button_Left_Group">
			<img src="/resources/img/haishin_btn03.gif" alt="haishin_btn01">
			<img src="/resources/img/back_btn01.gif" alt="back_btn01">
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>