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

<script>
	var originalKigenYmd = `\${formData.shainFuzuiShoruiList[0].menkyoYukoKigen}`;
	var originalFormattedYmd = '';
	if (originalKigenYmd && originalKigenYmd.length === 8) {
		originalFormattedYmd = originalKigenYmd.substring(0, 4) + '/' + originalKigenYmd.substring(4, 6) + '/' + originalKigenYmd.substring(6, 8);
	}
	var originalMenkyoNo = '${formData.shainFuzuiShoruiList[0].menkyoNo}';
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
		var displayAreaId = 'fileDisplayArea_' + fileType;
		var dtoFieldNameMap = {
				'FILE_UID_1' : 'fileUid1',
				'FILE_UID_2' : 'fileUid2',
				'FILE_UID_3' : 'fileUid3',
				'FILE_UID_4' : 'fileUid4',
				'FILE_UID_5' : 'fileUid5',
				'FILE_UID_6' : 'fileUid6',
				'FILE_UID_7' : 'fileUid7'
		};
		var dtoFieldName = dtoFieldNameMap[fileType]
		
		var fileUidFieldName = 'shainFuzuiShoruiList[0].' + dtoFieldName;
		
		if (fileInput.files.length === 0) {
			alert('업로드할 파일을 먼저 선택해주세요.');
			return;
		}
		
		var file = fileInput.files[0];
		
		// FormData 객체 생성: 파일 및 기타 데이터를 서버로 전송할 때 사용
		var formData = new FormData();
		formData.append("uploadFile", file);
		formData.append("fileType", fileType);
		
		// 복합 PK를 구성하는 KIGYO_CD와 SHAIN_UID 필드의 값을 가져옵니다.
		// 1. KIGYO_CD 가져오기 (해당 필드가 HTML에 존재해야 합니다.)
		var kigyoCd = document.getElementById('kigyoCdPkField').value;
		formData.append("kigyoCd", kigyoCd);

		// 2. SHAIN_UID 가져오기 (해당 필드가 HTML에 존재해야 합니다.)
		var shainUid = document.getElementById('shainUidPkField').value;
		formData.append("shainUid", shainUid);
		
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
				hiddenField.value = String(data.fileUid);
				var displayArea = document.getElementById(displayAreaId);
				var hiddenFieldId = 'hiddenFileUidField_' + fileType;
				if (displayArea) {
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
		const OHTER_FIELDS = [
			{ uid: 'hiddenFileUidField_ETC_1', comment: 'commentField_ETC_1' },
			{ uid: 'hiddenFileUidField_ETC_2', comment: 'commentField_ETC_2' },
			{ uid: 'hiddenFileUidField_ETC_3', comment: 'commentField_ETC_3' },
			{ uid: 'hiddenFileUidField_ETC_4', comment: 'commentField_ETC_4' },
			{ uid: 'hiddenFileUidField_ETC_5', comment: 'commentField_ETC_5' }
		];
		
		for (var i = 0; i < OTHER_FIELDS.length; i++) {
			var field = OTHER_FIELDS[i];
			var fileUidInput = document.getElementById(field.uid);
			var commentInput = document.getElementById(field.comment);
			// 필드가 존재하지 않으면 건너뜁니다. (JSP 에서 모든 5개가 렌더링되지 않았을 경우)
			if (!commentInput) continue;
			// [규칙] 코멘트를 입력했는데, 파일 UID가 없는 경우 에러 처리
			// 파일 UID 체크: 필드가 없거나, 값이 비어있거나, 값이 '0'인 경우 (업로드 안됨)
			var isFileMissing = (!fileUidInput || fileUidInput.value === '' || fileUidInput.value === '0');
			
			if (commentInput.value.trim() !== '' && isFileMissing) {
				alert(`코멘트(\${i + 1})를 입력한 경우, 반드시 파일을 첨부해야 합니다. (その他 항목)`);
				commentInput.focus();
				return false;
			}
		}
		return true;
	}
	function updateKigenYmd(inputYmd) {
		const displayArea = document.getElementById('kigenYmdDisplayArea');
		const finalField = document.getElementById('finalKigenYmdField');
		const inputField = document.getElementById('newKigenYmdInput');
		
		// 1. 숫자만 남기고 8자리인지 확인
		const ymd = inputYmd.replace(/[^0-9]/g, '');
		if (ymd.length === 8) {
			// 2. 유효한 8자리 숫자일 경우: 화면 표시 형식으로 변환 (YYYY/MM/DD)
			const formattedYmd = `\${ymd.substring(0.4)}/\${ymd.substring(4,6)/\${ymd.substring(6,8)}`;
			
			// 화면에 갱신된 날짜 표시
			displayArea.innerHTML = formattedYmd;
			
			// 폼 제출 시 서버로 전송할 Hidden 필드의 값 갱신 (8자리 원본)
			finalField.value = ymd;
		} else {
			// 3. 8자리가 아닐 경우 (오류 처리)
			
			// 3-1. 경고 메시지 표시
			alert('有効期限は半角数字8桁(YYYYMMDD)で入力してください。')
			// 3-2. 입력 필드 값 초기화 (입력 중이던 값 제거)
			if (inputField) {
				inputField.value = '';
			}
			// 3-3. 화면 표시 영역을 원본 값으로 복구 (YYYY/MM/DD 형식)
			displayArea.innerHTML = originalFormattedYmd;

			// 3-4. Hidden 필드 값 복구 (DB 원본 8자리 숫자)
			finalField.value = originalKigenYmd;
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
</script>

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
			<c:choose>
				<div class="main_Content">
					<!-- ① 「현재 통근수단=자동차/오토바이」 → 「신청 통근수단=자동차/오토바이」 의 경우 -->
					<c:when test="${isCarOrBikeCurrent and isCarOrBikeApply}">
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
											<input type="hidden" id="hiddenFileUidField_FILE_UID_4" name="menkyoCopyFile" value="${formData.shainFuzuiShoruiList[0].fileUid4}"/>
											<input type="text" id="selectedFileName_FILE_UID_4" readonly>
											<input type="file" id="realFileInput_FILE_UID_4" name="menkyoCopyFile" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_4', 'selectedFileName_FILE_UID_4')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_4').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_4')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">免許証有効期限</div>
									<div class="form_Normal">
										<div id="kigenYmdDisplayArea">
											<c:set var="kigenYmd" value="${formData.shainFuzuiShoruiList[0].menkyoYukoKigen}"/>
											<c:if test="${not empty kigenYmd and kigenYmd.length() == 8}">
												${kigenYmd.substring(0, 4)}/${kigenYmd.substring(4, 6)}/${kigenYmd.substring(6, 8)}
											</c:if>
										</div>
									</div>
									<div class="form_Normal">
										<div id="menkyoInput2" style="display: none;">
											<input type="text" id="newKigenInput" maxlength="8" oninput="updateKigenYmd(this.value)">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon">
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
										<div id="fileDisplayArea_FILE_UID_4">
											<a href="#" onclick="showDocument('hiddenFileUidField_FILE_UID_4'); return false;">免許証</a>
											<a href="#" onclick="deleteFile('hiddenFileUidField_FILE_UID_4'); return false;">
												<img src="/resources/img/clear_icon.gif">
											</a>
										</div>
									</div>
									<div class="form_Normal">
										<div id="menkyoInput1" style="display: none;">
											<input type="hidden" id="hiddenFileUidField_FILE_UID_4" name="menkyoCopyFile" value="${formData.shainFuzuiShoruiList[0].fileUid4}"/>
											<input type="text" id="selectedFileName_FILE_UID_4" readonly>
											<input type="file" id="realFileInput_FILE_UID_4" name="menkyoCopyFile" style="display: none;"
												onchange="updateFileNameDisplay('realFileInput_FILE_UID_4', 'selectedFileName_FILE_UID_4')">
											<input type="button" value="参照" onclick="document.getElementById('realFileInput_FILE_UID_4').click();">
											<input type="button" value="アップロード" onclick="uploadFile('FILE_UID_4')">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">車種</div>
									<div class="form_Normal">トヨタ</div>
									<div class="form_Normal">
										<div id="shakenInput2" style="display: none;">
											<input type="text" style="width: 250px;">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">ナンバー</div>
									<div class="form_Normal">横浜 300に 1234</div>
									<div class="form_Normal" style="display: flex; flex-direction: column;">
										<div id="shakenInput3" style="display: none;">
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
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">排気量</div>
									<div class="form_Normal">3000</div>
									<div class="form_Normal">
										<div id="shakenInput4" style="display: none;">
											<input type="text" style="width: 250px;">cc
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">車検有効期限</div>
									<div class="form_Normal">2014/12/24</div>
									<div class="form_Normal">
										<div id="shakenInput5" style="display: none;">
											<input type="text" style="width: 250px;">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon">
										</div>
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
										<a href="">表示</a>
									</div>
									<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
										<div id="hokenshoKenInput1" style="display: none;">
											<input type="text">
											<input type="button" value="参照">
											<input type="button" value="アップロード">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">保険証券コピー②</div>
									<div class="form_Normal">
										<a href="">表示</a>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput2" style="display: none;">
											<input type="text">
											<input type="button" value="参照">
											<input type="button" value="アップロード">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">保険満了日</div>
									<div class="form_Normal" style="display: flex; flex-direction: column; align-items: flex-start;">
										<div>2013/03/31</div>
										<div style="color: red;">※まもなく期限が切れます。</div>
									</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput3" style="display: none;">
											<input type="text" style="width: 250px;">
											<img src="/resources/img/cal_icon.gif" alt="cal_icon">
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">対人賠償</div>
									<div class="form_Normal">無制限</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput4" style="display: none;">
											<input type="text" style="width: 250px;">
											万円
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">対物賠償</div>
									<div class="form_Normal">無制限</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput5" style="display: none;">
											<input type="text" style="width: 250px;">
											万円
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">人身障害</div>
									<div class="form_Normal">無制限</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput6" style="display: none;">
											<input type="text" style="width: 250px;">
											万円
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">搭乗者障害</div>
									<div class="form_Normal">無制限</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput7" style="display: none;">
											<input type="text" style="width: 250px;">
											万円
										</div>
									</div>
								</div>
								<div class="form_Text1" id="form_Text1">
									<div class="form_Column">等級</div>
									<div class="form_Normal">3等級</div>
									<div class="form_Normal">
										<div id="hokenshoKenInput8" style="display: none;">
											<input type="text" style="width: 250px;">
											等級
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
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
								<div id = "hiddenFileUidField_ETC_1">
									<input type="text">
									<input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "commentField_ETC_1">
									<input type="text" style="width: 300px;">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "hiddenFileUidField_ETC_2">
									<input type="text">
									<input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "commentField_ETC_2">
									<input type="text" style="width: 300px;">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "hiddenFileUidField_ETC_3">
									<input type="text">
									<input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "commentField_ETC_3">
									<input type="text" style="width: 300px;">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "hiddenFileUidField_ETC_4">
									<input type="text">
									<input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "commentField_ETC_4">
									<input type="text" style="width: 300px;">
								</div>
							</div>
						</div>
					</div>
					<div class="content_Form1" style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<div id = "hiddenFileUidField_ETC_5">
									<input type="text">
									<input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Normal">
								<div id = "commentField_ETC_5">
									<input type="text" style="width: 300px;">
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
			</c:choose>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>