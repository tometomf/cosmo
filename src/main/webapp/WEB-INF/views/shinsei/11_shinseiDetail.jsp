<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請中案件 詳細</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
#main_Content {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
	margin-top: 30px;
}

#main_Content>div {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	width: 750px;
}

#main_Content>div>div:first-child {
	width: 225px;
	text-align: right;
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

/* 돌아가기 버튼 가운데 정렬 */
.back-btn-area {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}
</style>
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">

			<!-- ===== 제목 ===== -->
			<div class="main_Content">
				<div class="subtitle">
					<img src="/resources/img/tn/bg_subtitle.gif" style="width: 100%">
					<div>申請中案件 詳細</div>
				</div>
			</div>

			<!-- ===== 상태 정보 ===== -->
			<div class="form_Text1" id="form_Text1" style="margin-top: 20px;">
				<div class="form_Column">状況</div>
				<div>承認待ち</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請番号</div>
				<div>12300064</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請日</div>
				<div>2013/01/03</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">差戻し日</div>
				<div>2013/01/04</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">再申請日</div>
				<div>2013/01/08</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">承認日</div>
				<div></div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">支給開始日</div>
				<div></div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">本人申し送りコメント</div>
				<div></div>
			</div>

			<!-- ===== 이 신청을 되돌리는 버튼 (왼쪽정렬) ===== -->
			<div id="content1">
				<div>
					<div id="content1"
						style="display: flex; align-items: center; justify-content: flex-start; margin-top: 20px;">
						<img src="/resources/img/shinsei_btn04.gif" alt="この申請を引戻す">
					</div>
				</div>
			</div>

			<!-- ===== 신청 전 / 후 ===== -->
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
					<div>東京都中野区中野3-30-4 KDX中野坂上ビル8F</div>
					<div>東京都江戸川区船堀2-1-5</div>
				</div>
			</div>

			<!-- ===== 경로 정보 ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>経路①</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">通勤手段</div>
					<div>自動車(一般)</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">経路</div>
					<div>新丸子駅 → 自由が丘駅</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">距離</div>
					<div>8.2km</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">金額 1ヶ月</div>
					<div>12,456円</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">有料道路 1ヶ月</div>
					<div>30,000円</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">付随書類</div>
					<div><a href="#">登録証書コピー</a></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">保険満了日</div>
					<div>2015/01/31</div>
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
					<div>3級</div>
				</div>
			</div>

			<!-- ===== 신청 정보 ===== -->
			<div class="form_Text1" id="form_Text1" style="margin-top: 40px;">
				<div class="form_Column">申請区分</div>
				<div>異動</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">申請理由</div>
				<div></div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">異動日/移動日</div>
				<div>2013/04/10</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">転入日</div>
				<div>2013/04/09</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">開始日</div>
				<div>2013/04/10</div>
			</div>

			<!-- ===== 돌아가기 버튼 (가운데 정렬 + 링크) ===== -->
			<div class="back-btn-area">
				<a href="/shinsei/list">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01">
				</a>
			</div>

		</div>

		<!-- ===== footer 영역 ===== -->
		<div class="footer" style="margin-top: 40px;">
			<div>
				Copyright (c) 2010-2012 Leopalace leasing Corporation. All Right
				Reserved.
			</div>
		</div>

	</div>
</body>
</html>
