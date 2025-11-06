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
		#main_Content {
		display: flex;
	    flex-direction: column;
	    align-items: center; /* 전체를 가운데 정렬 */
	    gap: 15px;
	    margin-top: 30px;
	}

	#main_Content > div {
		display: flex;
		align-items: center;
		justify-content: flex-start;
		width: 750px;
	}

	#main_Content > div > div:first-child {
		width: 225px;
		text-align: right;
	}

	#main_Content img {
		cursor: pointer;
		display: block;
	}

	#main_Content > div > div:last-child {
		flex: 1;
	}
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "subtitle">
				<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle" style = "width: 100%">
				<span>申請内容選択</span>
			</div>
			<div id = "main_Content">
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
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>
