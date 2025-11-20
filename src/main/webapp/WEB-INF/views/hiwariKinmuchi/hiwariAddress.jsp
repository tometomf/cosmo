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
p {
	line-height: 1.6;
	margin-bottom: 5px;
}

#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

input[type="text"], select, button {
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

.addressRow {
	display: grid;
	grid-template-columns: 140px 1fr;
	border: 1px solid #ccc;
	width: 940px;              
	margin: 0 auto;          
	align-items: stretch;
	box-sizing: border-box;
}

.addressLabel {
	background-color: #f4f4f4;
	font-weight: bold;
	text-align: center;
	border-right: 1px solid #ccc;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.addressValue {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 6px 8px;
	box-sizing: border-box;
	width: 100%;             
}

.addressValue div {
	flex: 1;
	word-break: break-all;
	padding-right: 10px;
}

.addressValue img {
	height: 32px;
	width: auto;
	object-fit: contain;
	cursor: pointer;
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

			<div class="kin">
				<p style="width: 1010px; margin: 0 auto 15px auto;">
					日割期間の住所を入力してください。<br> 社宅住所を住所へ反映する場合は、ボタンを押してください。<br>
					住所の変更がない場合は、そのまま「次へ」をクリックしてください。
				</p>

				<div class="addressRow" style="height: 48px; width: 1010px;">
					<div class="addressLabel">住所</div>
					<div class="addressValue">
						<div>大阪府大阪市東淀川区東淡路1-1-1 ハイツ南光302</div>
						<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映">
					</div>
				</div>

				<div class="content_Form1" style="margin-top: 20px;">
					<div class="form_Title1" id="form_Title1">
						<div></div>
						<div>現住所</div>
						<div>日割期間 住所</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">郵便番号</div>
						<div class="form_Normal">164-0001</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="211"
									style="width: 40px; height: 20px;"> <span>-</span> <input
									type="text" value="0001" style="width: 60px; height: 20px;">
								<button type="button" style="height: 24px;">検索</button>
							</div>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">都道府県</div>
						<div class="form_Normal">神奈川県</div>
						<div class="form_Normal">
							<input type="text" value="神奈川県"
								style="width: 120px; height: 20px;">
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">住所1</div>
						<div class="form_Normal">川崎市高津区上作延1-2-3</div>
						<div class="form_Normal">
							<input type="text" value="川崎市中原区新丸子1-2-3"
								style="width: 380px; height: 20px;">
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">住所2（建物名等）</div>
						<div class="form_Normal">レオパレス溝の口103</div>
						<div class="form_Normal">
							<input type="text" value="レオパレス新丸子201"
								style="width: 380px; height: 20px;">
						</div>
					</div>
				</div>

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