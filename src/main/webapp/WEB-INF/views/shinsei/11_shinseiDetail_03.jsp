<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>差戻し案件 詳細</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
#main_Content {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
	margin-top: 30px;
}
#main_Content>div {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	width: 750px;
}
#main_Content>div>div:first-child {
	width: 225px;
	text-align: right;
}
#main_Content img {
	cursor: pointer;
	display: block;
}
#main_Content>div>div:last-child {
	flex: 1;
}
.warning_box {
	background-color: #fff8e5;
	border: 1px solid #f5c84c;
	color: #cc0000;
	font-size: 13px;
	line-height: 1.5;
	margin-top: 20px;
	padding: 10px 15px;
	display: flex;
	align-items: flex-start;
	gap: 10px;
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}
.warning_box img {
	width: 30px;
	height: 30px;
	flex-shrink: 0;
}
#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}
#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}
</style>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class="main_Content">
<div class="main_Content">
	<!-- ===== 제목줄 ===== -->
	<div class="subtitle">
		<img src="/resources/img/tn/bg_subtitle.gif" style="width: 100%">
		<div>申請中案件 詳細</div>
	</div>

	<!-- ===== 경고 영역 ===== -->
	<div class="content_Form" style="margin-top: 20px;">
		<div style="display: flex; align-items: flex-start; gap: 10px; font-size: 13px; color: #cc0000; line-height: 1.6;">
			<img src="/resources/img/icon_attention.gif" alt="warning" style="width: 35px; height: 35px; flex-shrink: 0;">
			<div>
				<div>申請内容に不備があったため差戻されています。</div>
				<div>不備内容を確認のうえ、再申請を行ってください。</div>
				<div style="margin-top: 5px; font-weight: bold;">：注意：申請期限日を過ぎると通勤費申請は行えなくなります。</div>
			</div>
		</div>
	</div>

	<!-- ===== 상태 정보 ===== -->
	<div class="content_Form" style="margin-top: 20px;">
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">状況</div>
			<div>差戻し</div>
		</div>
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">申請番号</div>
			<div>12300064</div>
		</div>
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">申請日</div>
			<div>2013/01/03</div>
		</div>
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">差戻日</div>
			<div style="color: red;">2013/01/04</div>
		</div>
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">訂正期限日</div>
			<div style="color: red;">2013/02/04</div>
		</div>
		<div class="form_Text1" id="form_Text1">
			<div class="form_Column">差戻理由</div>
			<div>
				新中野駅（徒歩7分先）の最寄駅が間違っています。<br>
				到着駅名を再度ご確認の上、経路登録しなおしてください。
			</div>
		</div>
	</div>
</div>



			<!-- ===== 신청 전후 정보 ===== -->
			<div class="content_Form" style="margin-top: 50px">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div>川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
					<div>神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div>中野店</div>
					<div>江戸川店</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div>東京都中野区中野3-30-4 KDX中野坂上ビル8F</div>
					<div>東京都江戸川区船堀2-1-5</div>
				</div>
			</div>

			<!-- ===== 경로① ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">通勤手段</div>
					<div>新幹線・一般</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">出発 駅</div>
					<div>新丸子駅(小田急電鉄小田原線)(小田急電鉄)</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">到着 駅</div>
					<div>江戸川橋駅(東京都営地下鉄)(東京都)</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">距離</div>
					<div>8.3km</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">有料道路 方法</div>
					<div>回数(マイカー定期) × 15回</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">駐輪場 方法</div>
					<div>0円</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">JR方法</div>
					<div>片道(01-ヶ月) × 01-ヶ月 × 01-ヶ月 ＝ 01-ヶ月定期</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">駐輪場所住所</div>
					<div>6ヶ月 / 1回</div>
				</div>
			</div>

			<!-- ===== 行程番号 ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>行程番号</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">行程番号</div>
					<div><a href="#" style="color: blue; text-decoration: underline;">表示する ▼</a></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">店店支援額決定権</div>
					<div>2018/10/23</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">店店支援額確</div>
					<div>2018-10-23修正</div>
				</div>
			</div>

			<!-- ===== 経路② ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>経路②</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">通勤手段</div>
					<div>下宿 × (平均時間)</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">出発</div>
					<div>下宿平均 / 17時 + 01時間30分 / 平均 / 6ヶ月</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">主観</div>
					<div>8口無制</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">主観理</div>
					<div></div>
				</div>
			</div>

			<!-- ===== 行程番号2 ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>行程番号</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">行程番号</div>
					<div><a href="#" style="color: blue; text-decoration: underline;">表示する ▼</a></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">店店支援額決定権</div>
					<div>25円</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">店店支援額確認日付</div>
					<div></div>
				</div>
			</div>

			<!-- ===== 経路③ ===== -->
			<div class="content_Form" style="margin-top: 40px">
				<div class="form_Title2">
					<div>経路③</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">通勤手段</div>
					<div>電車 × (平均時間)</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">出発</div>
					<div>17時間 / 17時 + 01時間30分 / 平均 / 6ヶ月 / 1時</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">主観</div>
					<div>8口無制</div>
				</div>
			</div>

			<!-- ===== 経路 コメント ===== -->
			<div class="form_Text1" id="form_Text1" style="margin-top: 40px;">
				<div class="form_Column">経路①</div>
				<div><a href="#" style="color: blue; text-decoration: underline;">記述</a></div>
				<div>コメント</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">経路②</div>
				<div><a href="#" style="color: blue; text-decoration: underline;">記述</a></div>
				<div>コメント</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">経路③</div>
				<div><a href="#" style="color: blue; text-decoration: underline;">記述</a></div>
				<div>コメント</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">経路④</div>
				<div><a href="#" style="color: blue; text-decoration: underline;">記述</a></div>
				<div>コメント</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">経路⑤</div>
				<div><a href="#" style="color: blue; text-decoration: underline;">記述</a></div>
				<div>コメント</div>
			</div>

			<!-- ===== 申請区分 ===== -->
			<div class="form_Text1" id="form_Text1" style="margin-top: 40px">
				<div class="form_Column">申請区分</div>
				<div>長期</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">承認番号</div>
				<div></div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">開始日 / 初回日</div>
				<div>2013/01/23</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">経過日</div>
				<div>2013/01/23</div>
			</div>
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">備考1</div>
				<div></div>
			</div>

			<!-- ===== 하단 버튼 ===== -->
			<div id="content1">
				<div>
					<div id="content1" style="display: flex; align-items: center; gap: 10px; margin-top: 30px; margin-bottom: 30px;">
						<img src="/resources/img/back_btn01.gif" alt="back_btn01">
						<img src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01">
						<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>