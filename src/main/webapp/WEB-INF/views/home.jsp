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
		grid-template-columns: 36px 125px 1fr 120px 120px 120px 170px 50px 1fr;
	}
	
	#form_Text1 {
		display: grid;
		grid-template-columns: 36px 125px 1fr 120px 120px 120px 170px 50px 1fr;
	}
	
	.link_text {
    	cursor: pointer; 
    	text-decoration: underline;
    	color: #007bff; 
	}
	
	.link_text:hover {
    	color: #0056b3;
	}
	
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<div class = "flow">
					<div class = "flow_current">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_others">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				<div class="subtitle">申請内容選択</div>
			</div>
			<div class = "main_Content">
				<div class = "btn_List">
					<div><img src="/resources/img/tn/shinsei_btn07.gif" alt="shinsei_btn07" style = "display: block; cursor: pointer;" onclick = "buttonClick('1')"></div>
					<div>自己都合による通勤交通費の変更申請を行います。</div>
				</div>
				<div class = "btn_List">
					<div><img src="/resources/img/tn/shinsei_btn08.gif" alt="shinsei_btn08" style = "display: block; cursor: pointer;" onclick = "buttonClick('2')"></div>
					<div>通勤私有車の変更、および、免許証更新や保険更新の申請を行います</div>
				</div>
				<div class = "btn_List">
					<div><img src="/resources/img/tn/shinsei_btn09.gif" alt="shinsei_btn09" style = "display: block; cursor: pointer;" onclick = "buttonClick('3')"></div>
					<div>臨時の通勤費発生時の申請はこちらから。</div>
				</div>
			</div>
		</div>
		<div class = "main" style = "background: #efefef;">
			<div class = "main_title">
				<div class="subtitle">申請中案件の進捗状況</div>
			</div>
			<div class="content_Form1">
				<div class="form_Title1" id="form_Ttile1">
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
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column" style = "text-align: center;">${board.seq}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.shinsei_No}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.shinsei_Naiyou}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.shinsei_Ymd}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.ll_Shonin_Ymd}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.first_Shikyu_Ymd}</div>
						<div class = "form_Normal">${board.shozoku_Nm}</div>
						<div class = "form_Normal" style = "text-align: center;">${board.jutaku_Kbn}</div>
						<div class = "form_Normal" style = "text-align: center;"><span class = "link_text" 
							onclick="onClick('<c:out value="${board.shinsei_No}" default=""/>', '<c:out value="${board.hozon_Uid}" default=""/>', ${board.shinchoku_Kbn})">${board.shinchoku_Kbnnm}</span></div>
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
	
	function onClick(shinseiNo, hozon_Uid, shinchokuKbn) {
		
		var target = window.location.origin + '/shinsei'; 
	    
		if (shinchokuKbn == '1') {
			window.location.href = target + '/ichiji' + '?no=' + shinseiNo + '&hozonUid=' + hozon_Uid;
		} else if (shinchokuKbn == '2') {
			window.location.href = target + '/shinseiDetail' + '?no=' + shinseiNo;
		} else if (shinchokuKbn == '3') {
			window.location.href = target + '/kakunin' + '?no=' + shinseiNo;
		} else if (shinchokuKbn == '5') {
			window.location.href = target + '/torikesu' + '?no=' + shinseiNo + '&hozonUid=' + hozon_Uid;
		}
	}
	
</script>
