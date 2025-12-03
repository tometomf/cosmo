<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/main.css">
<body>
	<div class = "layout">
		<div class = "main">
			<div class = "main_title">
				<div class="subtitle">付図書類更新 確認</div>
			</div>	
			<div class = "main_Content">
				下記内容で問題がなければ申請ボタンを押してください
			</div>			
			
			
			<div class="content_Form1">
	               <div class="form_Text2" id="form_Text4">
	                  <div class="form_Column">社員番号</div>
	                  <div class="form_Normal">${shain.shain_Uid}</div>
	                   <div class="form_Column">社員名</div>
	                  <div class="form_Normal">${shain.shain_Nm}</div>
	               </div>
	               <div class="form_Text1" id="form_Text5">
	                  <div class="form_Column">申請部分</div>
	                  <div class="form_Normal">期限更新</div>
	               </div>
			</div>
	
	
	
		</div>
	</div>
	
</body>
</html>