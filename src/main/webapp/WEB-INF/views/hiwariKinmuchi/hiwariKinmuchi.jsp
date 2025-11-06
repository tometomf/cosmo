<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 勤務地 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
	/* 전체 레이아웃을 회색바 왼쪽 라인과 딱 맞춤 */
	#main_Content {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    gap: 25px;
	    margin-top: 30px;
	    width: 940px;      /* 폭 약간 줄여서 시각적으로 중앙 정렬 안정화 */
	    margin-left: 32px; /* ✅ 회색바 왼쪽 라인과 딱 맞춤 (원래 80px → 32px) */
	}

	p {
		line-height: 1.6;
		margin-bottom: 5px;
	}

	table {
		border-collapse: collapse;
		width: 940px;      /* 회색바 폭과 동일 */
		font-size: 13px;
		table-layout: fixed;
	}

	th, td {
		border: 1px solid #ccc;
		padding: 6px 8px;
		vertical-align: middle;
	}

	th {
		background-color: #f4f4f4;
		text-align: left;
		width: 22%;
	}

	.sectionTitle {
		background-color: #555;
		color: white;
		font-weight: bold;
		text-align: center;
	}

	input[type="text"], select {
		padding: 2px 4px;
		font-size: 13px;
	}

	button {
		padding: 2px 6px;
		font-size: 12px;
		cursor: pointer;
		margin-left: 4px;
	}

	.btnArea {
		display: flex;
		justify-content: flex-start;
		gap: 25px;
		margin-top: 25px;
		width: 940px;
	}

	.btnArea img {
		cursor: pointer;
		transition: 0.2s;
	}

	.btnArea img:hover { opacity: 0.85; }
</style>
</head>

<body>
	<div class="layout">
		<!-- ===== 상단 헤더 ===== -->
		<div class="header">
			<div class="main_Logo">
				<img src="/resources/img/logo.gif" alt="logo">
			</div>
			<div class="userName">
				<div>ログイン名:</div>
				<div style="font-weight:bold;">net001</div>
			</div>
			<div class="main_Btn">
				<img src="/resources/img/top_btn.gif" alt="top_btn">
				<img src="/resources/img/logout_btn.gif" alt="logout_btn">
			</div>
			<div class="userInfo">
				<div><div class="userInfo_Title">法人名</div><div class="userInfo_Text">(株)○○○○○○○○</div></div>
				<div><div class="userInfo_Title">所属名</div><div class="userInfo_Text">○○○○○○○○店</div></div>
				<div><div class="userInfo_Title">現役職</div><div class="userInfo_Text">店舗スタッフ</div></div>
				<div><div class="userInfo_Title">社員番号</div><div class="userInfo_Text">123456</div></div>
				<div><div class="userInfo_Title">社員名</div><div class="userInfo_Text">田中 太郎様</div></div>
			</div>
			<div class="subtitle">
				<img src="/resources/img/tn/bg_subtitle.gif" alt="bg_subtitle" style="width: 100%;">
				<span>日割 勤務地 入力</span>
			</div>
		</div>

		<!-- ===== 메인 본문 ===== -->
		<div class="main">
			<div id="main_Content">
				<p>
    				日割期間の勤務地を入力してください。<br>
    				勤務地を選択後、「次へ」ボタンをクリックしてください。
				</p>

				<!-- 표 영역 -->
				<table>
					<tr>
						<th colspan="2" class="sectionTitle">現勤務地</th>
						<th colspan="2" class="sectionTitle">日割期間 勤務地</th>
					</tr>
					<tr>
						<th>勤務地コード</th>
						<td>1234</td>
						<td colspan="2">
							<input type="text" value="5678" style="width:70px;">
							<button type="button">検索</button>
						</td>
					</tr>
					<tr>
						<th>勤務地先</th>
						<td>中野店</td>
						<td colspan="2">
							<select style="width:100px;">
								<option selected>江戸川店</option>
								<option>品川店</option>
								<option>目黒店</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>郵便番号</th>
						<td>164-0012</td>
						<td colspan="2">
							<input type="text" value="134" style="width:40px;"> -
							<input type="text" value="4567" style="width:60px;">
							<button type="button">検索</button>
						</td>
					</tr>
					<tr>
						<th>都道府県</th>
						<td>東京都</td>
						<td colspan="2"><input type="text" value="東京都" style="width:120px;"></td>
					</tr>
					<tr>
						<th>所在地1</th>
						<td>中野区本町3-30-4</td>
						<td colspan="2"><input type="text" value="江戸川区船堀2-1-5" style="width:96%;"></td>
					</tr>
					<tr>
						<th>所在地2（建物名等）</th>
						<td>KDX中野坂上ビル8F</td>
						<td colspan="2"><input type="text" value="江戸川店" style="width:96%;"></td>
					</tr>
				</table>

				<!-- 하단 버튼 -->
				<div class="btnArea">
					<img src="/resources/img/back_btn01.gif" alt="戻る">
					<img src="/resources/img/next_btn01.gif" alt="次へ">
					<img src="/resources/img/hozon_btn01.gif" alt="一時保存">
				</div>
			</div>
		</div>

		<!-- ===== 푸터 ===== -->
		<div class="footer">
			<div>
				Copyright (c) 2010-2012 Leopalace leasing Corporation. All Right Reserved.
			</div>
		</div>
	</div>
</body>
</html>