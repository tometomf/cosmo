<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤経路情報画面</title>
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
	.keiro {
		display: flex;
		flex-direction: column;
		gap: 20px;
		background-color: #EDEDED;
		border-top: 2px solid #3AC238; /* 두께 2px, 실선, 옅은 초록색 */
		padding-bottom: 20px;
	}
	.keiro-box {
		border-bottom-right-radius: 5px;
		background: linear-gradient(to bottom, #C6F2BF, #ECFBEA);
		color: green;
		padding: 3px 20px;
		width: fit-content;
		border-bottom: 1px solid #86E378;
		border-right: 1px solid #86E378;
	}
	.keiro-header {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 0 0 5px 0;
	}
	.content_Form3 {
		width: 1010px;
		margin: auto;
	    border: solid 1px #a0a0a0;
	}
	.content_Form4 {
		width: 400px;
	    border: solid 1px #a0a0a0;
	}
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr;
		background-color: white;
		/* height: 40px; */
	}
	#form_Text2 {
		display: grid;
		grid-template-columns: 2fr 3fr;
		background-color: white;
		/* height: 40px; */
	}
	#form_Text3 {
		display: grid;
		grid-template-columns: 1fr 4fr;
		background-color: white;
		/* height: 40px; */
	}
	.form_Keiro {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
	}
	.form_Normal1 {
		border: solid 1px white;
		display: flex;
		gap: 5px;
	}
	.form_Normal2 {
		display: flex;
		background-color: #ECFBEA;
		width: 99.5%;
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 5px;
	}
	.form_Normal3 {
		display: flex;
		width: 99.5%;
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 5px;
	}
	.form_Column1 {
		display: flex;
		align-items: center;
		color: white;
		background-color: #545454;
		border: solid 1px white;
		justify-content: center;
	}
	.form_Column2 {
		background-color: #dddddd;
		/* border-right: solid 1px white; */
		/* border-bottom: solid 1px white; */
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.form_Text2 > div {
		min-width: 25px;
		text-align: left;
		/* padding: 5px; */
		font-size: 13px;
		align-items: center;
	}
</style>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class="main_Title">
				<!-- 진척도 예제 -->
				<div class = "flow">
					<div class = "flow_others">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_current">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				<div class="subtitle">通勤経路情報</div>
			</div>
			<div class="main_Content">
				<div style="display: flex; justify-content: space-between;">
					<div>
						自動車・徒歩・自転車は、住所から勤務地まで、その手段のみを利用する場合に限ります。<br>
						電車・バスは、複数手段の利用(乗り継ぎ)が可能です。<br>
						複数手段を利用する場合、手段ごとに経路を分割して登録してください。
					</div>
					<div>
						<img src="/resources/img/map_mini_btn01.gif" alt="map_mini_btn01">
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-header">
					    <div class="keiro-box">経路①</div>
					    <div style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;"> 
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
					            <div style="white-space: nowrap;">変更する</div> </div>
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle"> 
					            <div style="white-space: nowrap;">削除する</div> </div>
					        
					    </div>
					</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">自動車</div>
						</div>
					</div>
					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3" style="height: 60px;">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">
								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="icon_keiro_01">　神奈川県川崎市中原区新丸子 1-2-3 レオパレス新丸子 201
								</div>
								<div class="form_Normal3">
									<img src="/resources/img/tn/icon_keiro_02.gif" alt="icon_keiro_02">　東京都中野区本町 3-30-4 KDX中野坂上ビル 8F
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-header">
					    <div class="keiro-box">経路②</div>
					    <div style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;"> 
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
					            <div style="white-space: nowrap;">変更する</div> </div>
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle"> 
					            <div style="white-space: nowrap;">削除する</div> </div>
					        
					    </div>
					</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">バス</div>
						</div>
					</div>
					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3" style="height: 60px;">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">
								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="icon_keiro_01">　下作延
								</div>
								<div class="form_Normal3">
									<img src="/resources/img/tn/icon_keiro_02.gif" alt="icon_keiro_02">　宮崎台駅
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-header">
					    <div class="keiro-box">経路③</div>
					    <div style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;"> 
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
					            <div style="white-space: nowrap;">変更する</div> </div>
					        
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle"> 
					            <div style="white-space: nowrap;">削除する</div> </div>
					        
					    </div>
					</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">電車</div>
						</div>
					</div>
					<div class="content_Form1">
						<div class="form_Text2" id="form_Text3">
							<div class="form_Column2">経路</div>
							<div class="form_Keiro">
								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_01.gif" alt="icon_keiro_01">　宮崎台駅
								</div>
								<div class="form_Normal3" style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東急田園都市線
								</div>
								<div class="form_Normal2">
									渋谷駅
								</div>
								<div class="form_Normal3" style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東京メトロ半蔵門線
								</div>
								<div class="form_Normal2">
									大手町
								</div>
								<div class="form_Normal3" style="border-left: 5px solid grey; margin-left: 100px; padding-left: 30px;">
									東京メトロ丸の内線
								</div>
								<div class="form_Normal2">
									<img src="/resources/img/tn/icon_keiro_02.gif" alt="icon_keiro_02">　東京駅
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-header">
					    <div class="keiro-box">経路④</div>
					    <div style="display: flex; gap: 10px; margin-top: 10px; margin-right: 10px;"> 
					        <div style="display: flex; gap: 5px; cursor: pointer;">
					            <img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
					            <div style="white-space: nowrap;">追加する</div> </div>
					    </div>
					</div>
				</div>
				<div class="content_Form4">
					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">
							経路変更日
						</div>				
						<div class="form_Normal3">
							<input type="date">
							<img src="/resources/img/cal_icon.gif" alt="cal_icon.gif">
						</div>
					</div>
				</div>
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01">
					<img src="/resources/img/next_btn01.gif" alt="next_btn01">
					<img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>