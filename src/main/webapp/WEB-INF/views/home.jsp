<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
	#content1 {
		display: flex;
	    flex-direction: column;
	    align-items: center; /* 전체를 가운데 정렬 */
	    gap: 15px;
	    margin-top: 30px;
	}

	#content1 > div {
		display: flex;
		align-items: center;
		justify-content: flex-start;
		width: 750px;
	}

	#content1 > div > div:first-child {
		width: 225px;
		text-align: right;
	}

	#content1 img {
		cursor: pointer;
		display: block;
	}

	#content1 > div > div:last-child {
		flex: 1;
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
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "main_Content">
				<div class = "subtitle">
					<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle" style = "width: 100%">
					<div>申請内容選択</div>
				</div>
				<div id = "content1">
					<div>
						<div><img src="/resources/img/tn/shinsei_btn07.gif" alt="shinsei_btn07"></div>
						<div style = "">自己都合による通勤交通費の変更申請を行います。</div>
					</div>
					<div>
						<div><img src="/resources/img/tn/shinsei_btn08.gif" alt="shinsei_btn08"></div>
						<div style = "text-size: bold;">通勤私有車の変更、および、免許証更新や保険更新の申請を行います</div>
					</div>
					<div>
						<div><img src="/resources/img/tn/shinsei_btn09.gif" alt="shinsei_btn09"></div>
						<div style = "text-size: bold;">臨時の通勤費発生時の申請はこちらから。</div>
					</div>
				</div>
			</div>
			<div class = "main_Content">
				<div class = "subtitle">
					<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle" style = "width: 100%">
					<div>申請中案件の進捗状況</div>
				</div>
				<div class = "content_Form">
					<div class = "form_Title1" id = "form_Ttile1">
						<div></div>
						<div>申請前</div>
						<div>申請後</div>
					</div>
					<div class = "form_Text1" id = "form_Text1">
						<div class = "form_Column">住所</div>
						<div>川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
						<div>神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
					</div>
					<div class = "form_Text1"  id = "form_Text1">
						<div class = "form_Column">勤務先</div>
						<div>中野店</div>
						<div>江戸川店</div>
					</div>
					<div class = "form_Text1"  id = "form_Text1">
						<div class = "form_Column">勤務地</div>
						<div>東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
						<div>東京都江戸川区船堀2-1-5</div>
					</div>
				</div>
				<div class = "content_Form">
					<div class = "form_Title2">
						<div>登録情報</div>
						<div style = "display:flex; gap:5px; cursor: pointer;">
							<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
							<div>変更する</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>
