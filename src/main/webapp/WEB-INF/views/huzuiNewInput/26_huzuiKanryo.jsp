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
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class="subtitle">
					完了
				</div>	
				<div>
					<div style="margin: 5%; text-align: center;">
					書類の更新申請が完了しました。<br>「申請番号：${shinseiNo}」
					<br><br>お問い合わせの際は、上記の申請番号をお伝えください。<br>
					申請番号はメールでもお送りしております。		
					</div>
				</div>			
			</div>
		</div>
	
		<div class = "button_Center">
				<div class = "button_Center_Group" style="margin-bottom:50px;">
					<div><img src="/resources/img/top_btn01.gif" alt="top_btn01"></div>
				</div>
			</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	</div>	
</body>
<script type="text/javascript">
	document.querySelector(".button_Center_Group").addEventListener("click",function(e){
		location.href = "/";
	})
</script>
</html>