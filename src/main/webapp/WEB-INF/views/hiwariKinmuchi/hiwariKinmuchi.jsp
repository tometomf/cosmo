<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	}

	p {
		line-height: 1.6;
		margin-bottom: 5px;
	}

	table {
		border-collapse: collapse;
		width: 940px;
		font-size: 13px;
		table-layout: fixed;
	}

	th, td {
		border: 1px solid #ccc;
		padding: 6px 8px;
		vertical-align: middle;
	}

	th {
		background-color: #f4f4f4;
		text-align: left;
		width: 22%;
	}

	.sectionTitle {
		background-color: #555;
		color: white;
		font-weight: bold;
		text-align: center;
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
	.button_Left_Group img:hover { opacity: 0.85; }
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

				<!-- ===== 표 영역 (원래 스타일 복원) ===== -->
				<table>
					<tr>
						<th colspan="2" class="sectionTitle">現勤務地</th>
						<th colspan="2" class="sectionTitle">日割期間 勤務地</th>
					</tr>
					<tr>
						<th>勤務地コード</th>
						<td>1234</td>
						<td colspan="2">
							<input type="text" value="5678" style="width:70px;">
							<button type="button">検索</button>
						</td>
					</tr>
					<tr>
						<th>勤務地先</th>
						<td>中野店</td>
						<td colspan="2">
							<select style="width:120px;">
								<option selected>江戸川店</option>
								<option>品川店</option>
								<option>目黒店</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>郵便番号</th>
						<td>164-0012</td>
						<td colspan="2">
							<input type="text" value="134" style="width:40px;"> -
							<input type="text" value="4567" style="width:60px;">
							<button type="button">検索</button>
						</td>
					</tr>
					<tr>
						<th>都道府県</th>
						<td>東京都</td>
						<td colspan="2">
							<input type="text" value="東京都" style="width:120px;">
						</td>
					</tr>
					<tr>
						<th>所在地1</th>
						<td>中野区本町3-30-4</td>
						<td colspan="2">
							<input type="text" value="江戸川区船堀2-1-5" style="width:96%;">
						</td>
					</tr>
					<tr>
						<th>所在地2（建物名等）</th>
						<td>KDX中野坂上ビル8F</td>
						<td colspan="2">
							<input type="text" value="江戸川店" style="width:96%;">
						</td>
					</tr>
				</table>

				<!-- ===== 하단 버튼 ===== -->
				<div class="button_Left" style="margin-top: 25px;">
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