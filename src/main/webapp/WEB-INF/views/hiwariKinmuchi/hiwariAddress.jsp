<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- 서혜원 -->


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
						<img src="/resources/img/tn/hanei_mini_btn02.gif" alt="この住所を反映"
							class="reflectBtn">
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
								<c:set var="zip" value="${fn:trim(initData.genZip)}" />
                                ${fn:substring(zip, 0, 3)}-${fn:substring(zip, 3, 7)}
                            </c:if>
						</div>
						<div class="form_Normal">
							<div style="display: flex; align-items: center; gap: 4px;">
								<input type="text" name="zip1" maxlength="3"
									value="${fn:substring(initData.newZip, 0, 3)}"
									style="width: 40px; height: 20px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);">
								<span>-</span> <input type="text" name="zip2" maxlength="4"
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
							<input type="text" name="prefecture"
								value="${initData.newAddress1}"
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
							<input type="text" name="building" value="${initData.newAddress3}"
								style="width: 380px; height: 20px;">
						</div>
					</div>
				</div>

				<div class="button_Left" style="margin-top: 25px;">
					<div class="button_Left_Group">
						<img src="/resources/img/back_btn01.gif" alt="戻る"
							style="cursor: pointer;" onclick="location.href='/hiwariKinmuchi/hiwariKinmuchi?hozonUid=${hozonUid}'">
						<img src="/resources/img/next_btn01.gif" alt="次へ"
							style="cursor: pointer;"> <img
							src="/resources/img/hozon_btn01.gif" alt="一時保存"
							style="cursor: pointer;">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 임시저장용 폼 -->
	    <form id="tsukinTempForm" method="post" action="<c:url value='/keiroinput/tempSave'/>">
	    <input type="hidden" name="commuteJson" value="">
	    
	    <!-- 이 화면에서의 action 이름(= DTO.actionNm) -->
	    <input type="hidden" name="actionUrl" value="/hiwariKinmuchi/hiwariAddress">
	    
	    <!-- 이동용 URL, hozonBtn은 비워서 보내고 keiroBtn은 채워서 보냄 -->
	    <input type="hidden" name="redirectUrl" value="">
	    
	     <input type="hidden" name="hozonUid" value="${hozonUid}">
	     
	     <input type="hidden" name="shinseiNo" value="${shinseiNo}">
	     
	     <input type="hidden" name="keiroSeq" value="${keiroSeq}">
		</form>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>




	<script>

    /* ▼ 주소 입력 검증 후 다음 페이지 이동 */
    function validateRiyu() {
        const zip1 = document.querySelector("input[name='zip1']").value.trim();
        const zip2 = document.querySelector("input[name='zip2']").value.trim();
        const pref = document.querySelector("input[name='prefecture']").value.trim();
        const city = document.querySelector("input[name='city']").value.trim();

        if (zip1 === "" || zip2 === "" || pref === "" || city === "") {
            alert("必須項目に入力漏れがあります。すべて入力してください。");
            return false;
        }

        return true; 
    }


   
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
    	      
    	      ichijiHozon.genAddress1 = "${initData.genAddress1}";
    	      ichijiHozon.genAddress2 = "${initData.genAddress2}";
    	      ichijiHozon.genAddress3 = "${initData.genAddress3}";
    	      ichijiHozon.newAddress1 = "${initData.newAddress1}";
    	      ichijiHozon.newAddress2 = "${initData.newAddress2}";
    	      ichijiHozon.newAddress3 = "${initData.newAddress3}";
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
    	  
    	  if (tsugiBtn) {
    	  	  tsugiBtn.addEventListener('click', function () {
    	            const jsonString = buildCommuteJson();
    	            if (!jsonString) return;
    	            
    	            if (!validateRiyu()) {
    	                e.preventDefault();   
    	                return false;
    	            }

    	            commuteJsonInput.value = jsonString;
    	            
    	            console.log( commuteJsonInput.value);

    	            redirectUrlInput.value = "/hiwariKinmuchi/riyu?hozonUid=" + hozonUid;

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