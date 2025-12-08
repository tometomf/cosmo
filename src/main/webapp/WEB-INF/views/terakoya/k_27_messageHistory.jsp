<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メッセージ履歴</title>
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


.search-section {
	width: 1080px;
	margin: 15px auto 0 auto;
	border: 1px solid #a0a0a0;
}

.search-title {
	background-color: #595860;
	color: #ffffff;
	padding: 5px 10px;
	font-size: 13px;
	font-weight: bold;
}

.search-row {
	display: flex;
	border-bottom: 1px solid #a0a0a0;
}

.search-row:last-child {
	border-bottom: none;
}

.search-label {
	background-color: #dddddd;
	padding: 8px 15px;
	font-size: 13px;
	width: 100px;
	display: flex;
	align-items: center;
	border-right: 1px solid #a0a0a0;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	box-sizing: border-box;
}

.search-input {
	background-color: #ffffff;
	padding: 5px 10px;
	font-size: 13px;
	flex: 1;
	display: flex;
	align-items: center;
	gap: 10px;
}

.search-input input[type="text"] {
	border: 1px solid #a0a0a0;
	padding: 3px 5px;
	font-size: 13px;
}

.search-input select {
	border: 1px solid #a0a0a0;
	padding: 3px 5px;
	font-size: 13px;
}

.search-input .hint {
	color: #666;
	font-size: 12px;
}

.calendar-icon {
	cursor: pointer;
	vertical-align: middle;
}


.search-btn-area {
	text-align: center;
	padding: 10px 0;
	background-color: #ffffff;
}

.search-btn-area img {
	cursor: pointer;
}


.result-table {
	width: 1080px;
	margin: 15px auto 0 auto;
	border-collapse: collapse;
	font-size: 13px;
}

.result-table th {
	background-color: #595860;
	color: #ffffff;
	padding: 8px 10px;
	text-align: center;
	border: 1px solid #a0a0a0;
	font-weight: bold;
}

.result-table th img {
	margin-left: 5px;
	vertical-align: middle;
}

.result-table td {
	padding: 8px 10px;
	border: 1px solid #a0a0a0;
	background-color: #ffffff;
}

.result-table td.center {
	text-align: center;
}

.result-table td a {
	color: #0000ff;
	text-decoration: underline;
}

.result-table td input[type="checkbox"] {
	cursor: pointer;
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
		<div class="stepItem">
			社宅寺子屋<br>アップロード
		</div>
		<div class="stepItem">
			メッセージ<br>送信
		</div>
		<div class="stepItem active">
			メッセージ<br>履歴
		</div>
	</div>


	<div class="search-section">
		<div class="search-title">絞り込み条件</div>

		<div class="search-row">
			<div class="search-label">社員番号</div>
			<div class="search-input">
				<input type="text" style="width: 150px;">
			</div>
		</div>

		<div class="search-row">
			<div class="search-label">検索キーワード</div>
			<div class="search-input">
				<input type="text" style="width: 150px;"> <span class="hint">※勤務先、社員名から検索します。スペースで区切ると複数条件をand検索します。</span>
			</div>
		</div>

		<div class="search-row">
			<div class="search-label">日付検索</div>
			<div class="search-input">
				<select style="width: 130px;">
					<option value="">--------------</option>
					<option value="sendDate">送信日</option>
				</select> <input type="text" style="width: 100px;"> <img
					src="<c:url value='/resources/img/cal_icon.gif'/>" alt="カレンダー"
					class="calendar-icon"> <span>～</span> <input type="text"
					style="width: 100px;"> <img
					src="<c:url value='/resources/img/cal_icon.gif'/>" alt="カレンダー"
					class="calendar-icon"> <span class="hint">（例）1985/09/15）</span>
			</div>
		</div>

		<div class="search-btn-area">
			<img src="<c:url value='/resources/img/ll/search_btn01.gif'/>"
				alt="この条件で絞り込む" onclick="/* 검색 함수 */">
		</div>
	</div>

	<table class="result-table">
		<thead>
			<tr>
				<th style="width: 100px;">社員番号<br>
				<img src="<c:url value='/resources/img/sort_btn01.gif'/>" alt="ソート"></th>
				<th style="width: 150px;">社員名<br>
				<img src="<c:url value='/resources/img/sort_btn01.gif'/>" alt="ソート"></th>
				<th style="width: 100px;">送信日<br>
				<img src="<c:url value='/resources/img/sort_btn01.gif'/>" alt="ソート"></th>
				<th>メッセージ<br>
				<img src="<c:url value='/resources/img/sort_btn01.gif'/>" alt="ソート"></th>
				<th style="width: 50px;">削除<br>
				<img src="<c:url value='/resources/img/sort_btn01.gif'/>" alt="ソート"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="center"><a href="#">10000123</a></td>
				<td>山田 太郎</td>
				<td class="center">2014/04/15</td>
				<td></td>
				<td class="center"><input type="checkbox"></td>
			</tr>
			<tr>
				<td class="center"><a href="#">10000126</a></td>
				<td>山田 四郎</td>
				<td class="center">2014/04/21</td>
				<td></td>
				<td class="center"><input type="checkbox"></td>
			</tr>
		</tbody>
	</table>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>