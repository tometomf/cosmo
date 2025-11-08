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
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
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
					<div><img src="/resources/img/tn/shinsei_btn07.gif" alt="shinsei_btn07" style = "display: block;"></div>
					<div>自己都合による通勤交通費の変更申請を行います。</div>
				</div>
				<div class = "btn_List">
					<div><img src="/resources/img/tn/shinsei_btn08.gif" alt="shinsei_btn08" style = "display: block;"></div>
					<div>通勤私有車の変更、および、免許証更新や保険更新の申請を行います</div>
				</div>
				<div class = "btn_List">
					<div><img src="/resources/img/tn/shinsei_btn09.gif" alt="shinsei_btn09" style = "display: block;"></div>
					<div>臨時の通勤費発生時の申請はこちらから。</div>
				</div>
			</div>
		</div>
	
		<!-- 예제용 main -->
		<div class = "main">
			<!-- form 예제 -->
			<div class="content_Form1">
				<!-- 제목예제1 -->
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">住所</div>
					<div class = "form_Normal">川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
					<div class = "form_Normal">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務先</div>
					<div class = "form_Normal">中野店</div>
					<div class = "form_Normal">江戸川店</div>
				</div>
			</div>
			
			<!-- 배경색다른 form 예제 -->
			<!-- margin-top 무시 -->
			<div class="content_Form1" style = "margin-top: 25px;">
				<!-- 제목예제1 -->
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務地</div>
					<div class = "form_Required">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div class = "form_Required">東京都江戸川区船堀2-1-5</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務地</div>
					<div class = "form_Required">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div class = "form_Required">東京都江戸川区船堀2-1-5</div>
				</div>
			</div>
			
			<!-- header 다른 form 예제 -->
			<!-- margin-top 무시 -->
			<div class="content_Form2" style = "margin-top: 25px;">
				<!-- 제목예제2 -->
				<div class="form_Title2">
					<div>登録情報</div>
					<div style="display: flex; gap: 5px; cursor: pointer;">
						<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
						<div>変更する</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div class = "form_Normal">川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
					<div class = "form_Normal">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務先</div>
					<div class = "form_Normal">中野店</div>
					<div class = "form_Normal">江戸川店</div>
				</div>
			</div>
			
			<div class="content_Form1" style = "margin-top: 25px;">
				<!-- 제목없는거 예제 -->
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務地</div>
					<div class = "form_Required">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div class = "form_Required">東京都江戸川区船堀2-1-5</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">勤務地</div>
					<div class = "form_Normal">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
					<div class = "form_Normal">東京都江戸川区船堀2-1-5</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>
