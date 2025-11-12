<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付随書類入力画面</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
.form_Column2 {
	background-color: #dddddd;
	border-right: solid 1px white;
	border-bottom: solid 1px white;
	display: flex;
	align-items: center;
	justify-content: center;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text4 {
	display: grid;
	grid-template-columns: 2fr 3fr;
}

.form_Column {
	display: flex;
	align-items: center;
	background-color: #dddddd;
	border-right: solid 1px white;
}

.main_title {
	display: flex
}

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

.form_Column1 {
	display: flex;
	align-items: center;
	color: white;
	background-color: #545454;
	border: solid 1px white;
	justify-content: center;
}
</style>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class="main_Title">
				<!-- 진척도 예제 -->
				<div class="flow">
					<div class="flow_others">勤務地入力</div>
					<div class="flow_others">住所入力</div>
					<div class="flow_current">付随書類入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">付随書類入力</div>
			</div>

			<div class="main_Content">
				<div class="main_title"
					style="display: flex; justify-content: space-between;">
					<div>
						勤務地および住所に変更がありますか？<br> それぞれ選択して「次へ」をクリックしてください。<br>
						（注）異動にともなって転居がある方は、転居先が確定した後に申請してください。
					</div>


					<img src="/resources/img/tn/hanei_mini_btn02.gif"
						alt="hanei_mini_btn02" class="hanei_mini_btn02">
				</div>
				<div class="keiro">
					<div class="keiro-box">経路②</div>
					<div style="display: flex; flex-direction: row; gap: 50px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">勤務地</div>
							<div class="form_Normal">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
							<div class="form_Normal">東京都江戸川区船堀2-1-5</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">勤務地</div>
							<div class="form_Normal">東京都中野区大町3-30-4KDX中野坂上ビル8F</div>
							<div class="form_Normal">東京都江戸川区船堀2-1-5</div>
						</div>
					</div>
				</div>
			</div>
			<div class="keiro">
				<div class="keiro-box">経路②</div>
				<div style="display: flex; flex-direction: row; gap: 50px;">
					<div></div>
					<div class="form_Title1" id="form_Ttile1">
						<div></div>
						<div>申請前</div>
						<div>申請後</div>
					</div>
				</div>
			</div>
			<div class="keiro">
				<div class="keiro-box">経路②</div>
				<div style="display: flex; flex-direction: row; gap: 50px;">
					<div>通勤手段</div>
					<div>バス</div>
				</div>
			</div>
			<div class="keiro">
				<div class="keiro-box">経路②</div>
				<div style="display: flex; flex-direction: row; gap: 50px;">
					<div></div>
					<div></div>
				</div>
			</div>





			<div class="content_Form3">
				<div class="form_Text1" id="form_Text4">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">
						<input type="text" value="2013/04/13"> <img
							src="/resources/img/cal_icon.gif" alt="cal_icon">
					</div>
				</div>
			</div>

			<div class="button_Left">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"> <img
						src="/resources/img/next_btn01.gif" alt="next_btn01"> <img
						src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
				</div>
			</div>

		</div>

	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	</div>

</body>
</html>