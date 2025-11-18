<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 勤務地 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
p {
	line-height: 1.6;
	margin-bottom: 5px;
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
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<div class="flow">
					<div class="flow_current">勤務地入力</div>
					<div class="flow_others">住所入力</div>
					<div class="flow_others">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 勤務地 入力</div>
			</div>

			<div class="kin">
				<p style="width: 1010px; margin: 0 auto 15px auto;">
					日割期間の勤務地を入力してください。<br> 勤務地を選択後、「次へ」ボタンをクリックしてください。
				</p>
				
				

				<div class="content_Form1" style="margin-top: 20px;">
					<!-- 제목예제1 -->
					<div class="form_Title1" id="form_Ttile1">
						<div></div>
						<div>現勤務地</div>
						<div>日割期間 勤務地</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">勤務先コード</div>
						<div class="form_Normal">1234</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="5678"
									style="width: 120px; height: 20px;">
								<button type="button" style="height: 24px;">検索</button>
							</div>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">勤務先</div>
						<div class="form_Normal">中野店</div>
						<div class="form_Normal">
							<select style="width: 120px;">
								<option selected>江戸川店</option>
								<option>品川店</option>
								<option>目黒店</option>
							</select>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">郵便番号</div>
						<div class="form_Normal">164-0012</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="134"style="width: 40px; height: 20px;"> 
								<span>-</span> 
								<input type="text" value="4567"style="width: 60px; height: 20px;">
								<button type="button" style="height: 24px;">検索</button>
							</div>
						</div>
					</div>
					
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">都道府県</div>
						<div class = "form_Normal">東京都</div>
						<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="東京都"style="width: 100px; height: 20px;">
						</div>
					</div>
					
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">所在地1</div>
						<div class = "form_Normal">中野区本町3-30-4</div>
						<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="江戸川区船堀2-1-5"style="width: 380px; height: 20px;">
						</div>
					</div>
					
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">所在地2（建物名等）</div>
						<div class = "form_Normal">KDX中野坂上ビル8F</div>
						<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" value="江戸川店"style="width: 380px; height: 20px;">
						</div>
					</div>
					
				</div>


				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"> <img
							src="/resources/img/next_btn01.gif" alt="次へ"> <img
							src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>