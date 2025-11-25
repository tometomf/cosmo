<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 윤종운 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付随書類入力画面</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
		background-color: white;
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
	
	.keiro-header {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 0 0 5px 0;
	}
	
	.content_Form3 {
		width: 500px;
		margin-left: 15px;
	    border: solid 1px #a0a0a0;
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
	
	.form_Column {
		display: flex;
		align-items: center;
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
	
	.form_Text2 > div {
		min-width: 25px;
		text-align: left;
		/* padding: 5px; */
		font-size: 13px;
		align-items: center;
	}
	
	.form_Keiro {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
	}

</style>
<body>
<%-- <c:set var="applyCommute" value="${formData.shinseiFuzuiShoruiList[0].tsukinShudanKbn}"/>
<c:set var="currentCommute" value="${formData.currentTsukinShudan}"/>
<c:choose>
	자동차(03) 또는 오토바이(04) 그룹을 정의
	<c:set var="isCarOrBikeApply" value="${applyCommute eq '03' or applyCommute eq '04'}"/>
	<c:set var="isCarOrBikeCurrent" value="${currentCommute eq '03' or currentCommute eq '04'}"/>
	
	① 「현재=자동차/오토바이」 → 「신청=자동차/오토바이」 의 경우
	<c:when test="${isCarOrBikeCurrent and isCarOrBikeApply}">
		① 현재의 데이터(면허증, 차검증, 보험증권)를 표시하며, 변경 옵션을 제공 
		<jsp:include page="/WEB-INF/views/idoconfirm/fuzuiParts/car_current_maintain.jsp"/>
	</c:when>
	
	② 「현재=자동차/오토바이 이외」 → 「신청=자동차/오토바이」 의 경우
	<c:when test="${!isCarOrBikeCurrent and isCarOrBikeApply}">
		② 현재 데이터 없이 면허증, 차검증, 보험증권을 전부 입력받음 (신규 등록)
		<jsp:include page="/WEB-INF/views/idoconfirm/fuzuiParts/car_new_entry.jsp"/>
	</c:when>
	
	③ 「신청=버스(02) 또는 전차(01) 의 경우
	<c:when test="${applyCommute eq '05' or applyCommute eq '06'}">
		③ 새로운 정기권을 입력받음
		<jsp:include page="/WEB-INF/views/idoconfirm/fuzuiParts/other_upload.jsp"/>
	</c:when>
	
	<c:otherwise>
		매칭되는 통근수단이 없을 경우 오류 메시지 또는 기본 처리
		<div style="color: red;">エラー: 不明な通勤手段コードです (${applyCommute})</div>
	</c:otherwise>
</c:choose> --%>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class = "flow">
					<div class = "flow_others">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_others">経路入力</div>
					<div class = "flow_current">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				<div class="subtitle">付随書類入力</div>
			</div>
			<div class="main_Content">
				<div class="keiro">
					<div class="keiro-box">経路①</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">自動車(一般)</div>
						</div>
					</div>
					<div class="content_Form2">
						<div class="form_Title2">
							<div>免許証</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
								<div>変更する</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">免許証コピー</div>
							<div class="form_Normal">
								<a href="">表示</a>
							</div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">免許証有効期限</div>
							<div class="form_Normal">2015/10/21</div>
							<div class="form_Normal">
								<input type="text">
								<img src="/resources/img/cal_icon.gif" alt="cal_icon">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">免許証番号</div>
							<div class="form_Normal"><a href="">表示</a></div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
					</div>
					<div class="content_Form2">
						<div class="form_Title2">
							<div class="form_Normal">車検証</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
								<div>変更する</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">車検証コピー</div>
							<div class="form_Normal"><a href="">表示</a></div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">車種</div>
							<div class="form_Normal">トヨタ</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">ナンバー</div>
							<div class="form_Normal">横浜 300に 1234</div>
							<div style="display: flex; flex-direction: column;">
								<div style="display: flex; flex-direction: row; gap: 5px;">
									<div style="width: 50px;"></div>
									<input type="text" style="width: 40px;">
									<input type="text" style="width: 40px;">
									<input type="text" style="width: 40px;">
									<input type="text" style="width: 40px;">
								</div>
								<div style="display: flex; flex-direction: row; gap: 5px;">
									<div style="width: 60px;">(記入例)</div>
									<div style="width: 50px;">品川</div>
									<div style="width: 55px;">300</div>
									<div style="width: 40px;">い</div>
									<div style="width: 40px;">1111</div>
								</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">排気量</div>
							<div class="form_Normal">3000</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">cc
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">車検有効期限</div>
							<div class="form_Normal">2014/12/24</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<img src="/resources/img/cal_icon.gif" alt="cal_icon">
							</div>
						</div>
					</div>
					<div class="content_Form2">
						<div class="form_Title2">
							<div>保険証券</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
								<div>変更する</div>
							</div>
						</div>
						<div style="border-left: solid 1px #EDEDED; border-right: solid 1px #EDEDED; padding-top: 10px; padding-bottom: 10px;">
							※保険証券コピーは、満了日の記載部分が両方確認できるようにアップロードしてください。
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column" style="border-top: 1px solid #a0a0a0;">保険証券コピー①</div>
							<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
								<a href="">表示</a>
							</div>
							<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">保険証券コピー②</div>
							<div class="form_Normal">
								<a href="">表示</a>
							</div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">保険満了日</div>
							<div class="form_Normal" style="display: flex; flex-direction: column; align-items: flex-start;">
								<div>2013/03/31</div>
								<div style="color: red;">※まもなく期限が切れます。</div>
							</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<img src="/resources/img/cal_icon.gif" alt="cal_icon">
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">対人賠償</div>
							<div class="form_Normal">無制限</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<div>万円</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">対物賠償</div>
							<div class="form_Normal">無制限</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<div>万円</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">人身障害</div>
							<div class="form_Normal">無制限</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<div>万円</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">搭乗者障害</div>
							<div class="form_Normal">無制限</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<div>万円</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">等級</div>
							<div class="form_Normal">3等級</div>
							<div class="form_Normal">
								<input type="text" style="width: 250px;">
								<div>等級</div>
							</div>
						</div>
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-box">経路②</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">バス</div>
						</div>
					</div>
					<div class="content_Form2">
						<div class="form_Title2">
							<div>定期券</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
								<div>定期券を追加する</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">定期コピー</div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">初回購入　定期期間</div>
							<div class="form_Normal">1ヶ月</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">次回購入　定期期間</div>
							<div class="form_Normal">1ヶ月</div>
						</div>
					</div>
				</div>
				<div class="keiro">
					<div class="keiro-box">経路③</div>
					<div class="content_Form3">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column1">通勤手段</div>
							<div class="form_Normal1">電車</div>
						</div>
					</div>
					<div class="content_Form2">
						<div class="form_Title2">
							<div>定期券</div>
							<div style="display: flex; gap: 5px; cursor: pointer;">
								<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
								<div>定期券を追加する</div>
							</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">定期コピー</div>
							<div class="form_Normal">
								<input type="text">
								<input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">初回購入　定期期間</div>
							<div class="form_Normal">
								<select>
									<option value="">-------------</option>
									<option value="">test</option>
								</select>
							</div>
						</div>
						<div class="form_Text1" id="form_Text3">
							<div class="form_Column">次回購入　定期期間</div>
							<div>6ヶ月</div>
						</div>
					</div>
				</div>
			</div>
			<div style="flex; flex-direction: column; gap: 5px;">
				<div style="width: 1040px; margin: auto; color: mediumblue;">
					※急な異動の場合なので今までの通勤路での定期券を既に購入済の場合、ここにアップロードしてください。
				</div>
				<div style="width: 1040px; margin-left: 70%;">
					コメント入力欄
				</div>
				<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							<input type="text">
							<input type="button" value="参照">
							<input type="button" value="アップロード">
						</div>
						<div class="form_Normal">
							<input type="text" style="width: 300px;">
						</div>
					</div>
				</div>
				<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							<input type="text">
							<input type="button" value="参照">
							<input type="button" value="アップロード">
						</div>
						<div class="form_Normal">
							<input type="text" style="width: 300px;">
						</div>
					</div>
				</div>
				<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							<input type="text">
							<input type="button" value="参照">
							<input type="button" value="アップロード">
						</div>
						<div class="form_Normal">
							<input type="text" style="width: 300px;">
						</div>
					</div>
				</div>
				<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							<input type="text">
							<input type="button" value="参照">
							<input type="button" value="アップロード">
						</div>
						<div class="form_Normal">
							<input type="text" style="width: 300px;">
						</div>
					</div>
				</div>
				<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">その他</div>
						<div class="form_Normal">
							<input type="text">
							<input type="button" value="参照">
							<input type="button" value="アップロード">
						</div>
						<div class="form_Normal">
							<input type="text" style="width: 300px;">
						</div>
					</div>
				</div>
			</div>
			<div class="button_Left">
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
<!-- <script>
	// 「変更する」 링크를 클릭 시, 해당 정보의 입력란 표시
	function toggleInput(targetId) {
		var inputArea = document.getElementById(targetId);
		var displayState = inputArea.style.display;
		
		if (displayState === 'none' || displayState === '') {
			// 숨겨져 있으면 보이게 하고, '変更する' 링크를 숨김
			inputArea.style.display = 'block';
			
		} else {
			// 보이면 다시 숨김 (토글 기능 구현)
			inputArea.style.display = 'none';
		}
	}
</script> -->