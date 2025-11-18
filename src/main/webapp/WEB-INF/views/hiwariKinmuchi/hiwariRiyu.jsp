<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 申請理由 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<style>
p {
	line-height: 1.6;
	margin-bottom: 5px;
}

.content_Form1 {
	width: 940px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-collapse: collapse;
	font-size: 13px;
}

.form_Text1 {
	display: grid;
	grid-template-columns: 22% 1fr;
	border-top: 1px solid #ccc;
}

.form_Column {
	background-color: #f4f4f4;
	font-weight: bold;
	padding: 8px 10px;
	border-right: 1px solid #ccc;
	display: flex;
	align-items: center;
}

.form_Normal {
	padding: 8px 10px;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 6px;
}

textarea {
	width: 100%;
	height: 40px;
	font-size: 13px;
	resize: none;
	padding: 6px;
	border: 1px solid #ccc;
	overflow-y: scroll;
}

input[type="text"] {
	padding: 4px 6px;
	font-size: 13px;
	border: 1px solid #ccc;
}

.calendar-icon {
	cursor: pointer;
	height: 20px;
	vertical-align: middle;
}

button {
	padding: 2px 6px;
	font-size: 12px;
	cursor: pointer;
	margin-left: 4px;
}

.note {
	color: #666;
	margin-left: 8px;
	font-size: 12px;
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
					<div class="flow_others">勤務地入力</div>
					<div class="flow_others">住所入力</div>
					<div class="flow_current">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 申請理由 入力</div>
			</div>

			<div class="kin">

				<div class="content_Form1">
					
					<div class="form_Text1">
						<div class="form_Column">日割申請理由</div>
						<div class="form_Normal">
							<textarea></textarea>
						</div>
					</div>

					<div class="form_Text1">
						<div class="form_Column">申請期間</div>
						<div class="form_Normal">
							<input type="text" id="startDate" value="2013/04/10" style="width:140px;">
							<img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon">
							<span>〜</span>
							<input type="text" id="endDate" value="2013/04/10" style="width:140px;">
							<img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon">
							<span style="margin-left:10px;">5日間</span>
						</div>
					</div>

					<div class="form_Text1">
						<div class="form_Column">出勤日数</div>
						<div class="form_Normal">
							<input type="text" value="4" style="width:40px;"> 日間
							<span class="note">※実働日数を入力してください。</span>
						</div>
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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

	<script>
	$(function() {
		$("#startDate, #endDate").datepicker({
			dateFormat: 'yy/mm/dd',
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true
		});

		$(".calendar-icon").each(function(index) {
			$(this).on("click", function() {
				$("#" + (index === 0 ? "startDate" : "endDate")).datepicker("show");
			});
		});
	});
	</script>
</body>
</html>