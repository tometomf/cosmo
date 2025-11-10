<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 住所 入力</title>
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

/* 버튼 */
.button_Left_Group img {
	cursor: pointer;
	transition: 0.2s;
}

.button_Left_Group img:hover {
	opacity: 0.85;
}

/* 주소 반영 버튼 */
.reflectBtn {
	background-color: #008040;
	color: white;
	font-weight: bold;
	border: none;
	padding: 6px 14px;
	border-radius: 3px;
	cursor: pointer;
	margin-top: 5px;
}

.reflectBtn:hover {
	background-color: #006a33;
}
</style>
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<!-- 상단 진행 단계 -->
				<div class="flow">
					<div class="flow_others">勤務地入力</div>
					<div class="flow_current">住所入力</div>
					<div class="flow_others">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 住所 入力</div>
			</div>

			<div id="main_Content">
				<p>
					日割期間の住所を入力してください。 <br> 社宅住所を住所へ反映する場合は、ボタンを押してください。 <br>
					住所の変更がない場合は、そのまま「次へ」をクリックしてください。
				</p>

<!-- ===== 상단 현재 주소 표시 영역 ===== -->
<table style="border-collapse: collapse; width: 940px; font-size: 13px; table-layout: fixed;">
	<tr style="height: 48px;"> <!-- ✅ 표 높이 살짝 넓힘 -->
		<th style="
			background-color: #f4f4f4;
			text-align: center;         /* 가로 중앙 */
			vertical-align: middle;     /* 세로 중앙 */
			width: 22%;
			font-weight: bold;
			border: 1px solid #ccc;">
			住所
		</th>

		<td style="padding: 0; border: 1px solid #ccc;">
			<div style="
				display: flex;
				justify-content: space-between;
				align-items: center;
				height: 100%;">
				<div style="padding: 10px 8px;">大阪府大阪市東淀川区東淡路1-1-1 ハイツ南光302</div>
				<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映"
					 style="display: block; height: 100%; border-left: 1px solid #ccc; cursor: pointer;">
			</div>
		</td>
	</tr>
</table>

				

				<!-- ===== 본문 표 영역 ===== -->
				<table style="margin-top: 15px;">
					<tr>
						<th class="sectionTitle" colspan="2">現住所</th>
						<th class="sectionTitle" colspan="2">日割期間 住所</th>
					</tr>
					<tr>
						<th>郵便番号</th>
						<td>164-0001</td>
						<td colspan="2"><input type="text" value="211"
							style="width: 40px;"> - <input type="text" value="0001"
							style="width: 60px;">
							<button type="button">検索</button></td>
					</tr>
					<tr>
						<th>都道府県</th>
						<td>神奈川県</td>
						<td colspan="2"><input type="text" value="神奈川県"
							style="width: 120px;"></td>
					</tr>
					<tr>
						<th>住所1</th>
						<td>川崎市高津区上作延1-2-3</td>
						<td colspan="2"><input type="text" value="川崎市中原区新丸子1-2-3"
							style="width: 96%;"></td>
					</tr>
					<tr>
						<th>住所2（建物名等）</th>
						<td>レオパレス溝の口103</td>
						<td colspan="2"><input type="text" value="レオパレス新丸子201"
							style="width: 96%;"></td>
					</tr>
				</table>

				<!-- ===== 하단 버튼 ===== -->
				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"> <img
							src="/resources/img/next_btn01.gif" alt="次へ"> <img
							src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>