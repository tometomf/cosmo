<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 申請理由 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<!-- ✅ jQuery UI 스타일 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

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
	padding: 4px 6px;
	font-size: 13px;
}

textarea {
	width: 100%;
	height: 80px;
	font-size: 13px;
	resize: none;
	padding: 6px;
	border: 1px solid #ccc;
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
.button_Left_Group img:hover { opacity: 0.85; }

/* datepicker 스타일 보정 */
.ui-datepicker {
	font-size: 13px;
}

/* 📅 아이콘 이미지 입력창 오른쪽 정렬용 */
.date-input {
	display: inline-flex;
	align-items: center;
	gap: 4px;
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
					<div class="flow_others">住所入力</div>
					<div class="flow_current">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 申請理由 入力</div>
			</div>

			<div id="main_Content">

				<!-- ===== 입력 테이블 ===== -->
				<table>
					<tr>
						<th>日割申請理由</th>
						<td>
							<textarea></textarea>
						</td>
					</tr>

					<tr>
						<th>申請期間</th>
						<td>
							<div class="date-input">
								<input type="text" id="startDate" value="2013/04/10" style="width:140px;">
								<img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon" style="cursor:pointer; height:20px;">
							</div>
							 〜
							<div class="date-input">
								<input type="text" id="endDate" value="2013/04/10" style="width:140px;">
								<img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon" style="cursor:pointer; height:20px;">
							</div>
							<span style="margin-left: 10px;">5日間</span>
						</td>
					</tr>

					<tr>
						<th>出勤日数</th>
						<td>
							<input type="text" value="4" style="width:40px;"> 日間
							<span style="margin-left: 10px; color:#666;">※実働日数を入力してください。</span>
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

	<!-- ✅ jQuery & jQuery UI -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

	<!-- ✅ datepicker 설정 -->
	<script>
	$(function() {
		$("#startDate, #endDate").datepicker({
			dateFormat: 'yy/mm/dd',   // ✅ yyyy/mm/dd 숫자형 표시
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true
		});

		// 📅 아이콘 클릭 시 datepicker 열기
		$(".calendar-icon").each(function(index) {
			$(this).on("click", function() {
				$("#" + (index === 0 ? "startDate" : "endDate")).datepicker("show");
			});
		});
	});
	</script>
</body>
</html>