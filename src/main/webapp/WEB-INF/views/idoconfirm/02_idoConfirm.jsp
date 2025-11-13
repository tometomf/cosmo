<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>申請内容選択</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
body {
	font-family: "Meiryo", "Hiragino Kaku Gothic ProN", "Noto Sans JP", sans-serif;
	background-color: #fff;
	color: #333;
	margin: 40px;
}

.wrapper {
	width: 800px;
	margin: 0; /* 가운데 정렬 제거 → 왼쪽으로 이동 */
}

.button-group {
	display: flex;
	justify-content: flex-start; /* 왼쪽 정렬 */
	align-items: center;
	gap: 10px;
	margin-top: 20px;
	margin-left: 0; /* 필요시 왼쪽 여백 제거 */
}


/* 공통 테이블 스타일 */
table {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 25px;
	border: 1px solid #ccc;
}

th {
	background-color: #666;
	color: white;
	width: 160px;
	padding: 10px 14px;
	text-align: left;
	vertical-align: top;
}

td {
	background-color: #fff;
	padding: 10px 14px;
	border-left: 1px solid #ccc;
	font-size: 15px;
	line-height: 1.6;
}

/* 상단 정보 테이블 */
.info-table tr + tr th, .info-table tr + tr td {
	border-top: 1px solid #ccc;
}

/* 하단 변경 여부 테이블 */
.change-table th {
	background-color: #eee;
	color: #333;
	width: 160px;
	padding: 12px 14px;
	font-weight: 600;
}

.change-table td {
	background-color: #fff;
	padding: 12px 16px;
}

.change-table tr + tr th, .change-table tr + tr td {
	border-top: 1px solid #ccc;
}

label {
	margin-right: 20px;
	font-size: 15px;
}

input[type="radio"] {
	margin-right: 6px;
}

.userInfo_Text {
	flex: 1;
	word-break: break-all;
}


.button-group img {
	width: 150px;
	cursor: pointer;
}

#main_Content {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
	margin-top: 30px;
}

#main_Content > div {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	width: 750px;
}

#main_Content > div > div:first-child {
	width: 225px;
	text-align: right;
}

#main_Content img {
	cursor: pointer;
	display: block;
}

#main_Content > div > div:last-child {
	flex: 1;
}

.footer {
	text-align: center;
	font-size: 12px;
	color: #666;
	margin-top: 40px;
}
</style>
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<div class="flow">
					<div class="flow_current">勤務地入力</div>
					<div class="flow_others">住所入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">付随書類入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">申請内容選択</div>
			</div>

			<div class="mozi">
				<p>勤務地および住所に変更がありますか？</p>
				<p>それぞれ選択して「次へ」をクリックしてください。</p>
				<p>（注）異動にともなって転居がある方は、転居先が確定した後に申請してください。</p>
			</div>

			<div class="wrapper">
				<!-- 상단: 現勤務地 / 現住所 -->
				<table class="info-table">
					<tr>
						<th>現勤務地</th>
						<td>東京都中野区本町３－３０－４ＫＤＸ中野坂上ビル８Ｆ</td>
					</tr>
					<tr>
						<th>現住所</th>
						<td>神奈川県川崎市高津区下作延１－２－３ レオパレス溝の口１０３</td>
					</tr>
				</table>

				<!-- 하단: 변경 여부 -->
				<table class="change-table">
					<tr>
						<th>勤務地が</th>
						<td>
							<label><input type="radio" name="workChange" value="yes">変わる</label>
							<label><input type="radio" name="workChange" value="no" checked>変わらない</label>
						</td>
					</tr></table>
					<div class = "button">
										<tr>
						<th>住所が</th>
						<td>
							<label><input type="radio" name="addrChange" value="yes">変わる</label>
							<label><input type="radio" name="addrChange" value="no" checked>変わらない</label>
						</td>
					</tr>
					</div>
				
				<!-- 버튼 그룹 -->
			<div class="button-group">
				<img src="/resources/img/back_btn01.gif" alt="back_btn">
				<img src="/resources/img/next_btn01.gif" alt="next_btn">
			</div>
			</div>

			
		</div>

		<div class="footer">
			<div>Copyright (c) 2010-2012 Leopalace Leasing Corporation. All Rights Reserved.</div>
		</div>
	</div>
</body>
</html>
