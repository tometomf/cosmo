<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
		grid-template-columns: 36px 130px 150px 100px 1fr 100px;
	}
	
	#form_Text1 {
		display: grid;
 		grid-template-columns: 36px 130px 150px 100px 1fr 100px;
	}

	#form_Ttile2 {
		display: grid;
		grid-template-columns: 36px 110px 1fr 120px 120px 120px 120px 50px 1fr;
	}
	
	#form_Text2 {
		display: grid;
		grid-template-columns: 36px 110px 1fr 120px 120px 120px 120px 50px 1fr;
	}
	
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 		<div class="main"> -->
<!-- 			<div class = "main_title"> -->
<!-- 				진척도 예제 -->
<!-- 				<div class = "flow"> -->
<!-- 					<div class = "flow_current">勤務地入力</div> -->
<!-- 					<div class = "flow_others">住所入力</div> -->
<!-- 					<div class = "flow_others">経路入力</div> -->
<!-- 					<div class = "flow_others">付随書類入力</div> -->
<!-- 					<div class = "flow_others">確認</div> -->
<!-- 					<div class = "flow_others">完了</div> -->
<!-- 				</div> -->
<!-- 				<div class="subtitle">申請内容選択</div> -->
<!-- 			</div> -->
<!-- 			<div class = "main_Content"> -->
<!-- 				<div class = "btn_List"> -->
<!-- 					<div><img src="/resources/img/tn/shinsei_btn07.gif" alt="shinsei_btn07" style = "display: block; cursor: pointer;" onclick = "buttonClick('1')"></div> -->
<!-- 					<div>自己都合による通勤交通費の変更申請を行います。</div> -->
<!-- 				</div> -->
<!-- 				<div class = "btn_List"> -->
<!-- 					<div><img src="/resources/img/tn/shinsei_btn08.gif" alt="shinsei_btn08" style = "display: block; cursor: pointer;" onclick = "buttonClick('2')"></div> -->
<!-- 					<div>通勤私有車の変更、および、免許証更新や保険更新の申請を行います</div> -->
<!-- 				</div> -->
<!-- 				<div class = "btn_List"> -->
<!-- 					<div><img src="/resources/img/tn/shinsei_btn09.gif" alt="shinsei_btn09" style = "display: block; cursor: pointer;" onclick = "buttonClick('3')"></div> -->
<!-- 					<div>臨時の通勤費発生時の申請はこちらから。</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class = "main" style = "background: #efefef; margin-bottom: 50px;">
			<div class = "main_title">
				<div class="subtitle">配信されているアラート</div>
			</div>
			<div style = "width:1010px; margin: auto;">以下から、申請を行いたいアラートを選択してください。 <br>該当するアラートがない場合、「該当アラートなし」を選択してください。</div>
			<div class="content_Form1">	
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>初回配信日</div>
					<div>配信理由</div>
					<div>配信回数</div>
					<div>配信詳細</div>
					<div></div>
				</div>
				<c:forEach items = "${list}" var = "board">
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column"></div>
						<div class = "form_Normal">${board.shain_Uid}</div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class = "main" style = "background: #efefef;">
			<div class = "main_title">
				<div class="subtitle">申請中案件の進捗状況</div>
			</div>
			<div class="content_Form1">
				<div class="form_Title1" id="form_Ttile2">
					<div></div>
					<div>申請番号</div>
					<div>申請内容</div>
					<div>申請日</div>
					<div>承認日</div>
					<div>支給開始日</div>
					<div>所属名</div>
					<div>社宅</div>
					<div>進捗状況</div>
				</div>
				<c:forEach items = "${list}" var = "board">
					<div class="form_Text1" id="form_Text2">
						<div class = "form_Column"></div>
						<div class = "form_Normal">${board.shain_Uid}</div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
						<div class = "form_Normal"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>

<script>
	function buttonClick(gubun) { 
		
		const target = window.location.origin; 
		
		if (gubun == "1") { 
			window.location.href = target + '/idoconfirm/idoconfirm'; 
		} else if (gubun == "2") { 
			window.location.href = target + '/huzuiNewInput/main'; 
		} else if (gubun == "3"){ 
			window.location.href = target + '/hiwariKinmuchi/hiwariKinmuchi'; 
		} 
	}
</script>
