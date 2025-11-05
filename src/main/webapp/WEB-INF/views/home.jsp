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
		width: 700px; /* 중앙정렬 기준 폭, 필요에 따라 조정 */
	}

	#main_Content > div > div:first-child {
		width: 225px; /* 버튼 영역 고정 */
		text-align: right; /* 버튼 오른쪽 정렬 (선택사항) */
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
		<div class = "header">
			<div>
				<div class = "main_Logo">
					<img src="/resources/img/logo.gif" alt="logo">
				</div>
				<div class = "userName">
					<div>ログイン名:</div>
					<div style = "font-weight: bold;">net001</div>
				</div>
				<div class = "main_Btn">
					<img src="/resources/img/top_btn.gif" alt="top_btn">
					<img src="/resources/img/logout_btn.gif" alt="logout_btn">
				</div>
				<div class = "userInfo">
					<div>
						<div class = "userInfo_Title">法人名</div>
						<div class = "userInfo_Text">(株)○○○○○○○○</div>
					</div>
					<div>
						<div class = "userInfo_Title">所属名</div>
						<div class = "userInfo_Text">○○○○○○○○店</div>
					</div>
					<div>
						<div class = "userInfo_Title">現役職</div>
						<div class = "userInfo_Text">店舗スタッフ</div>
					</div>
					<div>
						<div class = "userInfo_Title">社員番号</div>
						<div class = "userInfo_Text">123456</div>
					</div>
					<div>
						<div class = "userInfo_Title">社員名</div>
						<div class = "userInfo_Text">田中　太郎様</div>
					</div>
				</div>
				<div class = "subtitle">
					<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle" style = "width: 100%">
					<span>申請内容選択</span>
				</div>
			</div>
		</div>
		<div class = "main">
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
		<div class = "footer">
			<div>
				Copyright (c) 2010-2012 Leopalace leasing Corporation. All Right Reserved.
			</div>
		</div>
	</div>
</body>
</html>
