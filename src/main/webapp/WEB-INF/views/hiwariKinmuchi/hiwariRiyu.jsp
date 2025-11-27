<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!-- 서혜원 -->




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日割 申請理由 入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<style>
p {
	line-height: 1.6;
	margin-bottom: 5px;
}

.content_Form1 {
	width: 940px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-collapse: collapse;
	font-size: 13px;
}

.form_Text1 {
	display: grid;
	grid-template-columns: 22% 1fr;
	border-top: 1px solid #ccc;
}

.form_Column {
	background-color: #f4f4f4;
	font-weight: bold;
	padding: 8px 10px;
	border-right: 1px solid #ccc;
	display: flex;
	align-items: center;
}

.form_Normal {
	padding: 8px 10px;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 6px;
}

textarea {
	width: 100%;
	height: 40px;
	font-size: 13px;
	resize: none;
	padding: 6px;
	border: 1px solid #ccc;
	overflow-y: scroll;
}

input[type="text"] {
	padding: 4px 6px;
	font-size: 13px;
	border: 1px solid #ccc;
}

.calendar-icon {
	cursor: pointer;
	height: 20px;
	vertical-align: middle;
}

button {
	padding: 2px 6px;
	font-size: 12px;
	cursor: pointer;
	margin-left: 4px;
}

.note {
	color: #666;
	margin-left: 8px;
	font-size: 12px;
}

.button_Left_Group img {
	cursor: pointer;
	transition: 0.2s;
}

.button_Left_Group img:hover {
	opacity: 0.85;
}

.periodBox {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.periodInputs {
	display: flex;
	align-items: center;
	gap: 6px;
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
					<div class="flow_others">住所入力</div>
					<div class="flow_current">申請理由入力</div>
					<div class="flow_others">経路入力</div>
					<div class="flow_others">確認</div>
					<div class="flow_others">完了</div>
				</div>
				<div class="subtitle">日割 申請理由 入力</div>
			</div>

			<div class="kin">

				<div class="content_Form1">

					<div class="form_Text1">
						<div class="form_Column">日割申請理由</div>
						<div class="form_Normal">
							<textarea name="reason" maxlength="1000">${initData.shinseiriyu}</textarea>
						</div>
					</div>

					<c:set var="start" value="${initData.shinseigigan1}" />
					<c:set var="end" value="${initData.shinseigigan2}" />

					<c:set var="start" value="${initData.shinseigigan1}" />
<c:set var="end" value="${initData.shinseigigan2}" />

<c:set var="start" value="${initData.shinseigigan1}" />
<c:set var="end" value="${initData.shinseigigan2}" />

<div class="form_Text1">
    <div class="form_Column">申請期間</div>
    <div class="form_Normal">

        <!-- 시작일 -->
        <c:set var="startFmt" value="" />
        <c:if test="${not empty start}">
            <c:set var="startFmt"
                value="${fn:substring(start,0,4)}/${fn:substring(start,4,6)}/${fn:substring(start,6,8)}" />
        </c:if>

        <input type="text" id="startDate" name="periodFrom"
               value="${startFmt}" style="width:140px;">
        <img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon">

        <span>〜</span>

        <!-- 종료일 -->
        <c:set var="endFmt" value="" />
        <c:if test="${not empty end}">
            <c:set var="endFmt"
                value="${fn:substring(end,0,4)}/${fn:substring(end,4,6)}/${fn:substring(end,6,8)}" />
        </c:if>

        <input type="text" id="endDate" name="periodTo"
               value="${endFmt}" style="width:140px;">
        <img src="/resources/img/cal_icon.gif" alt="달력" class="calendar-icon">

        <span id="periodDays" style="margin-left: 10px;"></span>
    </div>
</div>

					<div class="form_Text1">
						<div class="form_Column">出勤日数</div>
						<div class="form_Normal">
							<input type="text" name="workDays"
								value="${initData.shukkinnissu}" style="width: 40px;">
							日間 <span class="note">※実働日数を入力してください。</span>
						</div>
					</div>

				</div>

				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"
							style="cursor: pointer;" onclick="location.href='address'">
						<img src="/resources/img/next_btn01.gif" alt="次へ"
							onclick="validateReason()"> <img
							src="/resources/img/hozon_btn01.gif" alt="一時保存">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 임시저장용 폼 -->
	    <form id="tsukinTempForm" method="post" action="<c:url value='/keiroinput/tempSave'/>">
	    <input type="hidden" name="commuteJson" value="">
	    
	    <!-- 이 화면에서의 action 이름(= DTO.actionNm) -->
	    <input type="hidden" name="actionUrl" value="/hiwariKinmuchi/riyu">
	    
	    <!-- 이동용 URL, hozonBtn은 비워서 보내고 keiroBtn은 채워서 보냄 -->
	    <input type="hidden" name="redirectUrl" value="">
	    
	     <input type="hidden" name="hozonUid" value="${hozonUid}">
	     
	     <input type="hidden" name="shinseiNo" value="${shinseiNo}">
	     
	     <input type="hidden" name="keiroSeq" value="${keiroSeq}">
		</form>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

	

	<script>
	$(function () {

	    $("#startDate, #endDate").each(function () {
	        const val = $(this).val();   // JSP 데이터 값 (예: 2025/04/01)

	        $(this).datepicker({
	            dateFormat : 'yy/mm/dd',
	            showButtonPanel : true,
	            changeMonth : true,
	            changeYear : true,
	            defaultDate: val ? val : null   // ★ 서버 날짜 기준으로 달력 열기
	        });
	    });

	    // 달력 아이콘 클릭 핸들러
	    $(".calendar-icon").each(function (index) {
	        $(this).on("click", function () {
	            $("#" + (index === 0 ? "startDate" : "endDate")).datepicker("show");
	        });
	    });
	});

		function validateReason() {
			const reason = document.querySelector("textarea[name='reason']").value
					.trim();
			const from = document.querySelector("input[name='periodFrom']").value
					.trim();
			const to = document.querySelector("input[name='periodTo']").value
					.trim();
			const work = document.querySelector("input[name='workDays']").value
					.trim();

			// 必須入力チェック
			if (reason === "" || from === "" || to === "" || work === "") {
				alert("必須項目に入力漏れがあります。すべて入力してください。");
				return false;
			}

			// ----------------------------
			// ① 日付大小チェック(From > To → エラー)
			// ----------------------------
			const fromDate = new Date(from);
			const toDate = new Date(to);

			if (fromDate > toDate) {
				alert("申請期間の開始日が終了日より後になっています。");
				return false;
			}

			// ----------------------------
			// ② 申請期間 日数 < 出勤日数 チェック
			// ----------------------------
			const diff = toDate - fromDate;
			const periodDays = diff / (1000 * 60 * 60 * 24) + 1;
			const workDays = parseInt(work);

			if (periodDays < workDays) {
				alert("申請期間日数が出勤日数より少なくなっています。");
				return false;
			}

			window.location.href = "/hiwariKinmuchi/kakunin";
		}

		function updatePeriodDays() {
			const from = document.querySelector("input[name='periodFrom']").value
					.trim();
			const to = document.querySelector("input[name='periodTo']").value
					.trim();

			const display = document.getElementById("periodDays");

			// 入力値がなければ初期化
			if (from === "" || to === "") {
				display.textContent = "";
				return;
			}

			const fromDate = new Date(from);
			const toDate = new Date(to);

			// 日付パーシング失敗時
			if (isNaN(fromDate) || isNaN(toDate)) {
				display.textContent = "";
				return;
			}

			const diff = toDate - fromDate;
			const days = diff / (1000 * 60 * 60 * 24) + 1;

			// 負の数または0の場合 → 表示しない
			if (days <= 0) {
				display.textContent = "";
				return;
			}

			display.textContent = days + "日間";
		}

		$(document).on("change", "#startDate, #endDate", updatePeriodDays);

		$(function() {
			updatePeriodDays();
		});

		
		document.addEventListener("DOMContentLoaded", function() {
	    	


	    	  const hozonBtn = document.querySelector('img[src="/resources/img/hozon_btn01.gif"]');
	    	  const tsugiBtn = document.querySelector('img[src="/resources/img/next_btn01.gif"]');
	    	  
	    	  let ichijiHozonRaw = '${ichijiHozon}';
	    	  
	    	  console.log(ichijiHozonRaw);
	    	  let ichijiHozon =
	    	      ichijiHozonRaw && ichijiHozonRaw.trim() !== "" && ichijiHozonRaw !== "null"
	    	          ? JSON.parse(ichijiHozonRaw)
	    	          : "";
	    		console.log("임시저장 데이터:", ichijiHozon);
	    	  
	    		const hozonUid = '${hozonUid}';
	    		const shinseiNo = '${shinseiNo}';
	    		console.log(hozonUid);
	    	  // 폼 / hidden input
	    	  const form             = document.getElementById("tsukinTempForm");
	    	  const commuteJsonInput = form.querySelector('input[name="commuteJson"]');
	    	  const redirectUrlInput = form.querySelector('input[name="redirectUrl"]');

	    	  /**
	    	   * 현재 선택된 라디오값을 기반으로
	    	   * 서버에 보낼 통근정보 JSON 문자열을 생성
	    	   */
	    	  function buildCommuteJson() {

	    	      
	    	      if(ichijiHozon == null || ichijiHozon == ""){
	    	      	console.log("ichijiHozon null")
	    	      	ichijiHozon = {
	    	      			  "kigyoCd": null,
	    	      			  "shinseiNo": null,
	    	      			  "shinseiYmd": null,
	    	      			  "shinseiKbn": null,
	    	      			  "shainUid": null,
	    	      			  "shinchokuKbn": null,

	    	      			  "genAddress1": null,
	    	      			  "genAddress2": null,
	    	      			  "genAddress3": null,

	    	      			  "newAddress1": null,
	    	      			  "newAddress2": null,
	    	      			  "newAddress3": null,

	    	      			  "genShozoku": null,
	    	      			  "newShozoku": null,

	    	      			  "genKinmuchi1": null,
	    	      			  "genKinmuchi2": null,
	    	      			  "genKinmuchi3": null,

	    	      			  "newKinmuchi1": null,
	    	      			  "newKinmuchi2": null,
	    	      			  "newKinmuchi3": null,

	    	      			  "riyu": null,
	    	      			  "idoYmd": null,
	    	      			  "itenYmd": null,
	    	      			  "tennyuYmd": null,
	    	      			  "riyoStartYmd": null,
	    	      			  "ssmdsYmd": null,
	    	      			  "moComment": null,

	    	      			  "codeNm": null,
	    	      			  "shinseiName": null,

	    	      			  "keiro": {
	    	      			    "kigyoCd": null,
	    	      			    "shinseiNo": null,
	    	      			    "keiroSeq": null,
	    	      			    "tsukinShudan": null,
	    	      			    "katamichi": null,
	    	      			    "jitsu": null,
	    	      			    "tsuki": null,
	    	      			    "shinseiKm": null,

	    	      			    "startPlace": null,
	    	      			    "endPlace": null,

	    	      			    "shudanName": null
	    	      			  },

	    	      			  "startKeiro": {
	    	      			    "kigyoCd": null,
	    	      			    "shinseiNo": null,
	    	      			    "keiroSeq": null,

	    	      			    "shinseiKbn": null,
	    	      			    "shinseiYmd": null,
	    	      			    "shainUid": null,
	    	      			    "shainNo": null,
	    	      			    "dairiShinseishaCd": null,

	    	      			    "tsukinShudanKbn": null,
	    	      			    "yuryoTokurei": null,
	    	      			    "kyoriKagenTokurei": null,
	    	      			    "jougenKingakuTokurei": null,
	    	      			    "jougenCut": null,
	    	      			    "fubiUmuKbn": null,

	    	      			    "kikanStartYmd": null,
	    	      			    "kikanEndYmd": null,
	    	      			    "jitsuKinmuNissu": null,

	    	      			    "busCorpNm": null,
	    	      			    "idoShudanKbn": null,
	    	      			    "idoShudanEtcNm": null,

	    	      			    "startPlace": null,
	    	      			    "endPlace": null,
	    	      			    "viaPlace1": null,
	    	      			    "viaPlace2": null,
	    	      			    "viaPlace3": null,
	    	      			    "viaPlace4": null,
	    	      			    "viaPlace5": null,

	    	      			    "startIdoKeido": null,
	    	      			    "startEkicd": null,
	    	      			    "endEkicd": null,
	    	      			    "viaPlaceEkicd1": null,
	    	      			    "viaPlaceEkicd2": null,
	    	      			    "viaPlaceEkicd3": null,
	    	      			    "viaPlaceEkicd4": null,
	    	      			    "viaPlaceEkicd5": null,

	    	      			    "kekkaUrl": null,

	    	      			    "shinseiKin": null,
	    	      			    "firstTeikiTsukiSu": null,
	    	      			    "firstShikyuYmd": null,
	    	      			    "firstShikyuKin": null,
	    	      			    "nextTeikiTsukiSu": null,
	    	      			    "regularShikyuKin": null,
	    	      			    "tsukiShikyuKin": null,
	    	      			    "katamichiKin": null,

	    	      			    "shinkansenRiyoKbn": null,
	    	      			    "tokkyuRiyoKbn": null,
	    	      			    "yuryoRiyoKbn": null,
	    	      			    "kekkaSelect": null,

	    	      			    "sanshoTeikiTsukiSu1": null,
	    	      			    "sanshoTeikiKin1": null,
	    	      			    "sanshoTeikiTsukiSu2": null,
	    	      			    "sanshoTeikiKin2": null,
	    	      			    "sanshoTeikiTsukiSu3": null,
	    	      			    "sanshoTeikiKin3": null,

	    	      			    "shinseiKm": null,

	    	      			    "yuryoIcS": null,
	    	      			    "yuryoIcE": null,
	    	      			    "yuryoOfukuKbn": null,
	    	      			    "yuryoKatamichiKin": null,

	    	      			    "betsuRouteRiyu": null,
	    	      			    "yuryoRiyoRiyu": null,
	    	      			    "viaPlaceRiyu": null,

	    	      			    "nenpi": null,
	    	      			    "gasorinDaiMae": null,
	    	      			    "yuryoDaiMae": null,
	    	      			    "goukeiMae": null,
	    	      			    "hiwariMae": null,
	    	      			    "gasorinDaiAto": null,
	    	      			    "yuryoDaiAto": null,
	    	      			    "goukeiAto": null,
	    	      			    "hiwariAto": null,

	    	      			    "addUserId": null,
	    	      			    "addDate": null,
	    	      			    "updUserId": null,
	    	      			    "updDate": null
	    	      			  }
	    	      			}
	    	      }
	    	      
	    	     
	    	      return JSON.stringify(ichijiHozon);
	    	  }

	    	  //  hozonBtn: 임시저장 → 컨트롤러가 기본 redirect(/shinsei/ichiji) 사용
	    	  if (hozonBtn) {
	    	      hozonBtn.addEventListener('click', function () {
	    	          const jsonString = buildCommuteJson();
	    	          if (!jsonString) return;

	    	          commuteJsonInput.value = jsonString;
	    	          
	    	          console.log( commuteJsonInput.value);

	    	          redirectUrlInput.value = "";

	    	          form.submit();
	    	      });
	    	  }
	    	});

	   
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        const reflectBtn = document.querySelector('img[alt="この住所を反映"]');

	        if (!reflectBtn) {
	            console.log("反映ボタンが見つからない");
	            return;
	        }

	        reflectBtn.addEventListener("click", function () {

	            const dbZip   = "${initData.dbZip}";
	            const dbAddr1 = "${initData.dbAddress1}";
	            const dbAddr2 = "${initData.dbAddress2}";

	            if (!dbAddr1 || dbAddr1 === "null") {
	                alert("反映する住所（中間DB）が存在しません。");
	                return;
	            }

	            // 도도부현 분리
	            const keywords = ["都", "道", "府", "県"];
	            let pref = "";
	            let addr1 = "";

	            let cutIndex = -1;
	            for (let k of keywords) {
	                const idx = dbAddr1.indexOf(k);
	                if (idx !== -1) {
	                    cutIndex = idx;
	                    break;
	                }
	            }

	            if (cutIndex !== -1) {
	                pref = dbAddr1.substring(0, cutIndex + 1);
	                addr1 = dbAddr1.substring(cutIndex + 1);
	            } else {
	                addr1 = dbAddr1;
	            }

	            // UI 반영
	            if (dbZip && dbZip !== "null") {
	                document.querySelector("input[name='zip1']").value = dbZip.substring(0, 3);
	                document.querySelector("input[name='zip2']").value = dbZip.substring(3);
	            }

	            document.querySelector("input[name='prefecture']").value = pref;
	            document.querySelector("input[name='city']").value = addr1;

	            const buildingInput = document.querySelector("input[name='building']");
	            if (buildingInput) {
	                buildingInput.value = dbAddr2 || "";
	            }

	            console.log("住所反映 完了");
	        });
	    });

		
	</script>
</body>
</html>