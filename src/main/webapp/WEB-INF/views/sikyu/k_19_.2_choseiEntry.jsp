<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>調整金登録画面</title>
</head>
<style>
#stepsArea {
	display: flex;
	gap: 5px;
	width: 1080px;
	margin: 0 auto;
	border-bottom: 2px solid #b5a6ff;
	margin-top: 10px;
}

.stepItem {
	width: 130px;
	padding: 10px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	background: linear-gradient(180deg, #ffffff 0%, #ffffff 30%, #e1e1e1 100%);
	font-size: 13px;
	color: #666;
	border: 1px solid #a8a8a8;
	user-select: none;
	align-items: center;
	text-align: center;
	text-align: center;
}

.stepItem.active {
	background: linear-gradient(180deg, #ffffff 0%, #f8f6ff 30%, #c6baff 70%);
	color: #4a36c5;
	font-weight: bold;
	border: 2px solid #d6cdff;
	border-bottom: none;
	position: relative;
	top: 1px;
	z-index: 2;
}

#fullFormArea .content_Form1 {
	width: 1080px;
	margin: auto;
	border: solid 1px #a0a0a0;
	padding: 0;
	box-sizing: border-box;
}

.form_Text3 {
	display: grid;
	grid-template-columns: 120px 400px 120px 400px;
	width: 1080px;
	border: 1px solid #a0a0a0;
	border-top: none;
	box-sizing: border-box;
}

.form_Text3 .form_Column {
	background: #dddddd;
	padding: 5px;
	display: flex;
	align-items: center;
	border-right: 1px solid #a0a0a0;
}

.form_Text3 .form_Normal {
	padding: 5px;
	display: flex;
	align-items: center;
	position: relative;
	border-right: 1px solid #a0a0a0;
}

.form_Text3 .form_Column, .form_Text3 .form_Normal {
	font-size: 13px;
}

.form_Text3 .form_Normal:last-child {
	border-right: none;
}

.form_Text3 .form_Normal img {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

#form_Title2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

.content_Form3 {
	width: 1080px;
	margin: 40px auto 0;
	border: solid 1px #a0a0a0;
}

#buttonLeft {
	width: 1080px;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header_ll.jsp"%>

	<div id="stepsArea">
		<div class="stepItem">
			支給データ<br>作成
		</div>
		<div class="stepItem">一括支給停止</div>
		<div class="stepItem">
			支給データ<br>ダウンロード
		</div>
		<div class="stepItem">支給管理 一覧</div>
		<div class="stepItem active">調整金登録</div>
		<div class="stepItem">
			支給データ<br>UL/DL
		</div>
		<div class="stepItem">
			支給データ<br>ロック
		</div>
	</div>

	<div class="layout">
		<div class="main">
			<div class="content_Form3">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">社員番号</div>
					<div class="form_Normal"></div>
					<div class="form_Column">社員名</div>
					<div class="form_Normal"></div>
					<div class="form_Column">所属</div>
					<div class="form_Normal"></div>
				</div>
			</div>

			<div class="content_Form3">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">支給月</div>
					<div class="form_Normal"></div>
					<div class="form_Column">調整金額</div>
					<div class="form_Normal"></div>
					<div class="form_Column"
						style="display: flex; align-items: center;">調整理由</div>
					<div class="form_Normal">
						<textarea name="csCommentInput"
							style="width: 90%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
					</div>
				</div>
			</div>

			<div class="button_Left" id="buttonLeft">
				<div class="button_Left_Group">
					<img src="/resources/img/toroku_btn01.gif" alt="toroku_btn01"
						onclick="location.href='/'">
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>

	<script>
		function submitChoseiForm() {
			const textarea = document
					.querySelector("textarea[name='csCommentInput']");
			const value = textarea.value.trim();

			if (value.length === 0) {
				alert("調整理由を入力してください。");
				return;
			}
			if (value.length > 1000) {
				alert("調整理由は1000文字以内で入力してください。");
				return;
			}

			document.getElementById("csCommentForm").value = value;
			document.getElementById("csForm").submit();
		}
	</script>
</body>
</html>