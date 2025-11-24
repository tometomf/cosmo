<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 住所 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<style>
p {
	line-height: 1.6;
	margin-bottom: 5px;
}

#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

input[type="text"], select, button {
	font-size: 13px;
	padding: 2px 4px;
}

button {
	padding: 2px 6px;
	cursor: pointer;
	margin-left: 4px;
}

.button_Left_Group img {
	cursor: pointer;
	transition: 0.2s;
}

.button_Left_Group img:hover {
	opacity: 0.85;
}

.addressRow {
	display: grid;
	grid-template-columns: 140px 1fr;
	border: 1px solid #ccc;
	width: 940px;
	margin: 0 auto;
	align-items: stretch;
	box-sizing: border-box;
}

.addressLabel {
	background-color: #f4f4f4;
	font-weight: bold;
	text-align: center;
	border-right: 1px solid #ccc;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.addressValue {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 6px 8px;
	box-sizing: border-box;
	width: 100%;
}

.addressValue div {
	flex: 1;
	word-break: break-all;
	padding-right: 10px;
}

.addressValue img {
	height: 32px;
	width: auto;
	object-fit: contain;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<div class="flow">
					<div class="flow_others">勤務地入力</div>
					<div class="flow_current">住所入力</div>
					<div class="flow_others">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 住所 入力</div>
			</div>

			<div class="kin">
				<p style="width: 1010px; margin: 0 auto 15px auto;">
					日割期間の住所を入力してください。<br> 社宅住所を住所へ反映する場合は、ボタンを押してください。<br>
					住所の変更がない場合は、そのまま「次へ」をクリックしてください。
				</p>

				<div class="addressRow" style="height: 48px; width: 1010px;">
					<div class="addressLabel">住所</div>
					<div class="addressValue">
						<div>${initData.fullAddress}</div>
						<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映">
					</div>
				</div>

				<div class="content_Form1" style="margin-top: 20px;">
					<div class="form_Title1" id="form_Title1">
						<div></div>
						<div>現住所</div>
						<div>日割期間 住所</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">郵便番号</div>
						<div class="form_Normal">
						<c:if test="${not empty initData.genZip}">
                                <c:set var="zip" value="${fn:trim(initData.genZip)}"/>
                                ${fn:substring(zip, 0, 3)}-${fn:substring(zip, 3, 7)}
                            </c:if>
                        </div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
                                <input type="text" name="zip1" maxlength="3"
                                    value="${fn:substring(initData.newZip, 0, 3)}"
                                    style="width: 40px; height: 20px;"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);">
                                <span>-</span>
                                <input type="text" name="zip2" maxlength="4"
                                    value="${fn:substring(initData.newZip, 3, 7)}"
                                    style="width: 60px; height: 20px;"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4);">
                                <button type="button" style="height: 24px;"
                                    onclick="AjaxZip3.zip2addr('zip1','zip2','prefecture','city');">検索</button>
                            </div>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">都道府県</div>
						<div class="form_Normal">${initData.genAddress1}</div>
						<div class="form_Normal">
							<input type="text" name="prefecture" value="${initData.newAddress1}"
								style="width: 120px; height: 20px;" readonly>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">住所1</div>
						<div class="form_Normal">${initData.genAddress2}</div>
						<div class="form_Normal">
							<input type="text" name="city" value="${initData.newAddress2}"
								style="width: 380px; height: 20px;" readonly>
						</div>
					</div>

					<div class="form_Text1" id="form_Text1">
						<div class="form_Column">住所2（建物名等）</div>
						<div class="form_Normal">${initData.genAddress3}</div>
						<div class="form_Normal">
							<input type="text" value="${initData.newAddress3}"
								style="width: 380px; height: 20px;">
						</div>
					</div>
				</div>

				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"
						style="cursor: pointer;" onclick="location.href='hiwariKinmuchi'"> <img
							src="/resources/img/next_btn01.gif" alt="次へ"
							 style="cursor: pointer;" onclick="validateRiyu()"> <img
							src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>


	    <!-- ▼ 임시저장용 폼 -->
    <form id="kinmuTempForm" method="post" action="<c:url value='/hiwariKinmuchi/tempSave'/>">
        <input type="hidden" name="commuteJson" value="">
        <input type="hidden" name="actionUrl" value="KINMU_TEMP_SAVE">
        <input type="hidden" name="redirectUrl" value="">
    </form>
	
	<script>
	
    function validateRiyu() {
        const zip1 = document.querySelector("input[name='zip1']").value.trim();
        const zip2 = document.querySelector("input[name='zip2']").value.trim();
        const pref = document.querySelector("input[name='prefecture']").value.trim();
        const city = document.querySelector("input[name='city']").value.trim();

        if (zip1 === "" || zip2 === "" || pref === "" || city === "") {
            alert("必須項目に入力漏れがあります。すべて入力してください。");
            return false;
        }

        window.location.href = "/hiwariKinmuchi/riyu";
    }
    
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

        const shinseiIcData = {
            kigyoCd: null,
            shinseiNo: null,

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

            keiro: null
        };

        return JSON.stringify(shinseiIcData);
    }

    /* ▲ JSON 생성 끝 */

    /* ▼ 임시저장 버튼 이벤트 ⭐⭐⭐ */
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
    
/* この住所を反映  */
function reflectAddress() {
    let zip = "${addressData.dbZip}";
    let addr1 = "${addressData.dbAddress1}";
    let addr2 = "${addressData.dbAddress2}";
    let pref = "";
    let rest = "";

    const markers = ["都","道","府","県"];

    for (let m of markers) {
        let idx = addr1.indexOf(m);
        if (idx !== -1) {
            pref = addr1.substring(0, idx + 1);
            rest = addr1.substring(idx + 1);
            break;
        }
    }

    document.getElementById("newZip").value = zip;
    document.getElementById("newAddress1").value = pref;
    document.getElementById("newAddress2").value = rest;
    document.getElementById("newAddress3").value = addr2;
}
</script>



</body>
</html>