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
#main_Content {
	display: flex;
	flex-direction: column;
	align-items: center; /* 전체를 가운데 정렬 */
	gap: 15px;
	margin-top: 30px;
}

#main_Content>div {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	width: 750px; /* 중앙정렬 기준 폭, 필요에 따라 조정 */
}

#main_Content>div>div:first-child {
	width: 225px; /* 버튼 영역 고정 */
	text-align: right; /* 버튼 오른쪽 정렬 (선택사항) */
}

#main_Content img {
	cursor: pointer;
	display: block;
}

#main_Content>div>div:last-child {
	flex: 1;
}

#form_Ttile1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}
</style>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class="main_Content">
				<div class="subtitle">
					<img src="/resources/img/tn/bg_subtitle.gif" style="width: 100%">
					<div>申請中案件 詳細</div>
				</div>
			</div>
			<div class="form_Text1" id="form_Text1" style="margin-top: 20px;">
				<div class="form_Column">状況</div>
				<div>差し戻し</div>
			</div>

			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請番号</div>
				<div>20180730</div>
			</div>

			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請日</div>
				<div>2018/07/30</div>
			</div>

			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">差戻し日</div>
				<div>2018/07/31</div>
			</div>

			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">不備内容</div>
				<div>省略</div>
			</div>

			<div class="content_Form" style="margin-top: 50px">
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div>川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
					<div>神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div>中野店</div>
					<div>江戸川店</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div>東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div>東京都江戸川区船堀2-1-5</div>
				</div>
			</div>

			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">通勤手段</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">経路</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">距離</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">金額 1ヶ月</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">有料道路 1ヶ月</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">付随書類</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">保険満了日</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">対人賠償</div>
					<div>無制限</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">対物賠償</div>
					<div>無制限</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">人身障害</div>
					<div>無制限</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">搭乗者障害</div>
					<div>無制限</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">等級</div>
				</div>
			</div>

			<div class="form_Text1" id="form_Text1" style="margin-top: 40px">
				<div class="form_Column">申請区分</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請理由</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">異動日/移動日</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">転入日</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">開始日</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column" style="display: flex; align-items: center;">取消理由</div>
				<div style="grid-column: 2/-1;">
					<textarea readonly
						style="width: 90%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
				</div>
			</div>

			<div id="content1">
				<div>
					<div id="content1" style="margin-top: 40px;">
						<a href="/shinsei/ichijihozon"> <img
							src="/resources/img/back_btn01.gif" alt="back_btn01">
						</a> <img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02">
					</div>
				</div>
			</div>