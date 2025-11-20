<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 勤務地 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

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

					<div class="form_Title1" id="form_Ttile1">
						<div></div>
						<div>現勤務地</div>
						<div>日割期間 勤務地</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">勤務先コード</div>
						<div class="form_Normal">${leftData.beforeShozokuCd}</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" name="newShozokuCd" maxlength="3"
									style="width: 120px; height: 20px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);">
							</div>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">勤務先</div>
						<div class="form_Normal">${leftData.beforeShozokuNm}</div>
						<div class="form_Normal">
							<select style="width: 120px;" name="newShozokuNm">
								<c:forEach var="nm" items="${shoList}">
									<option>${nm}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">郵便番号</div>
						<div class="form_Normal">
							<c:if test="${not empty leftData.kinmuZipCd}">
							    <c:set var="zip" value="${fn:trim(leftData.kinmuZipCd)}"/>
							    ${fn:substring(zip, 0, 3)}-${fn:substring(zip, 3, 7)}
							</c:if>
						</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" name="zip1" maxlength="3"
									style="width: 40px; height: 20px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);">
								<span>-</span> <input type="text" name="zip2" maxlength="4"
									style="width: 60px; height: 20px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4);">
								<button type="button" style="height: 24px;"
									onclick="AjaxZip3.zip2addr('zip1','zip2','prefecture','city');">検索</button>
							</div>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">都道府県</div>
						<div class="form_Normal">${leftData.kinmuAddress1}</div>
						<div>
							<input type="text" name="prefecture"
								style="width: 100px; height: 20px;" readonly>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">所在地1</div>
						<div class="form_Normal">${leftData.kinmuAddress2}</div>
						<div>
							<input type="text" name="city"
								style="width: 380px; height: 20px;" readonly>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">所在地2（建物名等）</div>
						<div class="form_Normal">${leftData.kinmuAddress3}</div>
						<div>
							<input type="text" name="address2"
								style="width: 380px; height: 20px;">
						</div>
					</div>

				</div>

				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"
							style="cursor: pointer;" onclick="location.href='/'">

						<img src="/resources/img/next_btn01.gif" alt="次へ"
							style="cursor: pointer;"
							onclick="validateAddress()">

						<img src="/resources/img/hozon_btn01.gif" alt="一時保存"
							style="cursor: pointer;">
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	<!-- ▼ 임시저장용 폼 추가 -->
	<form id="kinmuTempForm" method="post" action="<c:url value='/hiwariKinmuchi/tempSave'/>">
	    <input type="hidden" name="commuteJson" value="">
	    <input type="hidden" name="actionUrl" value="KINMU_TEMP_SAVE">
	    <input type="hidden" name="redirectUrl" value="">
	</form>
	<!-- ▲ 임시저장용 폼 끝 -->

<script>

	function validateAddress() {
	    const code = document.querySelector("input[name='newShozokuCd']").value.trim();
	    const zip1 = document.querySelector("input[name='zip1']").value.trim();
	    const zip2 = document.querySelector("input[name='zip2']").value.trim();
	    const pref = document.querySelector("input[name='prefecture']").value.trim();
	    const city = document.querySelector("input[name='city']").value.trim();

	    if (code === "" || zip1 === "" || zip2 === "" || pref === "" || city === "") {
	        alert("必須項目に入力漏れがあります。すべて入力してください。");
	        return false;
	    }

	    window.location.href = "/hiwariKinmuchi/address";
	}

	/* ▼ 임시저장 JSON 만들기 */

	function buildKinmuTempJson() {

	    const newShozokuCd = document.querySelector("input[name='newShozokuCd']").value.trim();
	    const newShozokuNm = document.querySelector("select[name='newShozokuNm']").value.trim();
	    const zip1 = document.querySelector("input[name='zip1']").value.trim();
	    const zip2 = document.querySelector("input[name='zip2']").value.trim();
	    const prefecture = document.querySelector("input[name='prefecture']").value.trim();
	    const city = document.querySelector("input[name='city']").value.trim();
	    const address2 = document.querySelector("input[name='address2']").value.trim();

	    let fullZip = "";
	    if (zip1 !== "" && zip2 !== "") fullZip = zip1 + zip2;

	    // ⭐⭐⭐ ShinseiIcDataVO 에 맞춘 구조
	    const shinseiIcData = {

	        kigyoCd: null,
	        shinseiNo: null,
	        shinseiYmd: null,
	        shinseiKbn: null,
	        shinchokuKbn: null,

	        // 기존(현)값은 화면에서 받을 수 없으니 null 또는 leftData에서 가져오면 추가 가능
	        genAddress: null,
	        newAddress: prefecture && city ? (prefecture + " " + city + " " + address2) : null,

	        genShozoku: null,
	        newShozoku: newShozokuNm || null,

	        genKinmuchi: null,
	        newKinmuchi: newShozokuCd || null,

	        riyu: null,
	        idoYmd: null,
	        itenYmd: null,
	        tennyuYmd: null,
	        riyoStartYmd: null,
	        ssmdsYmd: null,
	        moComment: null,

	        codeNm: null,
	        shinseiName: null,

	        // ⭐⭐⭐ 근무지 화면에서는 keiro 없음
	        keiro: null
	    };

	    return JSON.stringify(shinseiIcData);
	}
	/* ▲ JSON 생성 끝 */

	/* ▼ 임시저장 버튼 이벤트 ⭐⭐⭐ 수정 없음, 유지 */
	document.addEventListener("DOMContentLoaded", function () {

	    const hozonBtn = document.querySelector('img[alt="一時保存"]');

	    const form = document.getElementById("kinmuTempForm");
	    const commuteJsonInput = form.querySelector('input[name="commuteJson"]');
	    const redirectUrlInput = form.querySelector('input[name="redirectUrl"]');

	    if (hozonBtn) {
	        hozonBtn.addEventListener("click", function () {

	            const jsonString = buildKinmuTempJson();
	            commuteJsonInput.value = jsonString;

	            redirectUrlInput.value = "";

	            form.submit();
	        });
	    }
	});
	/* ▲ 임시저장 끝 */

</script>

</body>
</html>