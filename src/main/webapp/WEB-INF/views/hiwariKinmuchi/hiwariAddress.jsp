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
	font-size: 13px;
}

.gridTable {
	display: grid;
	width: 940px;
	border: 1px solid #aaa;
	border-collapse: collapse;
}

.gridRow {
	display: contents;
}

.gridCell {
	border: 1px solid #ccc;
	padding: 6px 8px;
}

.gridHeader {
	background-color: #f4f4f4;
	font-weight: bold;
	text-align: left;
	border: 1px solid #ccc;
	padding: 6px 8px;
}

.gridSectionHeader {
	background-color: #555;
	color: white;
	font-weight: bold;
	text-align: center;
	padding: 6px 8px;
	border: 1px solid #ccc;
}

.gridLayout {
	display: grid;
	grid-template-columns: 22% 1fr 22% 1fr;
}

.addressRow {
	display: grid;
	grid-template-columns: 140px 1fr;   
	border: 1px solid #ccc;
	align-items: stretch;               
	width: 940px;                      
}

.addressLabel {
	background-color: #f4f4f4;
	font-weight: bold;
	text-align: center;
	border-right: 1px solid #ccc;
	display: flex;
	justify-content: center;
	align-items: center;
}

.addressValue {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;                       
}

.addressValue div {
	flex: 1;
	padding: 10px 12px;                
	word-break: break-all;             
}

.addressValue img {
	display: block;
	height: 36px;             
	width: auto;            
	border-left: 1px solid #ccc;
	cursor: pointer;
	object-fit: contain;      
}


input[type="text"], button {
	font-size: 13px;
	padding: 2px 4px;
}

button {
	padding: 2px 6px;
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
					日割期間の住所を入力してください。 <br>
					社宅住所を住所へ反映する場合は、ボタンを押してください。 <br>
					住所の変更がない場合は、そのまま「次へ」をクリックしてください。
				</p>

				<div class="addressRow" style="height:48px;">
					<div class="addressLabel">住所</div>
					<div class="addressValue">
						<div>大阪府大阪市東淀川区東淡路1-1-1 ハイツ南光302</div>
						<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映">
					</div>
				</div>

				<div class="gridTable gridLayout" style="margin-top:15px;">
					<div class="gridSectionHeader" style="grid-column: span 2;">現住所</div>
					<div class="gridSectionHeader" style="grid-column: span 2;">日割期間 住所</div>

					<div class="gridHeader">郵便番号</div>
					<div class="gridCell">164-0001</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="211" style="width:40px;"> -
						<input type="text" value="0001" style="width:60px;">
						<button type="button">検索</button>
					</div>

					<div class="gridHeader">都道府県</div>
					<div class="gridCell">神奈川県</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="神奈川県" style="width:120px;">
					</div>

					<div class="gridHeader">住所1</div>
					<div class="gridCell">川崎市高津区上作延1-2-3</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="川崎市中原区新丸子1-2-3" style="width:96%;">
					</div>

					<div class="gridHeader">住所2（建物名等）</div>
					<div class="gridCell">レオパレス溝の口103</div>
					<div class="gridCell" style="grid-column: span 2;">
						<input type="text" value="レオパレス新丸子201" style="width:96%;">
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