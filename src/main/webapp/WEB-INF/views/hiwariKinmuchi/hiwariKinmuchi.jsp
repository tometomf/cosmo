<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 勤務地 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
#main_Content {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 25px;
	width: 940px;
	margin: 30px auto;
	font-size: 13px;
}

p {
	line-height: 1.6;
	margin-bottom: 5px;
}

.gridTable {
	display: grid;
	grid-template-columns: 26% 1fr 22% 1fr;  
	border: 1px solid #ccc;
	border-collapse: collapse;
}

.gridHeader {
	background-color: #555;
	color: white;
	font-weight: bold;
	text-align: center;
	padding: 6px 8px;
	border: 1px solid #ccc;
}

.gridLabel {
	background-color: #f4f4f4;
	font-weight: bold;
	text-align: left;
	border: 1px solid #ccc;
	padding: 6px 8px;
	line-height: 1.3;        
	word-break: keep-all;     
	white-space: normal;      
}

.gridCell {
	border: 1px solid #ccc;
	padding: 6px 8px;
	vertical-align: middle;
}

input[type="text"], select {
	padding: 2px 4px;
	font-size: 13px;
}

button {
	padding: 2px 6px;
	font-size: 12px;
	cursor: pointer;
	margin-left: 4px;
}

.button_Left_Group img {
	cursor: pointer;
	transition: 0.2s;
}

.button_Left_Group img:hover {
	opacity: 0.85;
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
					<div class="flow_others">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 勤務地 入力</div>
			</div>

			<div id="main_Content">
				<p>
					日割期間の勤務地を入力してください。<br>
					勤務地を選択後、「次へ」ボタンをクリックしてください。
				</p>

				<div class="gridTable">
					<!-- 제목 행 -->
					<div class="gridHeader" style="grid-column: span 2;">現勤務地</div>
					<div class="gridHeader" style="grid-column: span 2;">日割期間 勤務地</div>

					<div class="gridLabel">勤務地コード</div>
					<div class="gridCell">1234</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="5678" style="width:70px;">
						<button type="button">検索</button>
					</div>

					<div class="gridLabel">勤務地先</div>
					<div class="gridCell">中野店</div>
					<div class="gridCell" style="grid-column: span 2;">
						<select style="width:120px;">
							<option selected>江戸川店</option>
							<option>品川店</option>
							<option>目黒店</option>
						</select>
					</div>

					<div class="gridLabel">郵便番号</div>
					<div class="gridCell">164-0012</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="134" style="width:40px;"> -
						<input type="text" value="4567" style="width:60px;">
						<button type="button">検索</button>
					</div>

					<div class="gridLabel">都道府県</div>
					<div class="gridCell">東京都</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="東京都" style="width:120px;">
					</div>

					<div class="gridLabel">所在地1</div>
					<div class="gridCell">中野区本町3-30-4</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="江戸川区船堀2-1-5" style="width:96%;">
					</div>

					<div class="gridLabel">所在地2（建物名等）</div>
					<div class="gridCell">KDX中野坂上ビル8F</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="江戸川店" style="width:96%;">
					</div>
				</div>

				<div class="button_Left" style="margin-top:25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る">
						<img src="/resources/img/next_btn01.gif" alt="次へ">
						<img src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>