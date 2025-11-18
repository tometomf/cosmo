<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
.flow-wrapper {
    display: flex;
    gap: 16px;
    justify-content: center;
    align-items: center;
}

.flow-current {
    position: relative;
    flex: 1 1 0;
    min-width: 0;
    width: 100%;
    height: 100px;
    background-image: url('<c:url value="/resources/img/bg_flow_01.gif"/>');
    background-size: auto;
    background-position: center;
    background-repeat: no-repeat;
}

.flow-other {
    position: relative;
    flex: 1 1 0;
    min-width: 0;
    width: 100%;
    height: 100px;
    background-image: url('<c:url value="/resources/img/bg_flow_02.gif"/>');
    background-size: auto;
    background-position: center;
    background-repeat: no-repeat;
}

.flow-currenttext {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #fff;
    font-size: clamp(12px, 2vw, 7px);
    font-weight: 700;
    text-align: center;
}

.flow-othertext {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #808080;
    font-size: clamp(12px, 2vw, 7px);
    font-weight: 700;
    text-align: center;
}

.commute-container {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 0.5rem;
    gap: 1rem;
}

.content-box {
    width: 1010px;
    margin: auto;
    display: flex;
    justify-content: left;
}

.info-text {
    width: 100%;
    text-align: left;
}

.commute-box {
    width: 1010px;
    margin: auto;
    display: flex;
    flex-direction: column;
    color: #333;
}

.commute-row {
    width: 65%;
    min-width: 400px;
    display: flex;
    border: 1px solid #bfbfbf;
    margin-bottom: 12px;
}

.commute-label {
    width: 140px;
    padding: 8px 12px;
    border-right: 1px solid #bfbfbf;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    letter-spacing: 0.05em;
}

.commute-label.dark {
    background: #595860;
    color: #fff;
    border-right: none;
}

.commute-value {
    flex: 1;
    padding: 8px 12px;
    background: #fff;
}

.commute-panel {
    width: 65%;
    min-width: 400px;
    display: flex;
    border: 1px solid #bfbfbf;
}

.commute-label.light {
    background: #dddddd;
    border-right: 1px solid #bfbfbf;
    padding: 14px 12px;
    display: flex;
    align-items: flex-start;
}

.commute-body {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 6px;
    padding: 12px 16px;
}

.commute-body label {
    display: flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
}

.commute-body input[type="radio"] {
    accent-color: #333;
    transform: scale(1.05);
}
</style>
</head>
<body>
    <div class="layout">
        <%@ include file="/WEB-INF/views/common/header.jsp"%>
        <div class="main">
            <div class="flow">
                <div class="flow_others">勤務地入力</div>
                <div class="flow_others">住所入力</div>
                <div class="flow_current">経路入力</div>
                <div class="flow_others">付随書類入力</div>
                <div class="flow_others">確認</div>
                <div class="flow_others">完了</div>
            </div>

        <div class="subtitle">【経路①】 通勤手段 入力</div>
        <div class="commute-container">
            <div class="content-box">
                <div class="info-text">通勤手段を選択してください.</div>
            </div>

            <div class="commute-box">
                <div class="commute-row">
                    <div class="commute-label dark">現 通勤手段</div>
                    <div class="commute-value" id="tsukinShudanDiv"></div>
                </div>
                <div class="commute-panel">
                    <div class="commute-label light">新 通勤手段</div>
                    <div class="commute-body">
                        <label><input type="radio" name="way" value="densha"
                            checked> 電車</label>
                        <label><input type="radio" name="way"
                            value="bus"> バス</label>
                        <label><input type="radio"
                            name="way" value="car"> 自動車</label>
                        <label><input type="radio" name="way"
                            value="toho"> 徒歩</label>
                        <label><input type="radio" name="way"
                            value="other"> その他</label>
                    </div>
                </div>
            </div>
            <div class="content-box">
                <div class="button_Left_Group">
                    <img src="/resources/img/back_btn01.gif" alt="back_btn01">
                    <img src="/resources/img/keiro_btn01.gif" alt="nyuryoku_btn01">
                    <img src="/resources/img/hozon_btn01.gif" alt="nyuryoku_btn01">
                </div>
            </div>
        </div>
        
        <!-- 임시저장용 폼 -->
        <form id="tsukinTempForm" method="post" action="<c:url value='/keiroinput/tempSave'/>">
            <!-- ShinseiIcDataVO 구조의 JSON 문자열 -->
            <input type="hidden" name="commuteJson" value="">
        </form>

    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const keiro = {
        kigyoCd: "${keiro.kigyoCd}",
        shainUid: "${keiro.shainUid}",
        keiroSeq: "${keiro.keiroSeq}",
        tsukinShudanKbn: "${keiro.tsukinShudanKbn}",
        tsukinShudanNm: "${keiro.tsukinShudanNm}",
        startPlace: "${keiro.startPlace}",
        endPlace: "${keiro.endPlace}",
        viaPlace1: "${keiro.viaPlace1}",
        viaPlace2: "${keiro.viaPlace2}",
        viaPlace3: "${keiro.viaPlace3}",
        viaPlace4: "${keiro.viaPlace4}",
        viaPlace5: "${keiro.viaPlace5}",
        shinseiKm: "${keiro.shinseiKm}",
        shikyuKin: "${keiro.shikyuKin}"
    };

    // 현 통근수단 표시
    document.getElementById("tsukinShudanDiv").innerText = keiro.tsukinShudanNm;

    // 버튼 이미지 DOM
    const keiroBtn = document.querySelector('img[src="/resources/img/keiro_btn01.gif"]');
    const hozonBtn = document.querySelector('img[src="/resources/img/hozon_btn01.gif"]');
    const radios   = document.querySelectorAll('input[name="way"]');

    // 1) 경로 상세 입력 화면으로 이동 (기존 기능)
    keiroBtn.addEventListener('click', function() {
        const selected = document.querySelector('input[name="way"]:checked');
        if (!selected) {
            alert("通勤手段を選択してください。");
            return;
        }

        let url = "";
        switch (selected.value) {
            case "densha":
                url = "07_keirodtInput";
                break;
            case "bus":
                url = "07_keirodtInput_02";
                break;
            case "toho":
                url = "07_keirodtInput_04";
                break;
            case "car":
                url = "07_keirodtInput_03";
                break;
            case "other":
                alert("その他ページは未設定です。");
                return;
        }

        window.location.href = url;
    });

 // 통근수단 value → 코드 매핑 (CODE 103과 맞춰서 사용하는 코드)
    const TSUKIN_SHUDAN_MAP = {
        densha: "01",   // 電車
        bus:    "02",   // バス
        car:    "03",   // 自動車
        toho:   "04",   // 徒歩
        other:  "99"    // その他
    };

    hozonBtn.addEventListener('click', function () {
        const selected = document.querySelector('input[name="way"]:checked');
        if (!selected) {
            alert("通勤手段を選択してください。");
            return;
        }

        const value = selected.value;              // "densha" / "bus" / ...
        const kbn   = TSUKIN_SHUDAN_MAP[value];    // "01" / "02" ...
        if (!kbn) {
            alert("通勤手段コードが未設定です。(" + value + ")");
            return;
        }

        // 라디오 옆에 표시된 일본어 텍스트 (電車, バス, …)
        const labelText = selected.parentElement.textContent.trim();

        // 🔹 ShinseiIcDataVO 구조에 맞춘 임시저장용 JSON
        const shinseiIcData = {
            // 공통 정보 – 이 화면엔 없으니 일단 null/빈값
            kigyoCd:   keiro.kigyoCd || null,
            shinseiNo: null,
            shinseiYmd: null,
            shinseiKbn: null,        // 이후 다른 화면/서버에서 세팅
            shinchokuKbn: null,
            genAddress: null,
            newAddress: null,
            genShozoku: null,
            newShozoku: null,
            genKinmuchi: null,
            newKinmuchi: null,

            riyu: null,
            idoYmd: null,
            itenYmd: null,
            tennyuYmd: null,
            riyoStartYmd: null,
            ssmdsYmd: null,
            moComment: null,

            codeNm: null,
            shinseiName: null,

            // 🔸 통근경로 정보 (ShinseiKeiroVO로 매핑)
            keiro: {
                tsukinShudan: kbn,        // ShinseiKeiroVO.tsukinShudan
                shudanName:   labelText   // ShinseiKeiroVO.shudanName
                // 필요하면 추가:
                // startPlace: keiro.startPlace || null,
                // endPlace:   keiro.endPlace   || null,
            }
        };

        const jsonString = JSON.stringify(shinseiIcData);

        const form = document.getElementById("tsukinTempForm");
        form.querySelector('input[name="commuteJson"]').value = jsonString;

        form.submit(); // → /keiro/tempSave POST
    });
});
</script>

</body>
</html>
