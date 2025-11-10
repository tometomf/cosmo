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
	<div style="display: flex; align-items: flex-start; gap: 10px;">
		<!-- 경고 아이콘 -->
		<img src="/resources/img/icon_attention.gif" alt="warning" style="width: 35px; height: 35px; flex-shrink: 0; margin-top: 2px;">
		
		<!-- 경고 문장 -->
		<div style="font-size: 13px; color: #cc0000; line-height: 1.6;">
			<div>申請内容に不備があったため差戻しされています。</div>
			<div>不備内容を確認のうえ、再申請を行ってください。</div>
			<div style="margin-top: 3px; font-weight: bold;">
				[注意]
				<span style="font-weight: normal;">申請期限日を過ぎると通勤費申請は行えなくなります。</span>
			</div>
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

	<!-- 住所 -->
	<div class="form_Text1" id="form_Text1">
		<div class="form_Column">住所</div>
		<div>川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
		<div style="display: flex; flex-direction: column; gap: 5px;">
			<!-- 우편번호 -->
			<div style="display: flex; align-items: center; gap: 5px;">
				<input type="text" name="zip1" maxlength="3" style="width:40px; text-align:center;"> -
				<input type="text" name="zip2" maxlength="4" style="width:60px; text-align:center;">
				<button type="button" style="padding:2px 8px;">検索</button>
			</div>
			<!-- 도도부현 -->
			<div>
				<select name="prefecture" style="width:120px;">
					<option value="">選択</option>
					<option value="神奈川県" selected>神奈川県</option>
					<option value="東京都">東京都</option>
					<option value="千葉県">千葉県</option>
					<option value="埼玉県">埼玉県</option>
				</select>
			</div>
			<!-- 주소1 -->
			<div><input type="text" name="address1" value="川崎市中原区新丸子1-2-3" style="width:100%;"></div>
			<!-- 주소2 -->
			<div><input type="text" name="address2" value="レオパレス新丸子201" style="width:100%;"></div>
		</div>
	</div>

	<!-- 勤務先 -->
	<div class="form_Text1" id="form_Text1">
		<div class="form_Column">勤務先</div>
		<div>中野店</div>
		<div style="display: flex; align-items: center; gap: 5px;">
			<span>江戸川店</span>
			<button type="button" style="border:none; background:none; cursor:pointer;">
				<img src="/resources/img/tn/search_btn02.gif" alt="search" style="vertical-align:middle;">
			</button>
		</div>
	</div>

	<!-- 勤務地 -->
	<div class="form_Text1" id="form_Text1">
		<div class="form_Column">勤務地</div>
		<div>東京都中野区中野3-30-4 KDX中野坂上ビル8F</div>
		<div>東京都江戸川区船堀2-1-5</div>
	</div>
</div>


<!-- ===== 経路① ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<!-- 제목줄 -->
	<div class="form_Title2" style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
		経路①
	</div>
	<!-- 본문 영역 -->
	<div style="font-size: 13px;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">通勤手段</div>
			<div style="flex: 1; padding: 5px 10px;">自動車（一般）</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">経路 自</div>
			<div style="flex: 1; padding: 5px 10px;">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">経路 至</div>
			<div style="flex: 1; padding: 5px 10px;">東京都中野区本町3-30-4 KDX中野坂上ビル8F</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">距離</div>
			<div style="flex: 1; padding: 5px 10px;">8.2km</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">有料道路 IC</div>
			<div style="flex: 1; padding: 5px 10px;">用賀IC ～ 中野IC</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">有料道路 片道</div>
			<div style="flex: 1; padding: 5px 10px;">850円</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">1ヶ月金額</div>
			<div style="flex: 1; padding: 5px 10px;">22 × 22 × 160 / 10 × 23 + 850 × 2 × 23 = 55,929円</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%; align-items: center;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">月当月実勤務引回数</div>
			<div style="flex: 1; display: flex; align-items: center; gap: 5px; padding: 5px 10px;">
				<input type="text" value="15" style="width: 50px; text-align: center; border: 1px solid #ccc; height: 20px;">
				回
			</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%; align-items: center;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">月当月金額</div>
			<div style="flex: 1; display: flex; align-items: center; gap: 10px; padding: 5px 10px;">
				<span>46,076円</span>
				<button type="button" style="border: 1px solid #ccc; background: #f3f3f3; font-size: 12px; cursor: pointer; padding: 2px 10px;">計算</button>
			</div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>

<!-- ===== 経路① 하단 정보 박스들 ===== -->
<div style="display: flex; gap: 15px; margin-top: 20px;">
	<!-- 첫 번째 박스 -->
	<div class="content_Form" style="flex: 1;">
		<div style="font-size: 13px;">
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
				<div style="flex: 1; padding: 5px 10px;">
					<a href="#" style="color: blue; text-decoration: underline;">金件証メモ</a>
				</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">免許証有効期限</div>
				<div style="flex: 1; padding: 5px 10px; color: red;">2015/10/21</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">免許証番号</div>
				<div style="flex: 1; padding: 5px 10px; color: red;">1234-5678-90</div>
			</div>
		</div>
	</div>

	<!-- 두 번째 박스 -->
	<div class="content_Form" style="flex: 1;">
		<div style="font-size: 13px;">
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
				<div style="flex: 1; padding: 5px 10px;">
					<a href="#" style="color: blue; text-decoration: underline;">車検証メモ</a>
				</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">車種</div>
				<div style="flex: 1; padding: 5px 10px;">ベンツ</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">ナンバー</div>
				<div style="flex: 1; padding: 5px 10px; color: red;">品川 300 い 1111</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">排気量</div>
				<div style="flex: 1; padding: 5px 10px; color: red;">3000CC</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">車検有効期限</div>
				<div style="flex: 1; padding: 5px 10px; color: red;">2014/12/24</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">燃費</div>
				<div style="flex: 1; padding: 5px 10px;">15km/L</div>
			</div>
		</div>
	</div>

	<!-- 세 번째 박스 -->
	<div class="content_Form" style="flex: 1;">
		<div style="font-size: 13px;">
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
				<div style="flex: 1; padding: 5px 10px;">
					<a href="#" style="color: blue; text-decoration: underline;">任意証メモ（保証）</a>
				</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
				<div style="flex: 1; padding: 5px 10px;">
					<a href="#" style="color: blue; text-decoration: underline;">任意証メモ（個人賠償）</a>
				</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">保険満了日</div>
				<div style="flex: 1; padding: 5px 10px;">2015/10/21</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">対人賠償</div>
				<div style="flex: 1; padding: 5px 10px;">無制限万円</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">対物賠償</div>
				<div style="flex: 1; padding: 5px 10px;">無制限万円</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">人身傷害</div>
				<div style="flex: 1; padding: 5px 10px;">無制限万円</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">搭乗者傷害</div>
				<div style="flex: 1; padding: 5px 10px;">無制限万円</div>
			</div>
			<div class="form_Text1" style="display: flex; width: 100%;">
				<div class="form_Column" style="width: 100px; background-color: #d9d9d9; padding: 5px 10px;">等級</div>
				<div style="flex: 1; padding: 5px 10px;">36S等級</div>
			</div>
		</div>
	</div>
</div>

<!-- 修正 버튼 (전체 박스들 밖, 오른쪽 정렬) -->
<div style="display: flex; justify-content: flex-end; padding: 10px 0;">
	<button type="button" style="border: none; background: none; cursor: pointer;">
		<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
	</button>
</div>
			
<!-- ===== 経路② ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<!-- 제목줄 -->
	<div class="form_Title2" style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
		経路②
	</div>
	<!-- 본문 영역 -->
	<div style="font-size: 13px;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">通勤手段</div>
			<div style="flex: 1; padding: 5px 10px;">バス</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">経路</div>
			<div style="flex: 1; padding: 5px 10px;">下作延(バス) → 溝峰台駅(バス)</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">金額</div>
			<div style="flex: 1; padding: 5px 10px;">13,120円 / 1ヶ月　32,000円 / 3ヶ月　70,000円 / 6ヶ月</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">片道料金</div>
			<div style="flex: 1; padding: 5px 10px;">450円</div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>

<!-- ===== 付随者欄 ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<div style="font-size: 13px; border: 1px solid #ccc;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
			<div style="flex: 1; padding: 5px 10px;">
				<a href="#" style="color: blue; text-decoration: underline;">定期メモ</a>
			</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">初回定期購入期間</div>
			<div style="flex: 1; padding: 5px 10px;">1ヶ月</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">次回以降定期期間</div>
			<div style="flex: 1; padding: 5px 10px;"></div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>

		

			<!-- ===== 経路③ ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<!-- 제목줄 -->
	<div class="form_Title2" style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
		経路③
	</div>
	<!-- 본문 영역 -->
	<div style="font-size: 13px;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">通勤手段</div>
			<div style="flex: 1; padding: 5px 10px;">電車</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">経路</div>
			<div style="flex: 1; padding: 5px 10px;">東京駅 → 金町駅</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">金額</div>
			<div style="flex: 1; padding: 5px 10px;">15,000円 / 1ヶ月　45,000円 / 3ヶ月　80,000円 / 6ヶ月</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">片道料金</div>
			<div style="flex: 1; padding: 5px 10px;">18,000円</div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>

<!-- ===== 付随者欄 (経路③ 하단) ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<div style="font-size: 13px; border: 1px solid #ccc;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">付随者欄</div>
			<div style="flex: 1; padding: 5px 10px;">
				<a href="#" style="color: blue; text-decoration: underline;">定期メモ</a>
			</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">初回定期購入期間</div>
			<div style="flex: 1; padding: 5px 10px;">1ヶ月</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">次回以降定期期間</div>
			<div style="flex: 1; padding: 5px 10px;"></div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>


<!-- ===== その他 섹션 (5개 행) ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<div style="font-size: 13px; border: 1px solid #ccc;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">その他</div>
			<div style="flex: 1; padding: 5px 10px; border-right: 1px solid #d9d9d9;">
				<a href="#" style="color: blue; text-decoration: underline;">その他</a>
			</div>
			<div style="width: 200px; padding: 5px 10px;">コメント</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">その他</div>
			<div style="flex: 1; padding: 5px 10px; border-right: 1px solid #d9d9d9;">
				<a href="#" style="color: blue; text-decoration: underline;">その他</a>
			</div>
			<div style="width: 200px; padding: 5px 10px;">コメント</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">その他</div>
			<div style="flex: 1; padding: 5px 10px; border-right: 1px solid #d9d9d9;">
				<a href="#" style="color: blue; text-decoration: underline;">その他</a>
			</div>
			<div style="width: 200px; padding: 5px 10px;">コメント</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">その他</div>
			<div style="flex: 1; padding: 5px 10px; border-right: 1px solid #d9d9d9;">
				<a href="#" style="color: blue; text-decoration: underline;">その他</a>
			</div>
			<div style="width: 200px; padding: 5px 10px;">コメント</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">その他</div>
			<div style="flex: 1; padding: 5px 10px; border-right: 1px solid #d9d9d9;">
				<a href="#" style="color: blue; text-decoration: underline;">その他</a>
			</div>
			<div style="width: 200px; padding: 5px 10px;">コメント</div>
		</div>
	</div>
	<!-- 修正 버튼 (표 밖, 오른쪽 정렬) -->
	<div style="display: flex; justify-content: flex-end; padding: 10px 15px;">
		<button type="button" style="border: none; background: none; cursor: pointer;">
			<img src="/resources/img/tn/shusei_btn01.gif" alt="修正">
		</button>
	</div>
</div>

<!-- ===== 申請区分 섹션 ===== -->
<div class="content_Form" style="margin-top: 40px;">
	<div style="font-size: 13px; border: 1px solid #ccc;">
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">申請区分</div>
			<div style="flex: 1; padding: 5px 10px;">農納</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">申請理由</div>
			<div style="flex: 1; padding: 5px 10px;">
				<textarea style="width: 100%; min-height: 60px; border: 1px solid #ccc; padding: 5px;"></textarea>
			</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">離納日／移転日</div>
			<div style="flex: 1; padding: 5px 10px;">2013/04/10</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">転入日</div>
			<div style="flex: 1; padding: 5px 10px;">2013/04/09</div>
		</div>
		<div class="form_Text1" style="display: flex; width: 100%;">
			<div class="form_Column" style="width: 150px; background-color: #d9d9d9; padding: 5px 10px;">開始日</div>
			<div style="flex: 1; padding: 5px 10px;"></div>
		</div>
	</div>
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
		<div class="footer">
				<div>
					Copyright (c) 2010-2012 Leopalace leasing Corporation. All Right
					Reserved.
				</div>
			</div>

		</div>
</body>
</html>
