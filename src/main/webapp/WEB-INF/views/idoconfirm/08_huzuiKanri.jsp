<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 윤종운 -->

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
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
<%--
	<!-- 신청 통근수단(applyCommute) 현재 통근수단(currentCommute) 정의 -->
	<c:set var="applyCommute" value="${formData.shinseiFuzuiShoruiList[0].tsukinShudanKbn}"/>
	<c:set var="currentCommute" value="${formData.currentTsukinShudan}"/>
	<!-- 자동차(03) 또는 오토바이(04) 그룹을 정의 -->
	<c:set var="isCarOrBikeApply" value="${applyCommute eq '03' or applyCommute eq '04'}"/>
	<c:set var="isCarOrBikeCurrent" value="${currentCommute eq '03' or currentCommute eq '04'}"/>
	<c:choose>
		<!-- ① 「현재 통근수단=자동차/오토바이」 → 「신청 통근수단=자동차/오토바이」 의 경우 -->
		<c:when test="${isCarOrBikeCurrent and isCarOrBikeApply}">
			<!-- ① 현재의 데이터(면허증, 차검증, 보험증권)를 표시하며, 변경 옵션을 제공 --> 
		</c:when>
		
		<!-- ② 「현재 통근수단=자동차/오토바이 이외」 → 「신청 통근수단=자동차/오토바이」 의 경우 -->
		<c:when test="${!isCarOrBikeCurrent and isCarOrBikeApply}">
			<!-- ② 현재 데이터 없이 면허증, 차검증, 보험증권을 전부 입력받음 (신규 등록) -->
		</c:when>
		
		<!-- ③ 「신청 통근수단=버스(02) 또는 전차(01) 의 경우 -->
		<c:when test="${applyCommute eq '02' or applyCommute eq '01'}">
			<!-- ③ 새로운 정기권을 입력받음 -->
		</c:when>
		
		<!-- ④ 「신청내용의 통근수단=그 외(07)/자전거(05)/산보(06)」 의 경우 -->
		<c:when test="${applyCommute eq '07' or applyCommute eq '05' or applyCommute eq '06'}">
			<!-- ④ 그 외 업로드(5개 제한)만 입력해 받는다. -->
		</c:when>
		<c:otherwise>
			매칭되는 통근수단이 없을 경우 오류 메시지 또는 기본 처리
			<div style="color: red;">エラー: 不明な通勤手段コードです (${applyCommute})</div>
		</c:otherwise>
	</c:choose>
--%>

	<!-- 신청 통근수단(applyCommute) 현재 통근수단(currentCommute) 정의 -->
	<c:set var="applyCommute" value="${formData.shinseiFuzuiShoruiList[0].tsukinShudanKbn}"/>
	<c:set var="currentCommute" value="${formData.currentTsukinShudan}"/>
	<!-- 자동차(03) 또는 오토바이(04) 그룹을 정의 -->
	<c:set var="isCarOrBikeApply" value="${applyCommute eq '03' or applyCommute eq '04'}"/>
	<c:set var="isCarOrBikeCurrent" value="${currentCommute eq '03' or currentCommute eq '04'}"/>
	<div class="layout">
		<input type="hidden" id="kigyoCdPkField"
			value="${formData.shinseiList[0].kigyoCd}"/>
		<input type="hidden" id="shainUidPkField"
			value="${formData.shinseiList[0].shainUid}"/>
		<input type="hidden" id="shinseiNoPkField"
			value="${formData.shinseiList[0].shinseiNo}"/>
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
			<form id="fuzuiShoruiForm">
			<%-- <c:choose> --%>
				<div class="main_Content">
					<!-- ① 「현재 통근수단=자동차/오토바이」 → 「신청 통근수단=자동차/오토바이」 의 경우 -->
					<%-- <c:when test="${isCarOrBikeCurrent and isCarOrBikeApply}"> --%>
						<!-- ① 현재의 데이터(면허증, 차검증, 보험증권)를 표시하며, 변경 옵션을 제공 --> 
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
									<div style="display: flex; gap: 5px; cursor: pointer;" onclick="toggleMultipleInputs(['menkyoInput1','menkyoInput2','menkyoInput3']); return false;">
										<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
										<div>
											変更する
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">免許証コピー</div>
									<div class="form_Normal">
										<div id="fileDisplayArea_FILE_UID_4">
											<a href="#" onclick="showDocument('hiddenFileUidField_FILE_UID_4'); return false;">免許証</a>
											<a href="#" onclick="deleteFile('hiddenFileUidField_FILE_UID_4'); return false;">
												<img src="/resources/img/clear_icon.gif">
											</a>
										</div>
									</div>
									<div class="form_Normal">
										<div id="menkyoInput1" style="display: none;">
											<input type="hidden" id="hiddenFileUidField_FILE_UID_4" name="fileUid4" value="${formData.shainFuzuiShoruiList[0].fileUid4}"/>
											<input type="text" id="selectedFileName_FILE_UID_4" readonly>
											<input type="file" id="realFileInput_FILE_UID_4" name="fileUid4" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_4', 'selectedFileName_FILE_UID_4')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_4').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_4')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">免許証有効期限</div>
									<div class="form_Normal" style="display: flex; flex-direction: column; align-items: flex-start;">
										
										<div id="kigenYmdDisplayArea">
											<c:choose>
												<c:when test="${!empty formattedMenkyoKigen}">${formattedMenkyoKigen}</c:when>
												<c:otherwise>--/--/--</c:otherwise>
											</c:choose>
										</div>
										
										<div id="kigenExpiredMsg" style="color: red; display: none;">※期限が切れています。</div>
										<div id="kigenNearExpireMsg" style="color: red; display: none;">※まもなく期限が切れます。</div>
										
									</div>
									<div class="form_Normal">
										<div id="menkyoInput2" style="display: none;">
											<input type="text" id="newMenkyoKigenInput" maxlength="8" readonly style="width: 250px;">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon" id="cal_icon_menkyo" style="cursor: pointer;">
										</div>
										<input type="hidden" id="finalKigenYmdField" name="shainFuzuiShoruiList[0].menkyoYukoKigen" value="${formData.shainFuzuiShoruiList[0].menkyoYukoKigen}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">免許証番号</div>
									<div class="form_Normal">
										<div id="menkyoNoDisplayArea">
											<c:set var="menkyoNo" value="${formData.shainFuzuiShoruiList[0].menkyoNo}"/>
											<c:if test="${not empty menkyoNo and menkyoNo.length() == 12}">
												${menkyoNo}
											</c:if>
										</div>
									</div>
									<div class="form_Normal">
										<div id="menkyoInput3" style="display: none;">
											<input type="text" id="newMenkyoNoInput" maxlength="12" oninput="updateMenkyoNo(this.value)">
										</div>
										<input type="hidden" id="finalMenkyoNoField" 
											name="shainFuzuiShoruiList[0].menkyoNo" 
											value="${formData.shainFuzuiShoruiList[0].menkyoNo}"/>
									</div>
								</div>
							</div>
							<div class="content_Form2">
								<div class="form_Title2">
									<div>車検証</div>
									<div style="display: flex; gap: 5px; cursor: pointer;" onclick="toggleMultipleInputs(['shakenInput1','shakenInput2','shakenInput3','shakenInput4','shakenInput5']); return false;">
										<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
										<div>変更する</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">車検証コピー</div> <!-- 임시커밋 -->
									<div class="form_Normal">
										<div id="fileDisplayArea_FILE_UID_5">
											<a href="#" onclick="showDocument('hiddenFileUidField_FILE_UID_5'); return false;">車検証</a>
											<a href="#" onclick="deleteFile('hiddenFileUidField_FILE_UID_5'); return false;">
												<img src="/resources/img/clear_icon.gif">
											</a>
										</div>
									</div>
									<div class="form_Normal">
										<div id="shakenInput1" style="display: none;">
											<input type="hidden" id="hiddenFileUidField_FILE_UID_5" name="shakenCopyFile" value="${formData.shainFuzuiShoruiList[0].fileUid5}"/>
											<input type="text" id="selectedFileName_FILE_UID_5" readonly>
											<input type="file" id="realFileInput_FILE_UID_5" name="shakenCopyFile" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_５', 'selectedFileName_FILE_UID_5')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_5').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_5')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">車種</div>
									<div class="form_Normal">
										<div id="shashuDisplayArea">
											<c:if test="${not empty formData.shainFuzuiShoruiList[0].shashu}">
												${formData.shainFuzuiShoruiList[0].shashu}
											</c:if>
											<c:if test="${empty formData.shainFuzuiShoruiList[0].shashu}">
												-
											</c:if>
										</div>
									</div>
									<div class="form_Normal">
										<div id="shakenInput2" style="display: none;">
											<input type="text" id="shashuInput" style="width: 250px;" onblur="updateShashuField('shashuInput', 'shashuDisplayArea', 'shashuFinalField')">
										</div>
									</div>
									<input type="hidden" id="shashuFinalField" name="shashu" value="${formData.shainFuzuiShoruiList[0].shashu}"/>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">ナンバー</div>
									<div class="form_Normal">
										<div id="numberDisplayArea">
											<!-- 横浜 300 に 1234 -->
											<c:set var="torokuNo" value="${formData.shainFuzuiShoruiList[0].torokuNo}"/>
											<c:if test="${not empty torokuNo}">
												${torokuNo}
											</c:if>
										</div>
									</div>
									<div class="form_Normal" style="display: flex; flex-direction: column;">
										<input type="hidden" id="finalTorokuNoField"
											name="shainFuzuiShoruiList[0].torokuNo"
											value="${formData.shainFuzuiShoruiList[0].torokuNo}"/>
										<div id="shakenInput3" style="display: none;">
											<div style="display: flex; flex-direction: row; gap: 5px;">
												<div style="width: 50px;"></div>
												<input type="text" id="inputRegion" style="width: 40px;" maxlength="4" onblur="updateTorokuNoDivided()">
												<input type="text" id="inputClassification" style="width: 40px;" maxlength="3" onblur="updateTorokuNoDivided()">
												<input type="text" id="inputPurpose" style="width: 40px;" maxlenth="1" onblur="updateTorokuNoDivided()">
												<input type="text" id="inputRegisterNo" style="width: 40px;" maxlength="4" onblur="updateTorokuNoDivided()">
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
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">排気量</div>
									<div class="form_Normal">
										<c:if test="${not empty formData.shainFuzuiShoruiList[0].haikiryo}">
											${formData.shainFuzuiShoruiList[0].haikiryo}
										</c:if>
										<c:if test="${empty formData.shainFuzuiShoruiList[0].haikiryo}">
											-
										</c:if>
									</div>
									<div class="form_Normal">
										<div id="shakenInput4" style="display: none;">
											<input type="text" style="width: 250px;">cc
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">車検有効期限</div>
									<div class="form_Normal" style="display: flex; flex-direction: column; align-items: flex-start;">
										
										<div id="shakenYmdDisplayArea">
											<c:choose>
												<c:when test="${!empty formattedShakenKigen}">${formattedShakenKigen}</c:when>
												<c:otherwise>--/--/--</c:otherwise>
											</c:choose>
										</div>
										
										<div id="shakenExpiredMsg" style="color: red; display: none;">※期限が切れています。</div>
										<div id="shakenNearExpireMsg" style="color: red; display: none;">※まもなく期限が切れます。</div>
										
									</div>
									<div class="form_Normal">
										<div id="shakenInput5" style="display: none;">
											<input type="text" id="newShakenInput" maxlength="8" readonly style="width: 250px;">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon" id="cal_icon_shaken" style="cursor: pointer;">
										</div>
										<input type="hidden" id="finalShakenYmdField" name="shainFuzuiShoruiList[0].shakenYukoKigen" value="${formData.shainFuzuiShoruiList[0].shakenYukoKigen}"/>
									</div>
								</div>
							</div>
							<div class="content_Form2">
								<div class="form_Title2">
									<div>保険証券</div>
									<div style="display: flex; gap: 5px; cursor: pointer;"
										onclick="toggleMultipleInputs(['hokenshoKenInput1','hokenshoKenInput2','hokenshoKenInput3',
										'hokenshoKenInput4','hokenshoKenInput5','hokenshoKenInput6','hokenshoKenInput7','hokenshoKenInput8']); return false;">
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
										<div id="fileDisplayArea_FILE_UID_6">
											<a href="#" onclick="showDocument('hiddenFileUidField_FILE_UID_6'); return false;">保険証券①</a>
											<a href="#" onclick="deleteFile('hiddenFileUidField_FILE_UID_6'); return false;">
												<img src="/resources/img/clear_icon.gif">
											</a>
										</div>
									</div>
									<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
										<div id="hokenshoKenInput1" style="display: none;">
											<input type="hidden" id="hiddenFileUidField_FILE_UID_6" name="hokenshoCopyFile" value="${formData.shainFuzuiShoruiList[0].fileUid6}"/>
											<input type="text" id="selectedFileName_FILE_UID_6" readonly>
											<input type="file" id="realFileInput_FILE_UID_6" name="hokenshoCopyFile" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_6', 'selectedFileName_FILE_UID_6')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_6').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_6')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">保険証券コピー②</div>
									<div class="form_Normal">
										<div id="fileDisplayArea_FILE_UID_7">
											<a href="#" onclick="showDocument('hiddenFileUidField_FILE_UID_7'); return false;">保険証券②</a>
											<a href="#" onclick="deleteFile('hiddenFileUidField_FILE_UID_7'); return false;">
												<img src="/resources/img/clear_icon.gif">
											</a>
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput2" style="display: none;">
											<input type="hidden" id="hiddenFileUidField_FILE_UID_7" name="hokenshoCopyFile" value="${formData.shainFuzuiShoruiList[0].fileUid7}"/>
											<input type="text" id="selectedFileName_FILE_UID_7" readonly>
											<input type="file" id="realFileInput_FILE_UID_7" name="hokenshoCopyFile" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_7', 'selectedFileName_FILE_UID_7')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_7').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_7')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">保険満了日</div>
									<div class="form_Normal" style="display: flex; flex-direction: column; align-items: flex-start;">
										
										<div id="hokenYmdDisplayArea">
											<c:choose>
												<c:when test="${!empty formattedHokenManryo}">${formattedHokenManryo}</c:when>
												<c:otherwise>--/--/--</c:otherwise>
											</c:choose>
										</div>
										
										<div id="hokenExpiredMsg" style="color: red; display: none;">※期限が切れています。</div>
										<div id="hokenNearExpireMsg" style="color: red; display: none;">※まもなく期限が切れます。</div>
										
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput3" style="display: none;">
											<input type="text" id="newHokenManryoInput" maxlength="8" readonly style="width: 250px;">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon" id="cal_icon_hoken" style="cursor: pointer;">
										</div>
										<input type="hidden" id="finalHokenManryoField"
											name="shainFuzuiShoruiList[0].hokenManryoYmd"
											value="${formData.shainFuzuiShoruiList[0].hokenManryoYmd}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">対人賠償</div>
									<div class="form_Normal">
										<div id="taijinDisplayArea">
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput4" style="display: none;">
											<input type="text" id="newTaijinInput" style="width: 250px;">
											万円
										</div>
										<input type="hidden" id="finalTaijinField" name="shainFuzuiShoruiList[0].taijinBaisho" value="${formData.shainFuzuiShoruiList[0].taijinBaisho}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">対物賠償</div>
									<div class="form_Normal">
										<div id="taibutsuDisplayArea">
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput5" style="display: none;">
											<input type="text" id="newTaibutsuInput" style="width: 250px;">
											万円
										</div>
										<input type="hidden" id="finalTaibutsuField" name="shainFuzuiShoruiList[0].taibutsuBaisho" value="${formData.shainFuzuiShoruiList[0].taibutsuBaisho}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">人身障害</div>
									<div class="form_Normal">
										<div id="jinshinDisplayArea">
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput6" style="display: none;">
											<input type="text" id="newJinshinInput" style="width: 250px;">
											万円
										</div>
										<input type="hidden" id="finalJinshinField" name="shainFuzuiShoruiList[0].jinshinShogai" value="${formData.shainFuzuiShoruiList[0].jinshinShogai}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">搭乗者障害</div>
									<div class="form_Normal">
										<div id="tojoshaDisplayArea">
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput7" style="display: none;">
											<input type="text" id="newTojoshaInput" style="width: 250px;">
											万円
										</div>
										<input type="hidden" id="finalTojoshaField" name="shainFuzuiShoruiList[0].tojoshaShogai" value="${formData.shainFuzuiShoruiList[0].tojoshaShogai}"/>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">等級</div>
									<div class="form_Normal">
										<div id="tokyuDisplayArea">
										</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput8" style="display: none;">
											<input type="text" id="newTokyuInput" style="width: 250px;">
											等級
										</div>
										<input type="hidden" id="finalTokyuField" name="shainFuzuiShoruiList[0].tokyu" value="${formData.shainFuzuiShoruiList[0].tokyu}"/>
									</div>
								</div>
							</div>
						</div>
					<%-- </c:when> --%>
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
									<div id="teikiInput_Bus">
										<input type="hidden" id="hiddenFileUidField_FILE_UID_1" name="teikiCopyFile" value="${formData.shinseiFuzuiShoruiList[0].fileUid1}"/>
										<input type="text" id="selectedFileName_FILE_UID_1" readonly>
										<input type="file" id="realFileInput_FILE_UID_1" name="teikiCopyFile" style="display: none;"
											onchange="updateFileNameDisplay('realFileInput_FILE_UID_1', 'selectedFileName_FILE_UID_1')">
										<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_1').click();">
										<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_1')">
									</div>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回購入　定期期間</div>
								<div class="form_Normal">
									<div id="finalshokaiField_Bus">
										<select name="shokaiKiganBus">
											<option value="">-------------</option>
											<option value="１ヶ月">1ヶ月</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回購入　定期期間</div>
								<div class="form_Normal">
									<div id="finalJikaiField_Bus">
										<select name="jikaiKiganBus">
											<option value="">-------------</option>
											<option value="１ヶ月">1ヶ月</option>
										</select>
									</div>
								</div>
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
									<div id="teikiInput_Densha">
										<input type="hidden" id="hiddenFileUidField_FILE_UID_1" name="teikiCopyFile" value="${formData.shinseiFuzuiShoruiList[0].fileUid1}"/>
										<input type="text" id="selectedFileName_FILE_UID_1" readonly>
										<input type="file" id="realFileInput_FILE_UID_1" name="teikiCopyFile" style="display: none;"
											onchange="updateFileNameDisplay('realFileInput_FILE_UID_1', 'selectedFileName_FILE_UID_1')">
										<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_1').click();">
										<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_1')">
									</div>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回購入　定期期間</div>
								<div class="form_Normal">
									<div id="finalShokaiField_Densha">
										<select name="shokaiKikanDensha">
											<option value="">-------------</option>
											<option value="１ヶ月">1ヶ月</option>
											<option value="６ヶ月">6ヶ月</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回購入　定期期間</div>
								<div class="form_Normal">
									<div id="finalJikaiField_Densha">
										<select name="jikaiKikanDensha">
											<option value="">-------------</option>
											<option value="１ヶ月">1ヶ月</option>
											<option value="６ヶ月">6ヶ月</option>
										</select>
									</div>
								</div>
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
								<div id = "etcInput1">
									<input type="hidden" id="hiddenFileUidField_ETC_FILE_UID_1" name="etcCopyFile" value="${formData.shinseiList[0].etcFileUid1}"/>
									<input type="text" id="selectedFileName_ETC_FILE_UID_1" readonly>
									<input type="file" id="realFileInput_ETC_FILE_UID_1" name="etcCopyFile" style="display: none;"
										onchange="updateFileNameDisplay('realFileInput_ETC_FILE_UID_1', 'selectedFileName_ETC_FILE_UID_1')">
									<input type="button" value="参照" onclick="document.getElementById('realFileInput_ETC_FILE_UID_1').click();">
									<input type="button" value="アップロード" onclick="uploadFile('ETC_FILE_UID_1')">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "etcCommentInput1">
									<input type="text" id="etcComment_1" name="etcComment1" style="width: 300px;" value="${formData.shinseiList[0].etcComment1}">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "etcInput2">
									<input type="hidden" id="hiddenFileUidField_ETC_FILE_UID_2" name="etcCopyFile" value="${formData.shinseiList[0].etcFileUid2}"/>
									<input type="text" id="selectedFileName_ETC_FILE_UID_2" readonly>
									<input type="file" id="realFileInput_ETC_FILE_UID_2" name="etcCopyFile" style="display: none;"
										onchange="updateFileNameDisplay('realFileInput_ETC_FILE_UID_2', 'selectedFileName_ETC_FILE_UID_2')">
									<input type="button" value="参照" onclick="document.getElementById('realFileInput_ETC_FILE_UID_2').click();">
									<input type="button" value="アップロード" onclick="uploadFile('ETC_FILE_UID_2')">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "etcCommentInput2">
									<input type="text" id="etcComment_2" name="etcComment2" style="width: 300px;" value="${formData.shinseiList[0].etcComment2}">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "etcInput3">
									<input type="hidden" id="hiddenFileUidField_ETC_FILE_UID_3" name="etcCopyFile" value="${formData.shinseiList[0].etcFileUid3}"/>
									<input type="text" id="selectedFileName_ETC_FILE_UID_3" readonly>
									<input type="file" id="realFileInput_ETC_FILE_UID_3" name="etcCopyFile" style="display: none;"
										onchange="updateFileNameDisplay('realFileInput_ETC_FILE_UID_3', 'selectedFileName_ETC_FILE_UID_3')">
									<input type="button" value="参照" onclick="document.getElementById('realFileInput_ETC_FILE_UID_3').click();">
									<input type="button" value="アップロード" onclick="uploadFile('ETC_FILE_UID_3')">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "etcCommentInput3">
									<input type="text" id="etcComment_3" name="etcComment3" style="width: 300px;" value="${formData.shinseiList[0].etcComment3}">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "etcInput1">
									<input type="hidden" id="hiddenFileUidField_ETC_FILE_UID_4" name="etcCopyFile" value="${formData.shinseiList[0].etcFileUid4}"/>
									<input type="text" id="selectedFileName_ETC_FILE_UID_4" readonly>
									<input type="file" id="realFileInput_ETC_FILE_UID_4" name="etcCopyFile" style="display: none;"
										onchange="updateFileNameDisplay('realFileInput_ETC_FILE_UID_4', 'selectedFileName_ETC_FILE_UID_4')">
									<input type="button" value="参照" onclick="document.getElementById('realFileInput_ETC_FILE_UID_4').click();">
									<input type="button" value="アップロード" onclick="uploadFile('ETC_FILE_UID_4')">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "etcCommentInput4">
									<input type="text" id="etcComment_4" name="etcComment4" style="width: 300px;" value="${formData.shinseiList[0].etcComment4}">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "etcInput5">
									<input type="hidden" id="hiddenFileUidField_ETC_FILE_UID_5" name="etcCopyFile" value="${formData.shinseiList[0].etcFileUid5}"/>
									<input type="text" id="selectedFileName_ETC_FILE_UID_5" readonly>
									<input type="file" id="realFileInput_ETC_FILE_UID_5" name="etcCopyFile" style="display: none;"
										onchange="updateFileNameDisplay('realFileInput_ETC_FILE_UID_5', 'selectedFileName_ETC_FILE_UID_5')">
									<input type="button" value="参照" onclick="document.getElementById('realFileInput_ETC_FILE_UID_5').click();">
									<input type="button" value="アップロード" onclick="uploadFile('ETC_FILE_UID_5')">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "etcCommentInput5">
									<input type="text" id="etcComment_5" name="etcComment5" style="width: 300px;" value="${formData.shinseiList[0].etcComment5}">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="button_Left">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="back_btn01" onclick="goBackToCommute();">
						<img src="/resources/img/next_btn01.gif" alt="next_btn01" onclick="submitFuzuiShorui(false); return false;">
						<img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01" onclick="submitFuzuiShorui(true); return false;">
					</div>
				</div>
			<%-- </c:choose> --%>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
<script>
	var originalTorokuNo = '${formData.shainFuzuiShoruiList[0].torokuNo}';
	var originalKigenYmd = '${formData.shainFuzuiShoruiList[0].menkyoYukoKigen}';
	var originalFormattedKigenYmd = '';
	if (originalKigenYmd && originalKigenYmd.length === 8) {
		originalFormattedKigenYmd = originalKigenYmd.substring(0, 4) + '/' + originalKigenYmd.substring(4, 6) + '/' + originalKigenYmd.substring(6, 8);
	}
	var originalShakenYmd = '${formData.shainFuzuiShoruiList[0].shakenYukoKigen}';
	var originalFormattedShakenYmd = '';
	if (originalShakenYmd && originalShakenYmd.length === 8) {
		originalFormattedShakenYmd = originalShakenYmd.substring(0, 4) + '/' + originalShakenYmd.substring(4, 6) + '/' + originalShakenYmd.substring(6, 8);
	}
	var originalHokenYmd = '${formData.shainFuzuiShoruiList[0].hokenManryoYmd}';
	var originalFormattedHokenYmd = '';
	if (originalHokenYmd && originalHokenYmd.length === 8) {
		originalFormattedHokenYmd = originalHokenYmd.substring(0, 4) + '/' + originalHokenYmd.substring(4, 6) + '/' + originalHokenYmd.substring(6, 8);
	}
	const kigenDisplayArea = document.getElementById('kigenYmdDisplayArea');
	if (kigenDisplayArea && originalFormattedKigenYmd) {
		kigenDisplayArea.innerHTML = originalFormattedKigenYmd;
	}
	const shakenDisplayArea = document.getElementById('shakenYmdDisplayArea');
	if (shakenDisplayArea && originalFormattedShakenYmd) {
		shakenDisplayArea.innerHTML = originalFormattedShakenYmd;
	}
	const hokenDisplayArea = document.getElementById('hokenYmdDisplayArea');
	if (hokenDisplayArea && originalFormattedHokenYmd) {
		hokenDisplayArea.innerHTML = originalFormattedHokenYmd;
	}
	var originalMenkyoNo = '${formData.shainFuzuiShoruiList[0].menkyoNo}';
	
	const originalTaijinValue = '${formData.shainFuzuiShoruiList[0].taijinBaisho}';
	const originalTaibutsuValue = '${formData.shainFuzuiShoruiList[0].taibutsuBaisho}';
	const originalJinshinValue = '${formData.shainFuzuiShoruiList[0].jinshinShogai}';
	const originalTojoshaValue = '${formData.shainFuzuiShoruiList[0].tojoshaShogai}';
	
	const originalTokyuValue = '${formData.shainFuzuiShoruiList[0].tokyu}';
	const originalShashuValue = '${formData.shainFuzuiShoruiList[0].shashu};'
	/**
	 * 파일 선택 시, 선택된 파일명을 텍스트 필드에 표시하는 함수
	 */
	function updateFileNameDisplay(fileInputId, displayFieldId) {
		var fileInput = document.getElementById(fileInputId);
		var displayField = document.getElementById(displayFieldId);
		
		if (fileInput.files.length > 0) {
			// 파일명을 텍스트 필드에 표시
			displayField.value = fileInput.files[0].name;
		} else {
			displayField.value = '';
		}
	}

	/**
	 * 파일만 서버로 전송하는 AJAX 업로드 함수
	 * @param {string} fileType - 컬럼명 (예: FILE_UID_4)
	 */
	function uploadFile(fileType) {
		console.log("uploadFile: 수신된 fileType:", fileType);
		
		var fileInput = document.getElementById('realFileInput_' + fileType);
		var hiddenField = document.getElementById('hiddenFileUidField_' + fileType);
		
		if (!fileInput || !hiddenField) {
			console.error("필요한 HTML 요소가 없습니다. ID를 확인하세요:", fileType);
			return;
		}
		
		if (fileInput.files.length === 0) {
			alert('업로드할 파일을 먼저 선택해주세요.');
			return;
		}
		
		var file = fileInput.files[0];
		var formData = new FormData();
		formData.append("uploadFile", file);
		formData.append("fileType", fileType);
		
		// PK 필드 값 가져오기 (이 필드들이 HTML에 반드시 id로 존재해야 함)
		try {
			formData.append("kigyoCd", document.getElementById('kigyoCdPkField').value);
			formData.append("shainUid", document.getElementById('shainUidPkField').value);
			formData.append("shinseiNo", document.getElementById('shinseiNoPkField').value);
		} catch (e) {
			alert("필수 식별 정보(기업코드 등)가 누락되었습니다.");
			return;
		}
		
		// 서버로 전송하는 AJAX 요청
		fetch('/idoconfirm/api/upload/fuzuiShorui', {
			method: 'POST',
			body: formData
		})
		.then(response => {
			if (!response.ok) {
				// 서버에서 BAD_REQUEST(400), UNAUTHORIZED(401), INTERNAL_SERVER_ERROR(500) 등을 보낸 경우
				// 서버의 응답 메시지를 읽어서 에러로 던집니다.
				return response.json().then(errorData => {
					// errorData.message는 서버 컨트롤러에서 설정한 실패 메시지
					throw new Error('HTTP 상태 코드: ' + response.status + ' - ' + errorData.message);
				}).catch(() => {
					// 응답이 JSON 형식이 아닐 경우
					throw new Error('HTTP 상태 코드: ' + response.status + ' - 서버 응답을 파싱할 수 없습니다.');
				});
			}
			
			// HTTP 상태코드가 200 OK인 경우, JSON 파싱 시도
			return response.json();
		})
		.then(data => {
			// 성공 응답 처리 (data.success == true)
			if (data.success) {
				alert('파일 업로드 완료, 서버 UID: ' + data.fileUid);
				// 성공 시 후처리
				
				// 데이터 업데이트
				hiddenField.value = String(data.fileUid);
				// 화면 표시 업데이트
				var displayAreaId = 'fileDisplayArea_' + fileType;
				var displayArea = document.getElementById(displayAreaId);
				
				if (displayArea) {
					var hiddenFieldId = 'hiddenFileUidField_' + fileType;
					// 서류 표시 링크 및 삭제 버튼을 포함하는 HTML 생성
					var newContent = `
						<a href="#" onclick="showDocument('\${hiddenFieldId}'); return false;">表示</a>
						<a href="#" onclick="deleteFile('\${hiddenFieldId}'); return false;">
							<img src="/resources/img/clear_icon.gif">
						</a>
					`;
					displayArea.innerHTML = newContent;
					displayArea.style.display = 'flex';
				}
				
				// 파일 입력 필드 초기화 (선택 파일명 지우기)
				document.getElementById('realFileInput_' + fileType).value = '';
				document.getElementById('selectedFileName_' + fileType).value = '';
			} else {
				// 서버가 200 OK 를 보냈지만 success: false인 경우
				alert('파일 업로드 실패: ' + data.message);
			}
		})
		.catch(error => {
			// 통신 오류, 파싱 오류, HTTP 오류 처리
			console.error('Fetch Error:', error);
			
			alert('파일 처리 오류 발생. 상세: ' + error.message);
		})
	}
	 
	// 「変更する」 링크를 클릭 시, 해당 정보의 입력란 표시
	function toggleMultipleInputs(targetIds) {
		var firstElement = document.getElementById(targetIds[0]);
		if (!firstElement) {
			console.error("첫 번째 타겟  ID를 찾을 수 없습니다: ", targetIds[0]);
			return;
		}
		
		var currentDisplayState = firstElement.style.display;
		
		// 숨김 상태('none' 또는 '')이면 보이게 ('block') 하고, 아니면 숨깁니다.
		var newDisplayState = (currentDisplayState === 'none' || currentDisplayState === '') ? 'block' : 'none';

		// 배열의 모든 ID를 순회하며 상태를 변경합니다.
		for (var i = 0; i < targetIds.length; i++) {
			var inputArea = document.getElementById(targetIds[i]);
			if (inputArea) {
				inputArea.style.display = newDisplayState;
			}
		}
	}
	
	// 서류명 링크 클릭 시, 등록되어있는 서류를 팝업으로 표시
	function showDocument(fileUidFieldId) {
		// 해당 입력 필드의 File UID 값 가져오기
		var fileUidInput = document.getElementById(fileUidFieldId);
		
		if (!fileUidInput) {
			alert('파일 ID 필드를 찾을 수 없습니다.');
			return;
		}
		
		var fileUid = fileUidInput.value;
		
		if (!fileUid || fileUid === '0') {
			alert('등록된 파일이 없습니다.');
			return;
		}
		
		// 파일 뷰어 팝업 URL 구성 (Controller의 뷰어 엔드포인트 호출)
		var viewerUrl = '/idoconfirm/viewDocument?fileUid=' + fileUid;

		window.open(viewerUrl, 'documentViewer', 'width=800, height=600, scrollbars=yes, resizable=yes');
	}
	
	function deleteFile(fileUidFieldId) {
		var fileUidInput = document.getElementById(fileUidFieldId);
		
		if (!fileUidInput) {
			alert('파일 ID 필드를 찾을 수 없습니다.');
			return;
		}

		if (confirm("파일을 삭제하시겠습니까?")) {
			// 1. 파일 UID 입력 필드의 값을 비움 (다음 저장 시 반영)
			fileUidInput.value = '';

			// 2. 파일 타입 추출 (예: FILE_UID_4)
			var fileType = fileUidFieldId.replace('hiddenFileUidField_', '');

			// 3. UI 처리
			// 3-1. '表示/삭제' 영역 (fileDisplayArea) 처리
			var displayArea = document.getElementById('fileDisplayArea_' + fileType);
			if (displayArea) {
				// 해당 영역의 내용을 비우고 (링크 제거)
				displayArea.innerHTML = '';
				// 해당 영역을 숨깁니다.
				displayArea.style.display = 'none';
			}

			// 3-2. '참조/업로드' 버튼이 포함된 영역 (menkyoInput1) 다시 보이기
			var fileControlArea = document.getElementById('menkyoInput1');
			if (fileControlArea) {
				// 해당 컨트롤 영역을 다시 보이게 합니다.
				fileControlArea.style.display = 'block'; // 또는 'flex'
			}

			// 3-3. 파일명 표시 필드 초기화
			var selectedFileNameInput = document.getElementById('selectedFileName_' + fileType);
			if (selectedFileNameInput) {
				selectedFileNameInput.value = '';
			}

			// 4. 삭제 알림
			alert('파일이 삭제 목록에 추가되었습니다. "次え" 또는 "一時保存" 버튼을 눌러 저장하면 반영됩니다.');
		}
	}
	function goBackToCommute() {
		window.location.href = '/idoconfirm/keiroInfo';
	}
	/**
	 * 폼 전송 (다음 버튼 또는 일시보존 버튼)
	 * @param {boolean} isTempSave - true면 일시보존, false면 다음 화면으로 전송
	 */
	function submitFuzuiShorui(isTempSave) {
		var form = document.getElementById('fuzuiShoruiForm');
		
		// 1. 일시 보존이 아닐 때만 유효성 검사 수행
		if (!isTempSave) {
			if (!validateRequiredFields()) {
				return; // 유효성 검사 실패 시 전송 중단
			}
			
			// 그 외 입력항목 필수 체크 및 코멘트-파일 연관성 체크
			if (!validateOtherUploads()) {
				return; // 유효성 검사 실패 시 전송 중단
			}
		}
		// 2. Action URL 설정
		if (isTempSave) {
			// 일시 보존 (tempSave) 엔드포인트 설정
			form.action = '/idoconfirm/tempSaveFuzui';
		} else {
			// 다음 화면 엔드포인트 설정
			form.action = '/idoconfirm/kakuninpage';
		}
		// 3. 폼 전송
		form.submit();
	}
	/**
	 * 일반적인 필수 필드 검사 함수
	 * 
	 */
	function validateRequiredFields() {
		return true; // 임시
	}
	/**
	 * 'その他' 업로드 항목의 파일/코멘트 연관성 체크
	 * 파일이 없는 경우 코멘트를 입력하면 에러 메시지 표시
	 */
	 function validateOtherUploads() {
		// 앞서 HTML에서 정의한 ID 구조와 일치시킵니다.
		const OTHER_FIELDS = [
			{ uid: 'hiddenFileUidField_ETC_FILE_UID_1', comment: 'etcComment_1' },
			{ uid: 'hiddenFileUidField_ETC_FILE_UID_2', comment: 'etcComment_2' },
			{ uid: 'hiddenFileUidField_ETC_FILE_UID_3', comment: 'etcComment_3' },
			{ uid: 'hiddenFileUidField_ETC_FILE_UID_4', comment: 'etcComment_4' },
			{ uid: 'hiddenFileUidField_ETC_FILE_UID_5', comment: 'etcComment_5' }
		];
		
		for (var i = 0; i < OTHER_FIELDS.length; i++) {
			var field = OTHER_FIELDS[i];
			var fileUidInput = document.getElementById(field.uid);
			var commentInput = document.getElementById(field.comment);
			
			// 필드가 화면에 존재하는지 먼저 확인
			if (!commentInput) continue;

			var commentValue = commentInput.value.trim();
			// 파일 UID 체크: 필드가 없거나, 값이 비어있거나, 값이 '0'인 경우
			var isFileMissing = (!fileUidInput || fileUidInput.value === '' || fileUidInput.value === '0');
			
			// [규칙] 코멘트는 있는데 파일이 없는 경우
			if (commentValue !== '' && isFileMissing) {
				alert("기타 코멘트(" + (i + 1) + ")를 입력한 경우, 반드시 파일을 업로드해야 합니다.");
				commentInput.focus();
				return false;
			}

			// [추가 규칙] 파일은 있는데 코멘트가 없는 경우도 체크
			if (commentValue === '' && !isFileMissing) {
				alert("기타 서류(" + (i + 1) + ")를 업로드한 경우, 코멘트를 반드시 입력해야 합니다.");
				commentInput.focus();
				return false;
			}
		}
		return true;
	}
	function updateDateInput(
			inputYmd,
			displayAreaId,
			finalFieldId,
			inputFieldId,
			originalFormattedYmd, // 예: "2025/12/31"
			originalYmd           // 예: "20251231"
		) {
		const displayArea = document.getElementById(displayAreaId);
		const finalField = document.getElementById(finalFieldId);
		const inputField = document.getElementById(inputFieldId);
		
		// 필수 요소 확인
		if (!displayArea || !finalField) {
			console.error('필수 DOM 요소를 찾을 수 없습니다.');
			return;
		}
		
		// 1. 숫자만 남기고 8자리인지 확인
		const ymd = inputYmd.replace(/[^0-9]/g, '');
		if (ymd.length === 8) {
			// 2. 유효한 8자리 숫자일 경우: 화면 표시 형식으로 변환 (YYYY/MM/DD)
			try {
				const formattedYmd = ymd.substring(0, 4) + '/' + ymd.substring(4, 6) + '/' + ymd.substring(6, 8);
				
				// 화면에 갱신된 날짜 표시
				displayArea.innerHTML = formattedYmd;
				
				// 폼 제출 시 서버로 전송할 Hidden 필드의 값 갱신 (8자리 원본)
				finalField.value = ymd;
			} catch (e) {
				// substring 관련 예외 발생 시
				console.error("날짜 포맷 중 오류 발생:", e);
			}
		} else {
			// 3. 8자리가 아닐 경우 (오류 처리)
			
			// 3-1. 경고 메시지 표시
			alert('有効期限は半角数字8桁(YYYYMMDD)で入力してください。')
			// 3-2. 입력 필드 값 초기화 (입력 중이던 값 제거)
			if (inputField) {
				inputField.value = '';
			}
			// 3-3. 화면 표시 영역을 원본 값으로 복구 (YYYY/MM/DD 형식)
			if (originalFormattedYmd) {
				displayArea.innerHTML = originalFormattedYmd;
			}

			// 3-4. Hidden 필드 값 복구 (DB 원본 8자리 숫자)
			if (originalYmd) {
				finalField.value = originalYmd;
			}
		}
	}
	function updateExpirationMessage(ymd8, elementIdPrefix) {
		const today = new Date();
		today.setHours(0, 0, 0, 0); // 시간 정보를 제거하여 날짜만 비교
		
		// 1. 만료일 Date 객체 생성 (MM/DD/YYYY 순서로 파싱)
		const year = parseInt(ymd8.substring(0, 4), 10);
		const month = parseInt(ymd8.substring(4, 6), 10) - 1; // 월은 0부터 시작
		const day = parseInt(ymd8.substring(6, 8), 10);
		const expireDate = new Date(year, month, day);
		expireDate.setHours(0, 0, 0, 0); // 만료일도 0시 0분 0초로 설정
		
		// --- 디버깅 포인트 A ---
		console.log(`[${elementIdPrefix}] 오늘 날짜 (Today):`, today);
		console.log(`[${elementIdPrefix}] 선택된 만료일 (Expire):`, expireDate);

		let isExpired = false;
		let isNearExpire = false;
		
		// 만료일과 오늘 날짜의 차이 계산
		const diffTime = expireDate.getTime() - today.getTime();
		
		// 밀리초를 일(day)로 변환
		const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
		// Math.ceil을 사용하여 0시 0분 0초 기준의 오차 보정
		
		// --- 디버깅 포인트 B ---
		console.log(`[${elementIdPrefix}] 날짜 차이 (Diff Days):`, diffDays);
		
		// 2. 만료 여부 확인
		if (diffDays < 0) {
			// 이미 날짜가 지남 (만료)
			isExpired = true;
		} else {
			// 3. 임박 여부 확인 (0일 후 ~ 30일 후)
			// today(0일 후)는 임박에 포함시키고, 31일 이상 남았으면 임박 아님
			if (diffDays <= 30) {
				isNearExpire = true;
			}
		}
		
		// --- 디버깅 포인트 C ---
		console.log(`[${elementIdPrefix}] 상태:`, 'isExpired:', isExpired, 'isNearExpire:', isNearExpire);

		// 4. 메시지 표시/숨김 처리
		const expiredMsgId = elementIdPrefix + 'ExpiredMsg'; // 예: hokenExpiredMsg
		const nearExpireMsgId = elementIdPrefix + 'NearExpireMsg'; // 예: hokenNearExpireMsg

		// 모두 숨김 처리
		$('#' + expiredMsgId).hide();
		$('#' + nearExpireMsgId).hide();

		// 조건에 따라 표시
		if (isExpired) {
			$('#' + expiredMsgId).show();
		} else if (isNearExpire) {
			$('#' + nearExpireMsgId).show();
		}
	}
	/**
	 * 면허증 번호(4-4-2 포맷, 총 12글자)를 입력받아 화면을 갱신하고 Hidden 필드에 저장합니다.
	 * DB에 하이픈을 포함한 12글자 그대로 저장합니다.
	 * @param {string} inputNo - 입력된 문자열 (예: 1234-5678-90)
	 */
	function updateMenkyoNo(inputNo) {
		const displayArea = document.getElementById('menkyoNoDisplayArea');
		const finalField = document.getElementById('finalMenkyoNoField');
		const inputField = document.getElementById('newMenkyoNoInput');

		// 1. 유효성 검사를 위한 정규 표현식 (4숫자-4숫자-2숫자, 총 12글자)
		const menkyoNoPattern = /^\d{4}-\d{4}-\d{2}$/;

		// 2. 검증: 입력된 값이 12글자이고 패턴(4-4-2)이 일치하는지 확인
		if (inputNo.length === 12 && menkyoNoPattern.test(inputNo)) {

			// 3. 유효성 검사 통과
			
			// 화면 표시: 입력된 포맷된 값 그대로 표시 (12글자)
			displayArea.innerHTML = inputNo; 

			// 서버 전송 값 갱신: 하이픈을 포함한 12글자 그대로 Hidden 필드에 저장
			finalField.value = inputNo; 

		} else {
			// 4. 유효성 검사 실패 (12자리가 아니거나 패턴 불일치)

			// 입력 필드가 비어있지 않고 유효성 검사에 실패한 경우에만 경고 표시
			if (inputNo.length > 0) {
				alert('免許証番号は「4桁-4桁-2桁」の形式(合計12文字)で入力してください。 (例: 1234-5678-90)');
			}

			// 입력 필드 값 초기화
			if (inputField) {
				inputField.value = '';
			}

			// 화면 표시 영역을 원본 값으로 복구 (하이픈 포함 12글자)
			displayArea.innerHTML = originalMenkyoNo;

			// Hidden 필드 값 복구 (DB 원본 12글자)
			finalField.value = originalMenkyoNo;
		}
	}
	/**
	 * 분리된 입력 필드로부터 차량 등록번호를 결합하고 유효성을 검사합니다.
	 * 포맷: [지역명] [분류번호] [용도기호] [4자리 번호]
	 */
	function updateTorokuNoDivided() {
		const region = document.getElementById('inputRegion').value.trim();           // 地域名
		const classification = document.getElementById('inputClassification').value.trim(); // 分類番号
		const purpose = document.getElementById('inputPurpose').value.trim();       // 用途記号
		const registerNo = document.getElementById('inputRegisterNo').value.trim();   // 登録番号

		const displayArea = document.getElementById('numberDisplayArea');
		const finalField = document.getElementById('finalTorokuNoField');
		
		const allInputs = [region, classification, purpose, registerNo];

		// 1. 모든 필드가 비어있는지 확인 (초기 상태 또는 삭제 시)
		if (allInputs.every(input => input === '')) {
			// 모든 필드가 비어있으면 초기값으로 되돌림 (여기서는 DB 원본 값)
			displayArea.innerHTML = originalTorokuNo;
			finalField.value = originalTorokuNo;
			return;
		}
		
		// 모든 필드에 값이 채워져 있지 않으면 유효성 검사를 진행하지 않고 종료
		if (allInputs.some(input => input === '')) {
			return;
		}

		// 2. 유효성 검사
		// a) 지역명: 한자 1~4글자 (정확한 한자 범위는 복잡하므로 여기서는 빈칸이 아닌지만 확인)
		if (region.length === 0 || region.length > 4) {
			// [지역명]이 비어있거나 너무 길면 오류 처리
			return validateAndCombine(false, '地域名は1文字以上4文字以下で入力してください。', region, classification, purpose, registerNo);
		}
		
		// b) 분류번호: 3자리 숫자
		if (!/^\d{3}$/.test(classification)) {
			// [분류번호]가 3자리 숫자가 아니면 오류 처리
			return validateAndCombine(false, '分類番号は3桁の半角数字で入力してください。', region, classification, purpose, registerNo);
		}

		// c) 용도기호: 1자리 히라가나/가타카나 (예: 'あ' 또는 'ア')
		if (!/^[あ-んア-ン]$/.test(purpose) || purpose.length !== 1) {
			// [용도기호]가 1자리 히라가나/가타카나가 아니면 오류 처리
			return validateAndCombine(false, '用途記号は1文字のひらがなまたはカタカナで入力してください。', region, classification, purpose, registerNo);
		}

		// d) 등록번호: 4자리 숫자
		if (!/^\d{4}$/.test(registerNo)) {
		// [등록번호]가 4자리 숫자가 아니면 오류 처리
			return validateAndCombine(false, '登録番号は4桁の半角数字で入力してください。', region, classification, purpose, registerNo);
		}

		// 3. 유효성 통과 및 결합
		const combinedNo = `\${region} \${classification} \${purpose} \${registerNo}`;
		
		// 화면 및 Hidden 필드 갱신
		displayArea.innerHTML = combinedNo;
		finalField.value = combinedNo;
	}

	/**
	 * 유효성 검사 결과에 따라 메시지를 표시하고 값을 처리하는 헬퍼 함수
	 */
	function validateAndCombine(isValid, message, region, classification, purpose, registerNo) {
		const displayArea = document.getElementById('numberDisplayArea');
		const finalField = document.getElementById('finalTorokuNoField');
		
		// 1. 입력 필드 값 결합 (미완성 값)
		const partialNo = [region, classification, purpose, registerNo].filter(n => n.length > 0).join(' ');
		
		// 2. 미완성된 값이라도 일단 화면에 표시하여 사용자가 입력 상황을 알 수 있도록 함
		displayArea.innerHTML = partialNo;
		finalField.value = partialNo; // 미완성된 값도 일단 Hidden 필드에 저장 (일시 저장 대비)
		
		// 3. 오류 메시지 표시
		if (!isValid) {
			alert(message);
		}
	}
	// DOM이 완전히 로드된 후 실행되도록 document.ready를 사용합니다.
	$(document).ready(function() {
		
		// 현재 DB 값에 따라 초기 경고 메시지를 표시합니다.
		// (이 로직이 없으면 초기 화면에서는 JSTL이 출력한 메시지만 보임)
		if (originalKigenYmd && originalKigenYmd.length === 8) {
			updateExpirationMessage(originalKigenYmd, 'kigen');
		}
		if (originalShakenYmd && originalShakenYmd.length === 8) {
			updateExpirationMessage(originalShakenYmd, 'shaken');
		}
		if (originalHokenYmd && originalHokenYmd.length === 8) {
			updateExpirationMessage(originalHokenYmd, 'hoken');
		}
		
		if (originalTaijinValue) {
			updateBaishoField('newTaijinInput', 'taijinDisplayArea', 'finalTaijinField');
		}
		if (originalTaibutsuValue) {
			updateBaishoField('newTaibutsuInput', 'taibutsuDisplayArea', 'finalTaibutsuField');
		}
		if (originalJinshinValue) {
			updateBaishoField('newJinshinInput', 'jinshinDisplayArea', 'finalJinshinField');
		}
		if (originalTojoshaValue) {
			updateBaishoField('newTojoshaInput', 'tojoshaDisplayArea', 'finalTojoshaField');
		}
		
		// ================
		// 1. 면허증 유효 기간
		// ================
		// 1. Datepicker를 입력 필드에 연결하고 형식 설정
		$("#newMenkyoKigenInput").datepicker({
			dateFormat: 'yy/mm/dd', 
			onSelect: function(dateText, inst) {
				const ymd8 = dateText.replace(/\//g, ''); 
				updateDateInput(
					ymd8,
					'kigenYmdDisplayArea',
					'finalKigenYmdField',
					'newMenkyoKigenInput',
					originalFormattedKigenYmd,
					originalKigenYmd
				);
				
				// 만료 메시지 갱신
				updateExpirationMessage(ymd8, 'kigen');
			}
		});
		$('#cal_icon_menkyo').on('click', function() {
			$("#newMenkyoKigenInput").datepicker("show");
		});
		// ================
		// 2. 차검증 유효 기간
		// ================
		$("#newShakenInput").datepicker({
			dateFormat: 'yy/mm/dd',
			onSelect: function(dateText, inst) {
				const ymd8 = dateText.replace(/\//g, '');
				updateDateInput(
					ymd8,
					'shakenYmdDisplayArea',           // 차검증 표시 영역 ID
					'finalShakenYmdField',            // 차검증 Hidden 필드 ID
					'newShakenInput',
					originalFormattedShakenYmd,       // 차검증 원본 포맷 변수
					originalShakenYmd                 // 차검증 원본 YYYYMMDD 변수
				);
				
				// 만료 메시지 갱신
				updateExpirationMessage(ymd8, 'shaken');
			}
		});
		$('#cal_icon_shaken').on('click', function() { // 아이콘 ID: #cal_icon_shaken
			$("#newShakenInput").datepicker("show");
		});
		// ================
		// 3. 보험 만료일
		// ================
		$("#newHokenManryoInput").datepicker({
			dateFormat: 'yy/mm/dd',
			onSelect: function(dateText, inst) {
				const ymd8 = dateText.replace(/\//g, '');
				updateDateInput(
					ymd8,
					'hokenYmdDisplayArea',           // 보험 표시 영역 ID
					'finalHokenManryoField',            // 보험 Hidden 필드 ID
					'newHokenManryoInput',
					originalFormattedHokenYmd,       // 보험 원본 포맷 변수
					originalHokenYmd                 // 보험 원본 YYYYMMDD 변수
				);
				
				// 만료 메시지 갱신
				updateExpirationMessage(ymd8, 'hoken');
			}
		});
		$('#cal_icon_hoken').on('click', function() { // 아이콘 ID: #cal_icon_hoken
			$("#newHokenManryoInput").datepicker("show");
		});
		// ================
		// 4. 배상/상해 보험 금액 초기값 설정 및 화면 표시
		// ================
		
		// 헬퍼 함수: 값이 유효한지 확인 (null, undefined, '', 'null' 문자열 제외)
		function isValidInitialValue(value) {
			// 값이 존재하고, 문자열이며, 길이가 0보다 크고, 'null' 문자열이 아닐 때 유효하다고 판단
			if (!value || typeof value !== 'string' || value.length === 0 || value.toLowerCase() === 'null') {
				return false;
			}
			if (value === '無制限') {
				return false;
			}
			return true;
		}
		// ======
		// 대인 배상
		// ======
		const taijinInput = $('#newTaijinInput');
		const originalTaijin = originalTaijinValue;
		// DB 값이 유효한 경우 (숫자가 있는 경우)
		if (isValidInitialValue(originalTaijin)) {
			taijinInput.val(originalTaijin); // 입력 필드에 DB 값 설정
		} else {
			// DB 값이 없거나 '無制限'인 경우 (빈 값으로 처리)
			taijinInput.val(''); // 입력 필드 비움
		}
		// DB 값 유무와 관계없이 updageBaishoField 호출 (빈 값이면 함수 내부에서 '無制限' 처리)
		updateBaishoField('newTaijinInput', 'taijinDisplayArea', 'finalTaijinField');
		// ======
		// 대물 배상
		// ======
		const taibutsuInput = $('#newTaibutsuInput');
		const originalTaibutsu = originalTaibutsuValue;
		// DB 값이 유효한 경우 (숫자가 있는 경우)
		if (isValidInitialValue(originalTaibutsu)) {
			taibutsuInput.val(originalTaibutsu); // 입력 필드에 DB 값 설정
		} else {
			// DB 값이 없거나 null인 경우 (無制限 처리 대상)
			taibutsuInput.val(''); // 입력 필드 비움
		}
		// DB 값 유무와 관계없이 updageBaishoField 호출 (빈 값이면 함수 내부에서 '無制限' 처리)
		updateBaishoField('newTaibutsuInput', 'taibutsuDisplayArea', 'finalTaibutsuField');
		// ======
		// 인신 상해
		// ======
		const jinshinInput = $('#newJinshinInput');
		const originalJinshin = originalJinshinValue;
		// DB 값이 유효한 경우 (숫자가 있는 경우)
		if (isValidInitialValue(originalJinshin)) {
			taijinInput.val(originalJinshin); // 입력 필드에 DB 값 설정
		} else {
			// DB 값이 없거나 null인 경우 (無制限 처리 대상)
			jinshinInput.val(''); // 입력 필드 비움
		}
		// DB 값 유무와 관계없이 updageBaishoField 호출 (빈 값이면 함수 내부에서 '無制限' 처리)
		updateBaishoField('newJinshinInput', 'jinshinDisplayArea', 'finalJinshinField');
		// ======
		// 탑승자 상해
		// ======
		const tojoshaInput = $('#newTojoshaInput');
		const originalTojosha = originalTojoshaValue;
		// DB 값이 유효한 경우 (숫자가 있는 경우)
		if (isValidInitialValue(originalTojosha)) {
			tojoshaInput.val(originalTojosha); // 입력 필드에 DB 값 설정
		} else {
			// DB 값이 없거나 null인 경우 (無制限 처리 대상)
			tojoshaInput.val(''); // 입력 필드 비움
		}
		// DB 값 유무와 관계없이 updageBaishoField 호출 (빈 값이면 함수 내부에서 '無制限' 처리)
		updateBaishoField('newTojoshaInput', 'tojoshaDisplayArea', 'finalTojoshaField');
		
		// ================
		// 5. 등급(等級) 초기값 설정 및 화면 표시
		// ================
		const tokyuInput = $('#newTokyuInput');
		const originalTokyu = originalTokyuValue;
		
		// 5-1. 초기값 설정
		if (isValidInitialValue(originalTokyu)) {
			tokyuInput.val(originalTokyu);
		} else {
			tokyuInput.val('');
		}
		
		// 5-2. 화면 표시 갱신
		updateTokyuField('newTokyuInput', 'tokyuDisplayArea', 'finalTokyuField');
		
		// Blur 이벤트 연결
		$('#newTaijinInput').on('blur', function() {
			updateBaishoField('newTaijinInput', 'taijinDisplayArea', 'finalTaijinField');
		});
		$('#newTaibutsuInput').on('blur', function() {
			updateBaishoField('newTaibutsuInput', 'taibutsuDisplayArea', 'finalTaibutsuField');
		});
		$('#newJinshinInput').on('blur', function() {
			updateBaishoField('newJinshinInput', 'jinshinDisplayArea', 'finalJinshinField');
		});
		$('#newTojoshaInput').on('blur', function() {
			updateBaishoField('newTojoshaInput', 'tojoshaDisplayArea', 'finalTojoshaField');
		});
		$('#newTokyuInput').on('blur', function() {
			updateTokyuField('newTokyuInput', 'tokyuDisplayArea', 'finalTokyuField');
		});
	});
	function updateBaishoField(inputId, displayId, finalFieldId) {
		const inputField = document.getElementById(inputId);
		const displayArea = document.getElementById(displayId);
		const finalField = document.getElementById(finalFieldId);
		
		if (!inputField || !displayArea || !finalField) {
			console.error("필수 DOM 요소를 찾을 수 없습니다:", inputId, displayId, finalFieldId);
			return;
		}
		
		let inputValue = inputField.value.trim();
		
		// 1. 값이 비어있을 경우 (무제한/기본값 처리)
		if (inputValue === '') {
			displayArea.innerHTML = '無制限'; // 화면 표시
			finalField.value = ''; // Hidden 필드 값
			return;
		}
		
		// 2. 숫자 유효성 검사
		const numericValue = inputValue.replace(/[^0-9]/g, '');
		
		if (inputValue.toUpperCase() === '無制限' || inputValue.toUpperCase() === 'ムセイゲン') {
			displayArea.innerHTML = '無制限';
			finalField.value = '';
			inputField.value = '';
			return;
		}
		
		if (numericValue.length === 0) {
			alert('배상 금액은 숫자만 입력하거나 비워두어야 합니다.');
			inputField.value = ''; // 입력 필드 초기화
			displayArea.innerHTML = '--';
			finalField.value = '';
			return;
		}
		
		// 3. 형식화 및 갱신
		const formattedValue = new Intl.NumberFormat('ja-JP').format(parseInt(numericValue, 10));
		
		// 화면 표시 갱신
		displayArea.innerHTML = `\${formattedValue}万円`;
		
		// Hidden 필드 갱신
		finalField.value = numericValue;
	}
	/**
	 * Tokyu(특급) 입력 필드의 값을 읽어 표시 영역과 Hidden 필드를 업데이트합니다.
	 * @param {string} inputId - 입력 필드의 ID (예: 'newTokyuInput')
	 * @param {string} displayId - 표시 영역의 ID (예: 'tokyuDisplayArea')
	 * @param {string} finalFieldId - Hidden 필드의 ID (예: 'finalTokyuField')
	 */
	function updateTokyuField(inputId, displayId, finalFieldId) {
		const inputField = document.getElementById(inputId);
		const displayArea = document.getElementById(displayId);
		const finalField = document.getElementById(finalFieldId);
		
		if (!inputField || !displayArea || !finalField) {
			console.error("필수 DOM 요소를 찾을 수 없습니다:", inputId, displayId, finalFieldId);
			return;
		}
		
		let inputValue = inputField.value.trim();
		
		if (inputValue === '') {
			displayArea.innerHTML = '--';
			finalField.value = '';
			return;
		}
		// 2. 숫자 유효성 검사
		const numericValue = inputValue.replace(/[^0-9]/g, '');
		
		if (numericValue.length === 0) {
			alert('등급은 숫자만 입력해야합니다.');
			inputField.value = ''; // 입력 필드 초기화
			displayArea.innerHTML = '--';
			finalField.value = '';
			return;
		}
		
		// 3. 화면 표시 갱신
		displayArea.innerHTML = `\${numericValue}等級`;
		
		// 4. Hidden 필드  갱신
		finalField.value = numericValue;
	}
	function updateShashuField(inputId, displayId, finalFieldId) {
		// 1. DOM 요소 가져오기
		const inputField = document.getElementById(inputId);
		const displayArea = document.getElementById(displayId);
		const finalField = document.getElementById(finalFieldId);
		
		// 필수 요소 체크
		if (!inputField || !displayArea || !finalField) {
			console.error("필수 DOM 요소를 찾을 수 없습니다:", inputId, displayId, finalFieldId);
			return;
		}
		
		let inputValue = inputField.value.trim();
		
		// 2. 입력값이 비어있는 경우
		if (inputValue === '') {
			if (typeof originalShashuValue !== 'undefined' && originalShashuValue !== null && originalShashuValue.trim() !== '') {
				displayArea.innerHTML = originalShashuValue;
				finalField.value = originalShashuValue;
			} else {
				displayArea.innerHTML = '-';
				finalField.value = '';
			}
			return;
		}
		// 3. 문자열 유효성 검사
		const MAX_LENGTH = 50;
		if (inputValue.length > MAX_LENGTH) {
			alert(`차종은 \${MAX_LENGTH}자 이하로 입력해야 합니다.`);
			inputField.value = inputValue.substring(0, MAX_LENGTH);
			inputValue = inputField.value.trim();
		}
		// 4. 화면 표시 갱신
		displayArea.innerHTML = inputValue;
		// 5. Hidden 필드 갱신
		finalField.value = inputValue;
	}
</script>
</body>
</html>