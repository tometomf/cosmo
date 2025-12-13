<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="stepItem">調整金登録</div>
		<div class="stepItem">
			支給データ<br>UL/DL
		</div>
		<div class="stepItem active">
			支給データ<br>ロック
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>