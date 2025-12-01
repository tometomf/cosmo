<!-- 作成者 : 권예성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特例申請</title>
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
	/* 	무시  */
	.btn_List {
    	display: flex;
    	align-items: center;
    	gap: 8px;
	    width: 750px;
	    margin: auto;
	}

	#form_Ttile1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
	}
	
	
	.wrapper {
  width: 700px;           /* 전체 폭 통일 */
  margin: 0 auto;         /* 화면 가운데 */
}

/* 노란 박스 */
.warning_box {
  background: yellow;
  text-align: center;
  padding: 10px 0;
   margin-top: 15px;
  margin-bottom: 15px;     /* 밑에 간격 */
}

.warning_label {
  color: red;
  font-weight: bold;
}

/* 안내문 */
.notice_box {
  width: 700px;
  margin: 0 auto;
  text-align: left;
  font-size: 14px;
  line-height: 1.8;
}

.notice_box p {
  margin: 0 0 10px 0;      /* 문단 간 일정한 간격 */
  padding-left: 1em;       /* 들여쓰기 통일 */
  text-indent: 0;          /* text-indent 제거 */
}

.highlight_red {
  color: red;
  font-weight: bold;
}

.notice_box p {
  white-space: nowrap;  /* 자동 줄바꿈 금지 */
}

.confirm_box {
  text-align: center;
  margin-top: 60px;
  margin-bottom: 20px;
  font-size: 14px;
}

.underline_text {
  text-decoration: underline;  /* 밑줄 */
}

.reason_wrapper {
  display: grid;
  grid-template-columns: 180px 1fr;
  width: 700px;
  margin: 60px auto 25px;  /* 위 50px, 좌우 auto, 아래 25px */
  border: 1px solid #a0a0a0;
}

.reason_label {
  background-color: #dddddd;
  border-right: 1px solid #a0a0a0;
  padding: 10px;
  font-size: 13px;
  display: flex;
  align-items: center;
  
}

.reason_field {
  padding: 5px;
  background: white;
}

.reason_textarea {
  width: 100%;
  height: 80px;
  border: 2px solid #777; /* 약간 더 진한 안쪽 테두리 */
  resize: none;           /* 크기 조절 불가 */
  overflow-y: scroll;     /* 항상 스크롤바 표시 */
  box-shadow: none;
  outline: none;
  font-size: 13px;
  padding: 6px;
  box-sizing: border-box;
}





	
</style>



<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
			
<form id="tokureiForm" method="post" action="/idoconfirm/tokureiSubmit">

		
			
<div class="wrapper">
  <!-- 노란 경고 박스 -->
  <div class="warning_box">
    <span class="warning_label">【警告】</span>
    この申請は特例申請です
    <span class="warning_label">【警告】</span>
  </div>

  <!-- 안내문 박스 -->
<!-- ==== 특례 타입별 문구 자동 변경 ==== -->
<c:set var="tokureiType" value="${tokureiType}" />

<c:choose>

    <c:when test="${tokureiType == 'A'}">
        <div class="notice_box">
            <p>上限金額を超過しているため、特例申請となります。</p>
            <p>
                特例申請を行う場合、特例申請理由を入力する欄が表示されます。<br>
                <span class="highlight_red">
                    特例申請理由は入力必須であり、入力せずに申請することはできません。
                </span>
            </p>
            <p>
                特例申請は、申請理由をレオパレス・リーシングおよび(企業名)ご担当者様で確認の上、承認させていただきます。
            </p>
        </div>
    </c:when>

    <c:when test="${tokureiType == 'B'}">
        <div class="notice_box">
            <p>下限距離を下回っているため、特例申請となります。</p>
            <p>
                特例申請を行う場合、特例申請理由を入力する欄が表示されます。<br>
                <span class="highlight_red">
                    特例申請理由は必ず入力してください。
                </span>
            </p>
            <p>
                入力された理由はレオパレス・リーシングおよび(企業名)ご担当者様が確認し、承認可否を判断します。
            </p>
        </div>
    </c:when>

</c:choose>




    
  </div>
  
</div>

<!-- 특례 체크 -->
<div class="confirm_box">
  <label>
    <input type="radio" name="agree" value="1" id="agreeRadio">
    <span class="underline_text">特例について内容を理解した上で申請します。</span>
  </label>
</div>

<!-- 이유 입력 (처음엔 숨김) -->
<div class="reason_wrapper" id="reasonBox" style="display:none;">
  <div class="reason_label">特例申請理由</div>
  <div class="reason_field">
    <textarea class="reason_textarea"  name="tokuShinseiRiyu" id="reason"></textarea>
  </div>
</div>

<div class = "button_Center">
				<div class = "button_Center_Group">

					<div>
						<img src="/resources/img/back_btn01.gif" alt="back_btn01"
								 style="cursor:pointer;" 
								 onclick="location.href='/idoconfirm/kakuninpage';">
					</div>
					<div>
						<img src="/resources/img/shinsei_btn01.gif" alt="shinsei_btn01"
						   		 id="submitBtn"
           						 style="display:none;">
           			</div>

				</div>
</div>
</form>

			</div>
			
			<div></div>
			<div></div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	
<script>
window.onload = function() {

    // 1. 화면 요소 가져오기
    const radio = document.getElementById("agreeRadio");
    const reasonBox = document.getElementById("reasonBox");
    const submitBtn = document.getElementById("submitBtn");
    const form = document.getElementById("tokureiForm"); // 이 ID는 안 바꿔도 됨!
    const reason = document.getElementById("reason");

    // [2] 엑셀 데이터 (ShinseiDTO에 있는 변수명으로 적어야 함)
    const shinseiData = {
    // [1] PK 및 기본 정보
    "kigyoCd": 1,
    "shinseiNo": "${shinseiNo}" == "" ? "0" : "${shinseiNo}",
    
    "shinseiKbn": "A",             // A:신규 (2자리 이내 OK)
    "shinseiYmd": "20231201",      // (8자리 숫자)
    
    // 사유: 너무 길면 안 되니 적당히
    "shinseiRiyu": "転居",         // (짧게 수정)

    "shainUid": 100,
    "shainNo": "202301",           // (6자리 OK)
    "dairiShinseishaCd": null,     // (Integer라 null 가능)
    "shinchokuKbn": "1",           // (1자리 OK)
    "genTsukinroEndKbn": "0",      // (1자리 OK)

    // [2] 변경/이동 정보
    "addressChgKbn": "1",
    "kinmuAddressChgKbn": "0",
    "kyushokuHukkiKbn": "0",

    // [3] 현재 주소/소속 (★ 길이 주의 ★)
    "genShozokuCd": "DEP01",       // (짧게)
    "genZipCd": "1638001",         // 하이픈 제거 필수 (7자리)
    "genAddress1": "東京",         // 한자 2글자 (6byte - 8byte 이내)
    "genAddress2": "新宿",         // (짧게)
    "genAddress3": "西新宿",       // (짧게)

    // [4] 신규 주소/소속 (★ 길이 주의 ★)
    "newShozokuCd": "DEP01",
    "newZipCd": "2200011",         
    "newAddress1": "千葉",         // '카나가와'는 9byte라 에러남 -> '치바'(6byte)로 수정
    "newAddress2": "千葉",
    "newAddress3": "千葉",
    "addressIdoKeido": "",
    "addressCorrect": "0",

    // [5] 현재/신규 근무지 주소 (길이 주의)
    "genKinmuZipCd": "1000001",    
    "genKinmuAddress1": "東京",    
    "genKinmuAddress2": "千代田",  
    "genKinmuAddress3": "千代田",  
    "genKinmuPrefCd": "13",

    "newKinmuZipCd": "1000001",    
    "newKinmuAddress1": "東京",
    "newKinmuAddress2": "千代田",
    "newKinmuAddress3": "千代田",
    "kinmuAddressIdoKeido": "",
    "kinmuAddressCorrect": "0",
    "newKinmuPrefCd": "13",
    "jutakuKbn": "1",

    // [6] 부속 정보 (일단 비움)
    // null이나 빈값은 에러 안 남
    "etcFileUid1": null, "etcFileUid2": null, "etcFileUid3": null,
    "etcFileUid4": null, "etcFileUid5": null,
    "etcComment1": "", "etcComment2": "", "etcComment3": "",
    "etcComment4": "", "etcComment5": "",

    // [7] 날짜 정보 (하이픈 뺀 8자리 문자열)
    "riyoStartYmd": "20240401",
    "riyoEndYmd": "20240930",
    "shikyTeishiKbn": "0",
    "kanriId": "admin",            // (짧게)
    
    "idoYmd": "20240331",
    "itenYmd": "20240330",
    "tennyuYmd": "20240330",
    "haishinYmd": "",
    "keiroHenkoYmd": "",
    
    "firstShinseiYmd": "20231201",
    "kigyoShoninYmd": "",
    "llShoninYmd": "",
    
    "tsukinroNo": 1,
    "sashimodoshiYmd": "",
    "shinseiKigenYmd": "20231231",
    
    "moshiokuriComment": "",
    "biboComment": "",
    "alertUmu": "0",
    
    "torikeshiYmd": "",
    "torikeshiRiyu": "",
    "ichijiHozonId": "",
    
    "jitsuKm": 28.5,
    "navitimeViewCnt": 1,
    
    // [8] Audit
    "addUserId": 100,
    "updUserId": 100,
    
    
    // [9] 경로 정보 (StartKeiroVO 매핑용)
    "startPlace": "横浜",          // 출발지
    "endPlace": "東京",            // 도착지
    "tsukinShudanKbn": "01",       // 교통수단
    "shinseiKm": 30.2              // 신청거리
};
    
    // [2] 경로 정보 (ShinseiStartKeiroVO 매핑용) 
    const startKeiroData = {
        // [PK]
        "kigyoCd": 1,
        "keiroSeq": 1,               // 경로 순번 (필수)
        // "shinseiNo": 0,           // (자동 채번되므로 생략하거나 0)

        // [신청 공통]
        "shinseiKbn": "A",
        "shinseiYmd": "20231201",
        "shainUid": 100,
        "shainNo": "202301",
        "dairiShinseishaCd": "",     // (Integer지만 빈값 보내면 null처리됨)

        // [경로 기본]
        "tsukinShudanKbn": "01",     // 01:전철
        "startPlace": "横浜",        // 출발지
        "endPlace": "東京",          // 도착지
        "shinseiKm": 30.5,           // 거리
        
        // [특례 플래그]
        "yuryoTokurei": "0",         
        "kyoriKagenTokurei": "0",
        "jougenKingakuTokurei": "0",
        "jougenCut": "0",
        "fubiUmuKbn": "0",

        // [기간]
        "kikanStartYmd": "20240401",
        "kikanEndYmd": "20240930",
        "jitsuKinmuNissu": 20,       // 근무일수

        // [수단 상세]
        "busCorpNm": "",             // 버스회사
        "idoShudanKbn": "",          
        "idoShudanEtcNm": "",

        // [경유지 (최대 5개)]
        "viaPlace1": "", "viaPlace2": "", "viaPlace3": "", "viaPlace4": "", "viaPlace5": "",
        "viaPlaceEkicd1": "", "viaPlaceEkicd2": "", "viaPlaceEkicd3": "", "viaPlaceEkicd4": "", "viaPlaceEkicd5": "",
        "viaPlaceRiyu": "",

        // [좌표/역코드]
        "startIdoKeido": "",
        "startEkicd": "",
        "endEkicd": "",
        "kekkaUrl": "",

        // [금액 관련]
        "shinseiKin": 0,
        "katamichiKin": 500,         // 편도
        "tsukiShikyuKin": 15000,     // 월지급액
        "regularShikyuKin": 15000,   // 정기지급액
        
        // [정기권 기간]
        "firstTeikiTsukiSu": 6,      // 6개월
        "firstShikyuYmd": "20240325",
        "firstShikyuKin": 90000,
        "nextTeikiTsukiSu": 6,

        // [이용 구분]
        "shinkansenRiyoKbn": "0",
        "tokkyuRiyoKbn": "0",
        "yuryoRiyoKbn": "0",
        "kekkaSelect": "1",

        // [참조 정기권]
        "sanshoTeikiTsukiSu1": 1, "sanshoTeikiKin1": 15000,
        "sanshoTeikiTsukiSu2": 3, "sanshoTeikiKin2": 44000,
        "sanshoTeikiTsukiSu3": 6, "sanshoTeikiKin3": 85000,

        // [유료도로/기타]
        "yuryoIcS": "",
        "yuryoIcE": "",
        "yuryoOfukuKbn": "0",
        "yuryoKatamichiKin": 0,
        "betsuRouteRiyu": "",
        "yuryoRiyoRiyu": "",

        // [차량 연비 계산]
        "nenpi": 0,
        "gasorinDaiMae": 0, "yuryoDaiMae": 0, "goukeiMae": 0, "hiwariMae": 0,
        "gasorinDaiAto": 0, "yuryoDaiAto": 0, "goukeiAto": 0, "hiwariAto": 0,

        // [Audit]
        "addUserId": 100,
        "updUserId": 100
    };
 
 	// [4] 종료 경로 정보 (ShinseiEndKeiroVO 매핑용)
    const endKeiroData = {
        // [PK]
        "kigyoCd": 1,
        "keiroSeq": 1,              // 순번 1
        // "shinseiNo": 0,          // (자동 연결되므로 생략)

        // [공통 정보]
        "shinseiKbn": "A",
        "shinseiYmd": "20231201",
        "shainUid": 100,
        "shainNo": "202301",
        "dairiShinseishaCd": "",
        "tsukinShudanKbn": "01",    // 01:전철

        // [종료 경로 전용 컬럼]
        "fubiUmuKbn": "0",          // 불비유무
        "genTsukinroNo": 1,         // 기존 통근로 번호
        "riyoEndYmd": "20240331",   // 이용 종료일
        
        "kikanStartYmd": "20231001",// 기간 시작
        "kikanEndYmd": "20240331",  // 기간 종료
        "jitsuKinmuNissu": 20,      // 실제 근무일수
        
        "shinseiKin": 12000,        // 신청 금액
        "jrModoshiKbn": "0",        // JR 환불 구분
        "modoshiKin": 0,            // 환불 금액
        "modoshiFileUid": "",       // 환불 파일 UID
        
        // [Audit]
        "addUserId": 100,
        "updUserId": 100
    };
 	
    // [5] 부수 서류 정보 (ShinseiFuzuiShoruiDTO 매핑용)
    const fuzuiShoruiData = {
        // [PK]
        "kigyoCd": 1,
        "keiroSeq": 1,               // 순번 1
        // "shinseiNo": 0,          // (자동 연결)

        // [공통 정보]
        "shinseiKbn": "A",
        "shinseiYmd": "20231201",
        "shainUid": 100,
        "shainNo": "202301",
        "dairiShinseishaCd": "",     // (빈값 = null)
        "tsukinShudanKbn": "01",     // 01:전철

        // [파일 UID (일단 비움)]
        "fileUid1": "", "fileUid2": "", "fileUid3": "", "fileUid4": "", "fileUid5": "",

        // [면허/차량 정보]
        "menkyoYukoKigen": "",       // 면허유효기간
        "menkyoNo": "",              // 면허번호
        "shashu": "",                // 차종
        "torokuNo": "",              // 등록번호
        "haikiryo": "",              // 배기량
        "shakenYukoKigen": "",       // 차검유효기간
        "nenpi": 0,                  // 연비

        // [보험 정보]
        "hokenManryoYmd": "",        // 보험만료일
        "taijinBaisho": "",          // 대인배상
        "taibutsuBaisho": "",        // 대물배상
        "jinshinShogai": "",         // 인신상해
        "tojoshaShogai": "",         // 탑승자상해
        "tokyu": "",                 // 등급

        // [정기권]
        "firstTeikiKikan": "",
        "nextTeikiKikan": "",

        // [Audit]
        "addUserId": 100,
        "updUserId": 100
    };
 
 	// [6] 파일 정보 (UploadFileDTO 매핑용) - 가짜 데이터
    const fileData = {
        "title": "定期券コピー",
        "name": "dummy.pdf",
        "contentType": "application/pdf",
        // kigyoCd, addUserId 등은 자바에서 세팅
    };
 	
	 // [7] 알림 정보 (AlertVO 매핑용)
    const alertData = {
        // [PK]
        "kigyoCd": 1,
        "shainNo": "202301",
        
        // [필수값]
        "haishinRiyu": "01",      // 배신사유 (2자리 필수)
        "keyYmd": "20231201",     // 기준일자 (필수)

        // [나머지]
        "shainUid": 100,
        "kanriId": "admin",
        "shainNm": "테스트사원",
        "mailAddr": "test@test.com",
        "haishinKbn": "1",
        "syoruiKigenMenkyo": "0",
        "syoruiKigenShaken": "0",
        "syoruiKigenHoken": "0",
        "haishinHindo": "1",
        "shinseiYohi": "1",
        "haishinKaishiYmd": "20231201",
        "haishinSyuryoYmd": "20231231",
        "jikaiHaishinYmd": "",
        "haishinKaisuu": "0",
        "shinseiTitle": "특례신청알림",
        "shinseiShosai": "내용입니다.",
        "shinseiYmd": "20231201",
        "kigyoShoninYmd": "",
        "llShoninYmd": "",
        
        "addUserId": 100,
        "updUserId": 100
    };
	 
    // [8] 신청 로그 정보 (ShinseiLogDTO 매핑용)
    const shinseiLogData = {
        // [PK]
        "kigyoCd": 1,
        // "shinseiNo": (자동),
        // "logSeq": (자동),
        
        // [데이터]
        "syoriKbn": "1",               // 1:신청
        "shinseiKbn": "A",             // A:신규
        "shinseiYmd": "20231201",      // 신청일
        "shinseiRiyu": "転居",         // 사유
        "tokuShinseiRiyu": "",         // 특례사유 (화면값)
        "shainUid": 100,               // 사원UID
        "shainNo": "202301",           // 사원번호
        "dairiShinseishaCd": "",       // 대리자
        
        // [Audit]
        "addUserId": 100,
        "updUserId": 100
    };
    
    // [9] 통지 정보 (OshiraseDTO)
    const oshiraseData = {
        // [PK 및 기본]
        "kigyoCd": 1,              // 기업코드
        "shainUid": 100,           // 사원UID
        
        // [날짜/시간 - DB에서 SYSDATE로 들어가지만 형식상 적어둠]
        "tsuchiYmd": "",           // (XML에서 TO_CHAR(SYSDATE)로 처리됨)
        "tsuchiHm": "",            // (XML에서 처리됨)
        
        // [통지 대상 및 내용]
        "shainNo": "202301",       // 사원번호
        "tsuchishaKigyoCd": 1,     // 통지자 기업코드
        "tsuchishaCd": "admin",    // 통지자 코드
        
        // "shinseiNo": 0,         // (Service에서 자동 연결되므로 0 또는 생략)
        
        "oshiraseNaiyo": "特例申請が正常に登録されました。", // 알림 내용 (CLOB)
        "kengen": "1",             // 권한
        
        // [Audit - 등록자 정보]
        "addUserId": 100,          // 등록자 ID
        "updUserId": 100           // 수정자 ID
        // addDate, updDate는 DB 자동생성
    };

        // [3] 라디오 버튼 이벤트
        radio.addEventListener("change", function() {
            if (radio.checked) {
                reasonBox.style.display = "grid";
                submitBtn.style.display = "inline";
                submitBtn.style.cursor = "pointer";
            }
        });

        // [4] 신청 버튼 클릭 이벤트
        submitBtn.onclick = function() {
            
            // (1) 라디오 체크 확인
            if (!radio.checked) {
                alert("特例について内容を理解した上で申請にチェックしてください。");
                return;
            }

            // (2) 사유 입력 확인
            if (reason.value.trim() === "") {
                alert("特例申請理由を入力してください。");
                reason.focus();
                return;
            }

            // 데이터 집어넣는 기계(함수)를 만든다
            function addHiddenData(dataObj) {
                for (let key in dataObj) {
                    // 1. 기존에 있는 태그 삭제 (중복 방지)
                    let oldInput = form.querySelector('input[name="' + key + '"]');
                    if (oldInput) {
                        form.removeChild(oldInput);
                    }

                    // 2. 새 태그 생성해서 넣기
                    let input = document.createElement("input");
                    input.type = "hidden";
                    input.name = key;           
                    input.value = dataObj[key];
                    form.appendChild(input);
                }
            }

            
            // 1. 신청 정보 
            addHiddenData(shinseiData);

            // 2. 시작 경로
            addHiddenData(startKeiroData); 
            
            // 3. 종료 경로
            addHiddenData(endKeiroData);
            
      	    // 4. 부수 서류 정보
            addHiddenData(fuzuiShoruiData);
      	    
            // 5. 파일 정보
            addHiddenData(fileData);
            
      	    // 6. 경고 정보
            addHiddenData(alertData);
      	    
      	    // 7. 신청 로그 정보
            addHiddenData(shinseiLogData);
      	    
            // 8. 통지 정보
            addHiddenData(oshiraseData);

            form.submit();
        };
    };
</script>

	

</body>
</html>