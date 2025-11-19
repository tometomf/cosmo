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
	/* 	무시  */
	.btn_List {
    	display: flex;
    	align-items: center;
    	gap: 8px;
	    width: 750px;
	    margin: auto;
	}

	#form_Ttile1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	
	.complete_wrap {
  text-align: center; /* 전체 블록을 중앙 정렬 */
  margin-top: 50px;
}

.complete_msg {
  display: inline-block; /* 가운데 배치되는 블록 */
  text-align: left;      /* 내부 문장은 왼쪽 정렬 */
  line-height: 1.8;
  font-size: 14px;
}


         
  
}
	
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class = "flow">
					<div class = "flow_others">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_others">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_current">完了</div>
				</div>
				<div class="subtitle">完了</div>
			</div>
			
			<div class="complete_wrap">
  <div class="complete_msg">
申請が完了しました。<br>
｢申請番号：12300064｣<br><br>
お問い合わせの際は、上記の申請番号をお伝え下さい。<br>
申請番号はメールでもお送りしております。
  </div>
</div>


<div class = "button_Center">
				<div class = "button_Center_Group">
					<div><img src="/resources/img/top_btn01.gif" alt="top_btn01"
					style="cursor:pointer;"
					onclick="location.href='/'">
					
					</div>
				</div>
</div>
			
			<div></div>
			<div></div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>
