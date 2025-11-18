<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認画面</title>
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	#form_Title1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	.form_Text2 > div {
		min-width: 25px;
		text-align: left;
		padding: 5px;
		font-size: 13px;
		align-items: center;
	}
	#form_Text2 {
		display: grid;
		grid-template-columns: 1fr 2fr 1fr 2fr;
	}
	
	#form_Text3 {
		display: grid;
		grid-template-columns: 1fr 2fr;
	}
	
	#form_Text4 {
		display: grid;
		grid-template-columns: 2fr 3fr;
	}
	
	#form_Text5 {
		display: grid;
		grid-template-columns: 1fr 4fr;
		text-align: center;
	}
	
	.form_Column {
		display: flex;
		align-items: center;
	}
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<div class = "flow">
					<div class = "flow_others">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_others">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_current">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				<div class="subtitle">確認</div>
			</div>
			<div>下記内容で問題がなければ申請ボタンを押してください。</div>
			<div class="content_Form1">
				<div class="form_Text2" id="form_Text2">
					<div class="form_Column">社員番号</div>
					<div class="form_Normal">123456</div>
					<div class="form_Column">社員名</div>
					<div class="form_Normal">田中　太郎</div>
				</div>
			</div>
			<div class="content_Form1">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal">
						川崎市高津区上作延1-2-3<br>
						レオパレス溝の口103
					</div>
					<div class="form_Normal">
						神奈川県川崎市中原区新丸子1-2-3<br>
						レオパレス新丸子201
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">
						中野店
					</div>
					<div class="form_Normal">
						江戸川店
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務前</div>
					<div class="form_Normal">
						東京都中野区本町3-30-4KDX中野坂上ビル8F
					</div>
					<div class="form_Normal">
						東京都江戸川区船堀2-1-5
					</div>
				</div>
			</div>
			<div class="content_Form2">
				<div class="form_Title2" id="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">自動車(一般)</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経路　自</div>
					<div class="form_Normal">神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経路　至</div>
					<div class="form_Normal">東京都中野区本町3-30-4KDX中野坂上ビル8F</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経由地</div>
					<div class="form_Normal">東京都渋谷区松濤1-2-3</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">距離</div>
					<div class="form_Normal">8.2km</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">有料道路　IC</div>
					<div class="form_Normal">用賀IC　～　中野IC</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">有料道路　片道</div>
					<div class="form_Normal">850円</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">有料道路利用理由</div>
					<div class="form_Normal">下道が渋滞するため</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経由地入力理由</div>
					<div class="form_Normal">幹線道路が渋滞するため</div>
				</div>
			</div>
			<div class = "multi_Form">
				<div class = "content_Form1" style="width: 330px; margin: 0;">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">付随書類</div>
						<div class="form_Normal"><a href = "">免許証コピー</a></div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">免許証有効期限</div>
						<div class="form_Normal">2015/10/21</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">免許証番号</div>
						<div class="form_Normal">1234-5678-90</div>
					</div>
				</div>
				<div style="border: solid 1px #a0a0a0; width: 330px;">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">付随書類</div>
						<div class="form_Normal"><a href = "">車検書コピー</a></div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">車種</div>
						<div class="form_Normal">ベンツ</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">登録番号</div>
						<div class="form_Normal">1234-5678-90</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">排気量</div>
						<div class="form_Normal">3000cc</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">車検有効期限</div>
						<div class="form_Normal">2014/12/24</div>
					</div>
				</div>
				<div style="border: solid 1px #a0a0a0; width: 330px;">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">付随書類</div>
						<div class="form_Normal"><a href = "">保険書コピー</a></div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">保険満了日</div>
						<div class="form_Normal">2015/10/21</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">対人賠償</div>
						<div class="form_Normal">無制限</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">対物賠償</div>
						<div class="form_Normal">無制限</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">人身障害</div>
						<div class="form_Normal">無制限</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">搭乗者障害</div>
						<div class="form_Normal">無制限</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">等級</div>
						<div class="form_Normal">3級</div>
					</div>
				</div>
			</div>
			<div class="content_Form2">
				<div class="form_Title2" id="form_Title2">経路②</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">バス</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">バス会社</div>
					<div class="form_Normal">○○バス</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経路</div>
					<div class="form_Normal">下作延　→　宮崎台駅</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">金額</div>
					<div class="form_Normal">13.120円/1ヶ月　37.000円/3ヶ月　70.000円/6ヶ月</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">片道料金</div>
					<div class="form_Normal">450円</div>
				</div>
			</div>
			<div class = "multi_Form">
				<div class="content_Form1" style="width: 330px; margin: 0;">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">付随書類</div>
						<div class="form_Normal">定期コピー</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">初回定期期間</div>
						<div class="form_Normal">１ヶ月</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">次回以降定期期間</div>
						<div class="form_Normal">1ヶ月</div>
					</div>
				</div>
				<div style="width: 330px; margin: 0;">
				</div>
				<div style="width: 330px; margin: 0;">
				</div>
			</div>
			<div class="content_Form2">
				<div class="form_Title2" id="form_Title2">経路③</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">電車</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経路</div>
					<div class="form_Normal">東京駅　→　倉賀野駅</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">金額</div>
					<div class="form_Normal">15.000円/1ヶ月　45.000円/3ヶ月　80.000円/6ヶ月</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">片道料金</div>
					<div class="form_Normal">18.000円</div>
				</div>
			</div>
			<div class = "multi_Form">
				<div class="content_Form1" style="width: 330px; margin: 0;">
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">付随書類</div>
						<div class="form_Normal">定期コピー</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">初回定期期間</div>
						<div class="form_Normal">１ヶ月</div>
					</div>
					<div class="form_Text1" id="form_Text3">
						<div class="form_Column">次回以降定期期間</div>
						<div class="form_Normal">6ヶ月</div>
					</div>
				</div>
				<div style="width: 330px; margin: 0;">
				</div>
				<div style="width: 330px; margin: 0;">
				</div>
			</div>
			<div style="flex; flex-direction: column; gap: 5px;">
				<div class="content_Form1" style="margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							その他
						</div>
						<div class="form_Normal">
							コメント
						</div>
					</div>
				</div>
				<div class="content_Form1" style="margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							その他
						</div>
						<div class="form_Normal">
							コメント
						</div>
					</div>
				</div>
				<div class="content_Form1" style="margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							その他
						</div>
						<div class="form_Normal">
							コメント
						</div>
					</div>
				</div>
				<div class="content_Form1" style="margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							その他
						</div>
						<div class="form_Normal">
							コメント
						</div>
					</div>
				</div>
				<div class="content_Form1" style="margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							その他
						</div>
						<div class="form_Normal">
							コメント
						</div>
					</div>
				</div>
			</div>
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">異動</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">
						<textarea style="height: 30px; width: 750px; overflow-y: scroll; resize: none;"></textarea>
					</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">異動日 / 移転日</div>
					<div class="form_Normal">2013/04/10</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">2013/04/09</div>
				</div>
				<div class="form_Text1" id="form_Text5">
					<div class="form_Column">経路変更日</div>
					<div class="form_Normal">2013/04/09</div>
				</div>
			</div>
			<div class="button_Left">
				<div class="button_Left_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01">
					<img src="/resources/img/shinsei_btn01.gif" alt="next_btn01">
					<img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

</body>
</html>