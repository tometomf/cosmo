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

.form_Text2>div {
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
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<form id="uploadForm" action="/idoconfirm/uploadHuzuiFile"
				method="post" enctype="multipart/form-data">
				<div class="main_title">
					<!-- 진척도 예제 -->
					<div class="flow">
						<div class="flow_current">勤務地入力</div>
						<div class="flow_others">住所入力</div>
						<div class="flow_others">経路入力</div>
						<div class="flow_others">付随書類入力</div>
						<div class="flow_others">確認</div>
						<div class="flow_others">完了</div>
					</div>
					<div class="subtitle">申請内容選択</div>
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
								<div class="form_Normal" data-file-type="license1">
									<input type="text" class="file-path-input" readonly> <input
										type="file" name="uploadFile" class="hiddle-file-input"
										accept="application/pdf" style="display: none;"> <input
										type="button" value="参照" class="btn-browse"> <input
										type="button" value="アップロード" class="btn-upload"
										data-target="license1"> <span class="upload-status"
										id="status-license1"></span>
								</div>
							</div>
							<div class="form_Text1" id="form_Text1">
								<div class="form_Column">免許証有効期限</div>
								<div class="form_Normal">2015/10/21</div>
								<div class="form_Normal">
									<input type="text"> <img
										src="/resources/img/cal_icon.gif" alt="cal_icon">
								</div>
							</div>
							<div class="form_Text1" id="form_Text1">
								<div class="form_Column">免許証コピー</div>
								<div class="form_Normal">
									<a href="">表示</a>
								</div>
								<div class="form_Normal">
									<input type="text"> <input type="button" value="参照">
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
								<div class="form_Normal">
									<a href="">表示</a>
								</div>
								<div class="form_Normal">
									<input type="text"> <input type="button" value="参照">
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
										<input type="text" style="width: 40px;"> <input
											type="text" style="width: 40px;"> <input type="text"
											style="width: 40px;"> <input type="text"
											style="width: 40px;">
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
									<input type="text" style="width: 250px;"> <img
										src="/resources/img/cal_icon.gif" alt="cal_icon">
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
							<div
								style="border-left: solid 1px #EDEDED; border-right: solid 1px #EDEDED; padding-top: 10px; padding-bottom: 10px;">
								※保険証券コピーは、満了日の記載部分が両方確認できるようにアップロードしてください。</div>
							<div class="form_Text1" id="form_Text1">
								<div class="form_Column" style="border-top: 1px solid #a0a0a0;">保険証券コピー①</div>
								<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
									<a href="">表示</a>
								</div>
								<div class="form_Normal" style="border-top: 1px solid #a0a0a0;">
									<input type="text"> <input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Text1" id="form_Text1">
								<div class="form_Column">保険証券コピー②</div>
								<div class="form_Normal">
									<a href="">表示</a>
								</div>
								<div class="form_Normal">
									<input type="text"> <input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Text1" id="form_Text1">
								<div class="form_Column">保険満了日</div>
								<div class="form_Normal"
									style="display: flex; flex-direction: column; align-items: flex-start;">
									<div>2013/03/31</div>
									<div style="color: red;">※まもなく期限が切れます。</div>
								</div>
								<div class="form_Normal">
									<input type="text" style="width: 250px;"> <img
										src="/resources/img/cal_icon.gif" alt="cal_icon">
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
									<input type="text"> <input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回購入 定期期間</div>
								<div class="form_Normal">1ヶ月</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回購入 定期期間</div>
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
									<input type="text"> <input type="button" value="参照">
									<input type="button" value="アップロード">
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回購入 定期期間</div>
								<div class="form_Normal">
									<select>
										<option value="">-------------</option>
										<option value="">test</option>
									</select>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回購入 定期期間</div>
								<div>6ヶ月</div>
							</div>
						</div>
					</div>
				</div>
				<div style="flex-direction: column; gap: 5px;">
					<div style="width: 1040px; margin: auto; color: mediumblue;">
						※急な異動の場合なので今までの通勤路での定期券を既に購入済の場合、ここにアップロードしてください。</div>
					<div style="width: 1040px; margin-left: 70%;">コメント入力欄</div>
					<div class="content_Form1"
						style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<input type="text"> <input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
							<div class="form_Normal">
								<input type="text" style="width: 300px;">
							</div>
						</div>
					</div>
					<div class="content_Form1"
						style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<input type="text"> <input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
							<div class="form_Normal">
								<input type="text" style="width: 300px;">
							</div>
						</div>
					</div>
					<div class="content_Form1"
						style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<input type="text"> <input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
							<div class="form_Normal">
								<input type="text" style="width: 300px;">
							</div>
						</div>
					</div>
					<div class="content_Form1"
						style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<input type="text"> <input type="button" value="参照">
								<input type="button" value="アップロード">
							</div>
							<div class="form_Normal">
								<input type="text" style="width: 300px;">
							</div>
						</div>
					</div>
					<div class="content_Form1"
						style="width: 1040px; margin-bottom: 10px;">
						<div class="form_Text1" id="form_Text1">
							<div class="form_Column">その他</div>
							<div class="form_Normal">
								<input type="text"> <input type="button" value="参照">
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
						<img src="/resources/img/back_btn01.gif" alt="back_btn01"> <img
							src="/resources/img/next_btn01.gif" alt="next_btn01"> <img
							src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
					</div>
				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>

<script>
$(document).ready(function() {
    // 1. '참조' 버튼 클릭 이벤트 핸들러
$('.btn-browse').on('click', function() {
// 해당 그룹 내의 숨겨진 file input을 찾아서 클릭 이벤트를 발생시킵니다.
$(this).siblings('.hidden-file-input').trigger('click');
});

// 2. 파일 선택 변경 이벤트 핸들러
$('.hidden-file-input').on('change', function() {
// 선택된 파일의 이름을 가져옵니다.
const fileName = $(this).val().split('\\').pop();

// 해당 그룹 내의 파일 경로 입력란(.file-path-input)에 파일 이름을 표시합니다.
$(this).siblings('.file-path-input').val(fileName);

// **추가: PDF 파일만 허용하는 유효성 검사 (클라이언트 측)**
if (!fileName.toLowerCase().endsWith('.pdf')) {
			alert('PDFファイルのみアップロード可能です。');
			$(this).val(''); // 파일 선택 취소
			$(this).siblings('.file-path-input').val('');
		}
	});

	// 3. 'アップロード' 버튼 클릭 이벤트 핸들러 (Ajax 업로드 시)
$('.btn-upload').on('click', function() {
	const fileGroup = $(this).closest('.file-upload-group');
	const fileInput = fileGroup.find('.hidden-file-input')[0];
	const statusArea = fileGroup.find('.upload-status');

	if (fileInput.files.length === 0) {
		alert("ファイルを先に選択してください。");
		return;
	}

	// FormData 객체 생성: 비동기 파일 업로드를 위해 사용
	const formData = new FormData();
	// 💡 파일을 "uploadFile" 이라는 이름으로 폼 데이터에 추가
	formData.append("uploadFile", fileInput.files[0]);
	// 파일의 종류(면허증, 차계부 등)를 식별하기 위한 데이터 추가
	formData.append("fileType", $(this).data('target')); 
	
	statusArea.text("アップロード中..."); // 상태 표시

	$.ajax({
		url: '/idoconfirm/tempUploadFile', // 💡 임시 저장 처리 전용 URL
		type: 'POST',
		data: formData,
		contentType: false, // multipart/form-data 처리를 위해 필수
		processData: false, // multipart/form-data 처리를 위해 필수
		success: function(response) {
			// 서버에서 임시 파일 ID, 임시 경로 등을 응답으로 받아야 함
			if(response.success) {
				statusArea.text("一時保存完了 (" + response.savedName + ")");
				// 💡 서버에서 받은 임시 파일 정보를 숨김 필드에 저장
				fileGroup.append('<input type="hidden" name="tempFileId_license1" value="' + response.tempId + '">');
			} else {
				statusArea.text("一時保存失敗: " + response.message);
			}
		},
		error: function() {
			statusArea.text("通信エラー");
		}
	});
});
</script>