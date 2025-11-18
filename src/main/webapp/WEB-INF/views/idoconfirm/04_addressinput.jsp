<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>

/* 무시 영역 */
.btn_List {
	display: flex;
	align-items: center;
	gap: 8px;
	width: 750px;
	margin: auto;
}

#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text3 {
	display: grid;
	grid-template-columns: 1fr 3fr 1fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#form_Text4 {
	display: grid;
	grid-template-columns: 2fr 3fr;
}

.zipcode {
	width: 50px; /* 우편번호 입력칸 폭 */
}

.userInfo_Text {
	flex: 1;
	word-break: break-all; /* 일본어 긴 주소 줄바꿈 방지용 */
}

.wrapper {
	width: 800px;
	margin-left: 40px; /* ← 왼쪽 정렬 + 약간의 여백 */
}

.info-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.info-table th, .info-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

/* 테이블 구분선 */
.info-table tr+tr th, .info-table tr+tr td {
	border-top: 1px solid #ccc;
}

.zipcode2 {
	width: 100%;
	box-sizing: border-box;
}

.new {
	text-indent: 40px;
	margin-bottom: 20px; /* 상단과 wrapper 간격 */
}

.info-table td {
	position: relative;
}

.hanei_mini_btn02 {
	float: right;
	margin-left: 10px;
}

.content_Form1 {
	margin-top: 20px; /* form과 버튼 그룹 사이 간격 */
	margin-bottom: 20px;
}

.content_Form3 {
    width: 400px;
    margin-left: 35px;
    border: solid 1px #a0a0a0;
}

.button_Left {
    display: flex;
    gap: 10px;          /* 버튼 간 간격 */
    margin-top: 20px;   /* 위와의 간격 */
    margin-left: auto;  /* 왼쪽 여백 자동 → 오른쪽으로 이동 */
    margin-right: 30px; /* 오른쪽 끝에서 30px 떨어짐 */
}

.form_Column {
	display: flex;
	align-items: center;
}

.form_Column2 {
	background-color: #dddddd;
	border-right: solid 1px white;
	border-bottom: solid 1px white;
	display: flex;
	align-items: center;
	justify-content: center;
}

</style>
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<!-- 진척도 -->
				<div class="flow">
					
					<div class="flow_others">勤務地入力</div>
					<div class="flow_current">住所入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">付随書類入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>

				<div class="subtitle">住所　 入力</div>
			</div>
			<div></div>
			<div class="new">新住所を入力してください。</div>

			<!-- 상단: 住所 -->
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text3">
					<div class="form_Column2">
						住所
					</div>
					<div class="form_Normal">
						大阪府大阪市東淀川区瑞光1－1－1ハイツ瑞光３０２
					</div>
					<div class="form_Normal">
						<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="hanei_mini_btn02" class="hanei_mini_btn02">
					</div>
				</div>
			</div>

			<!-- form 영역 -->
			<div class="content_Form1">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>現住所</div>
					<div>新住所</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">郵便番号</div>
					<div class="form_Normal">213-0001</div>
					<div class="form_Normal">
						<input type="text" value="211" class="zipcode"><div>-</div> <input
							type="text" value="0001" class="zipcode">
						<button class="search_btn">検索</button>
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">郵便番号</div>
					<div class="form_Normal">神奈川県</div>
					<div class="form_Normal">
						<input type="text" value="神奈川県">
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">市区町村～番地</div>
					<div class="form_Normal">川崎市高津区上作延1-2-3</div>
					<div class="form_Normal">
						<input type="text" value="川崎市高津区上作延1-2-3" class="zipcode2">
					</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">建物名～号室</div>
					<div class="form_Normal">レオパレス溝の口103</div>
					<div class="form_Normal_mid">
						<input type="text" value="レオパレス新丸子201" class="zipcode2">
					</div>
				</div>

			</div>
			<div class = "content_Form3">
				<div class="form_Text1" id="form_Text4">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">
						<input type="text" value="2013/04/13"> <img
							src="/resources/img/cal_icon.gif" alt="cal_icon">
					</div>
				</div>
			</div>
			<!-- 버튼 그룹 -->
			<div class="button_Left">
			<div class="button_Left_Group">
				<img src="/resources/img/back_btn01.gif" alt="back_btn01"> <img
					src="/resources/img/next_btn01.gif" alt="next_btn01">
				<img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
			</div>
		</div>
		<!-- main 끝 -->
	</div>
	<!-- layout 끝 -->
</body>
</html>
