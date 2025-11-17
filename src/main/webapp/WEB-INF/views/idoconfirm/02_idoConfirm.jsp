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
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 5fr;
	}
	#form_Text2 {
		display: grid;
		grid-template-columns: 1fr 1.2fr 1.2fr;
	}
	.form_Column1 {
		display: flex;
		align-items: center;
		color: white;
		background-color: #545454;
		border: solid 1px white;
		justify-content: center;
	}
	.form_Normal1 {
		border: solid 1px white;
		display: flex;
		gap: 5px;
	}
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<div class="subtitle">異動有無確認</div>
				
				<div style="display: flex; flex-direction: column; width: 1010px; margin: auto; padding-top: 40px; padding-bottom: 20px;">
					<div>
						勤務地および住所に変更がありますか？<br>
						それぞれ選択して、「次へ」をクリックしてください。<br>
					</div>
					<div style="padding-top: 10px;">
						(注)異動にともなって転居がある方は、転居先が確定した後に申請してください。
					</div>
				</div>
			</div>
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column1" style="padding-top: 10px; padding-bottom: 10px;">
						現勤務地
					</div>
					<div class="form_Normal" style="padding-top: 10px; padding-bottom: 10px;">
						東京都中野区本町3-30-4KDX中野坂上ビル8F
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column1" style="padding-top: 10px; padding-bottom: 10px;">
						現住所
					</div>
					<div class="form_Normal" style="padding-top: 10px; padding-bottom: 10px;">
						神奈川県川崎市高津区下作延1-2-3 レオパレス溝の口 103
					</div>
				</div>
			</div>
			<div class="content_Form1" style="width: 580px; margin-left: 3.1%;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						勤務地が
					</div>
					<div class="form_Normal" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="checkbox" name="" value="">変わる
					</div>
					<div class="form_Normal" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="checkbox" name="" value="">変わらない
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						住所が
					</div>
					<div class="form_Normal" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="checkbox" name="" value="">変わる
					</div>
					<div class="form_Normal" style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
						<input type="checkbox" name="" value="">変わらない
					</div>
				</div>
			</div>
			<div class = "button_Left">
				<div class = "button_Left_Group">   
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"> 
					<img src="/resources/img/next_btn01.gif" alt="next_btn01">
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>