<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請内容 確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
/* ====== 테이블 구조 ====== */
#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Title2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

.main>div {
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main">
		<!-- ===== 제목 ===== -->
		<div class="main_title">
			<div class="subtitle">
				<div>申請内容 確認</div>
			</div>
		</div>

		<!-- ===== 경고 영역 ===== -->
		<div
			style="display: flex; align-items: flex-start; gap: 8px; margin-top: 10px;">
			<!-- 경고 아이콘 -->
			<img src="/resources/img/icon_attention.gif" alt="warning"
				style="width: 35px; height: 35px; flex-shrink: 0; margin-top: 2px;">

			<!-- 경고 문장 -->
			<div style="font-size: 13px; color: #cc0000; line-height: 1.6;">
				<div>申請内容に不備があったため差戻しされています。</div>
				<div>不備内容を確認のうえ、再申請を行ってください。</div>
				<div style="margin-top: 3px; font-weight: bold;">
					[注意] <span style="font-weight: normal;">申請期限日を過ぎると通勤費申請は行えなくなります。</span>
				</div>
			</div>
		</div>



		<!-- ===== 상태 정보 ===== -->
		<div class="content_Form1" style="margin-top: 25px;">
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">状況</div>
				<div class="form_Normal">差戻し</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">申請番号</div>
				<div class="form_Normal">12300054</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">申請日</div>
				<div class="form_Normal">2013/01/03</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">差戻し日</div>
				<div class="form_Normal">2013/01/04</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">申請解除日</div>
				<div class="form_Normal" style="color: red;">2013/02/04</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">不備内容</div>
				<div class="form_Normal">
					新勤務先(法人の他の)の最寄駅が間違っています。<br> 到着駅を「なおず駅」に変更して、登録解除しなおしてください。
				</div>
			</div>
		</div>

		<!-- ===== 申請前後情報 ===== -->
		<div class="content_Form1" style="margin-top: 25px;">
			<div class="form_Title1" id="form_Title1">
				<div></div>
				<div>申請前</div>
				<div>申請後</div>
			</div>

			<!-- 住所 -->
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">住所</div>
				<div class="form_Normal">川崎市高津区上作延1-2-3 レオパレス溝の口103</div>
				<div class="form_Normal"
					style="display: flex; flex-direction: column; gap: 5px; align-items: flex-start;">
					<!-- 우편번호 -->
					<div style="display: flex; align-items: center; gap: 5px;">
						<input type="text" name="zip1" maxlength="3"
							style="width: 40px; text-align: center;"> - <input
							type="text" name="zip2" maxlength="4"
							style="width: 60px; text-align: center;">
						<button type="button" style="padding: 2px 8px;">検索</button>
					</div>
					<!-- 도도부현 -->
					<div>
						<select name="prefecture" style="width: 120px;">
							<option value="">選択</option>
							<option value="神奈川県" selected>神奈川県</option>
							<option value="東京都">東京都</option>
							<option value="千葉県">千葉県</option>
							<option value="埼玉県">埼玉県</option>
						</select>
					</div>
					<!-- 주소1 -->
					<div>
						<input type="text" name="address1" value="川崎市中原区新丸子1-2-3"
							style="width: 100%;">
					</div>
					<!-- 주소2 -->
					<div>
						<input type="text" name="address2" value="レオパレス新丸子201"
							style="width: 100%;">
					</div>
				</div>
			</div>

			<!-- 勤務先 -->
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">勤務先</div>
				<div class="form_Normal">中野店</div>
				<div class="form_Normal"
					style="display: flex; align-items: center; gap: 5px;">
					<span>江戸川店</span>
					<button type="button"
						style="border: none; background: none; cursor: pointer;">
						<img src="/resources/img/tn/search_btn02.gif" alt="search"
							style="vertical-align: middle;">
					</button>
				</div>
			</div>

			<!-- 勤務地 -->
			<div class="form_Text1" id="form_Text1">
				<div class="form_Column">勤務地</div>
				<div class="form_Normal">東京都中野区中野3-30-4 KDX中野坂上ビル8F</div>
				<div class="form_Normal">東京都江戸川区船堀2-1-5</div>
			</div>
		</div>


		<!-- ===== 経路① ===== -->
		<!-- ===== 경로 정보 ===== -->
		<div class="content_Form2" style="margin-top: 20px; font-size: 13px;">
			<!-- 제목줄 -->
			<div class="form_Title2"
				style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
				経路①</div>

			<!-- 본문 내용 -->
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">通勤手段</div>
				<div class="form_Normal">自動車（一般）</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">経路 自</div>
				<div class="form_Normal">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">経路 至</div>
				<div class="form_Normal">東京都中野区本町3-30-4 KDX中野坂上ビル8F</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">距離</div>
				<div class="form_Normal">8.3km</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">有料道路 IC</div>
				<div class="form_Normal">用賀IC ～ 中野IC</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">有料道路 片道</div>
				<div class="form_Normal">850円</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">1ヶ月金額</div>
				<div class="form_Normal">22 × 22 × 160 / 10 × 23 + 850 × 2 ×
					23 = 55,929円</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">月当月実勤務回数</div>
				<div class="form_Normal"
					style="display: flex; align-items: center; gap: 5px;">
					<input type="text" value="15"
						style="width: 50px; text-align: center; border: 1px solid #ccc; height: 20px;">
					回
				</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">月当月金額</div>
				<div class="form_Normal"
					style="display: flex; align-items: center; gap: 10px;">
					<span>46,076円</span>
					<button type="button"
						style="border: 1px solid #ccc; background: #f3f3f3; font-size: 12px; cursor: pointer; padding: 2px 10px;">
						計算</button>
				</div>
			</div>
		</div>


		<!-- 오른쪾 정렬 버튼 예제 -->
		<div class="button_Right">
			<div class="button_Right_Group">
				<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01">
			</div>
		</div>




		<!-- Multi Form 예제 -->
		<div class="multi_Form">
			<div class="content_Form1" style="width: 330px; margin: 0;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">免許証コピー</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">免許証有効期限</div>
					<div class="form_Normal">2015/10/21</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">免許証番号</div>
					<div class="form_Normal">1234-5678-90</div>
				</div>
			</div>
			<div class="content_Form1" style="width: 330px; margin: 0;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">車検証コピー</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">車種</div>
					<div class="form_Normal">ベンツ</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">ナンバー</div>
					<div class="form_Normal">品川 300 い 1111</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">排気量</div>
					<div class="form_Normal">3000CC</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">車検有効期限</div>
					<div class="form_Normal">2014/12/24</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">燃費</div>
					<div class="form_Normal">15km/L</div>
				</div>
			</div>
			<div class="content_Form1" style="width: 330px; margin: 0;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">保険証券コピー（場所）</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">保険証券コピー（郵便内容）</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">保険満了日</div>
					<div class="form_Normal">2015/10/21</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対人賠償</div>
					<div class="form_Normal">無制限万円</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対物賠償</div>
					<div class="form_Normal">無制限万円</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">人身障害</div>
					<div class="form_Normal">無制限万円</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">搭乗者障害</div>
					<div class="form_Normal">無制限万円</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">等級</div>
					<div class="form_Normal">3級等級</div>
				</div>
			</div>

		</div>

		<!-- 오른쪾 정렬 버튼 예제 -->
		<div class="button_Right">
			<div class="button_Right_Group">
				<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01">
			</div>
		</div>

		<!-- ===== 経路② ===== -->
		<div class="content_Form2" style="margin-top: 25px; font-size: 13px;">
			<!-- 제목줄 -->
			<div class="form_Title2"
				style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
				経路②</div>

			<!-- 본문 내용 -->
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">通勤手段</div>
				<div class="form_Normal">バス</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">経路</div>
				<div class="form_Normal">下作延(バス) → 溝峰台駅(バス)</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">金額</div>
				<div class="form_Normal">13,120円 / 1ヶ月 32,000円 / 3ヶ月 70,000円 /
					6ヶ月</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">片道料金</div>
				<div class="form_Normal">450円</div>
			</div>
		</div>
		<!-- ===== 付随書類 (経路② 하단 작은 표, 왼쪽 정렬) ===== -->
		<div class="multi_Form"
			style="justify-content: flex-start; margin-top: 15px;">
			<div class="content_Form1" style="width: 330px; margin: 0;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">定期コピー</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">初回定期期間</div>
					<div class="form_Normal">1カ月</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">次回以降定期期間</div>
					<div class="form_Normal"></div>
				</div>
			</div>
		</div>



		<!-- 오른쪾 정렬 버튼 예제 -->
		<div class="button_Right">
			<div class="button_Right_Group">
				<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01">
			</div>
		</div>


		<!-- ===== 経路③ ===== -->
		<div class="content_Form2" style="margin-top: 25px; font-size: 13px;">
			<!-- 제목줄 -->
			<div class="form_Title2"
				style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
				経路③</div>

			<!-- 본문 내용 -->
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">通勤手段</div>
				<div class="form_Normal">電車</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">経路</div>
				<div class="form_Normal">東京駅 → 金町駅</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">金額</div>
				<div class="form_Normal">15,000円 / 1ヶ月 45,000円 / 3ヶ月 80,000円 /
					6ヶ月</div>
			</div>

			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">片道料金</div>
				<div class="form_Normal">18,000円</div>
			</div>
		</div>


		<div class="multi_Form"
			style="justify-content: flex-start; margin-top: 15px;">
			<div class="content_Form1" style="width: 330px; margin: 0;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="">定期コピー</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">初回定期期間</div>
					<div class="form_Normal">1カ月</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">次回以降定期期間</div>
					<div class="form_Normal"></div>
				</div>
			</div>
		</div>

		<!-- 오른쪾 정렬 버튼 예제 -->
		<div class="button_Right">
			<div class="button_Right_Group">
				<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01">
			</div>
		</div>



		<!-- 1번째 테이블 -->
		<div class="content_Form1">
			<div class="form_Text1" style="display: flex;">
				<div class="form_Column" style="width: 100px;">その他</div>
				<div class="form_Normal" style="width: 450px;">
					<a href="#" style="color: blue; text-decoration: underline;">その他</a>
				</div>
				<div class="form_Normal" style="width: 460px;">コメント</div>
			</div>
		</div>

		<!-- 2번째 테이블 -->
		<div class="content_Form1">
			<div class="form_Text1" style="display: flex;">
				<div class="form_Column" style="width: 100px;">その他</div>
				<div class="form_Normal" style="width: 450px;">
					<a href="#" style="color: blue; text-decoration: underline;">その他</a>
				</div>
				<div class="form_Normal" style="width: 460px;">コメント</div>
			</div>
		</div>

		<!-- 3번째 테이블 -->
		<div class="content_Form1">
			<div class="form_Text1" style="display: flex;">
				<div class="form_Column" style="width: 100px;">その他</div>
				<div class="form_Normal" style="width: 450px;">
					<a href="#" style="color: blue; text-decoration: underline;">その他</a>
				</div>
				<div class="form_Normal" style="width: 460px;">コメント</div>
			</div>
		</div>

		<!-- 4번째 테이블 -->
		<div class="content_Form1">
			<div class="form_Text1" style="display: flex;">
				<div class="form_Column" style="width: 100px;">その他</div>
				<div class="form_Normal" style="width: 450px;">
					<a href="#" style="color: blue; text-decoration: underline;">その他</a>
				</div>
				<div class="form_Normal" style="width: 460px;">コメント</div>
			</div>
		</div>

		<!-- 5번째 테이블 -->
		<div class="content_Form1">
			<div class="form_Text1" style="display: flex;">
				<div class="form_Column" style="width: 100px;">その他</div>
				<div class="form_Normal" style="width: 450px;">
					<a href="#" style="color: blue; text-decoration: underline;">その他</a>
				</div>
				<div class="form_Normal" style="width: 460px;">コメント</div>
			</div>
		</div>

		<!-- 오른쪾 정렬 버튼 예제 -->
		<div class="button_Right">
			<div class="button_Right_Group">
				<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01">
			</div>
		</div>

		<!-- ===== 申請区分 섹션 ===== -->
		<div class="content_Form1">
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">申請区分</div>
				<div class="form_Normal">農納</div>
			</div>
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">申請理由</div>
				<div class="form_Normal">
					<textarea
						style="width: 100%; min-height: 60px; border: 1px solid #ccc; padding: 5px;"></textarea>
				</div>
			</div>
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">離納日／移転日</div>
				<div class="form_Normal">2013/04/10</div>
			</div>
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">転入日</div>
				<div class="form_Normal">2013/04/09</div>
			</div>
			<div class="form_Text1" id="form_Text2">
				<div class="form_Column">開始日</div>
				<div class="form_Normal"></div>
			</div>
		</div>

		<!-- ===== 하단 버튼 (한 줄 정렬) ===== -->
		<div class="button_Side" style="margin-top: 40px;">
			<div class="button_Side_Group">
				<img src="/resources/img/back_btn01.gif" alt="back_btn01"> <img
					src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01">
				<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02">
			</div>
		</div>

	</div>




	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>