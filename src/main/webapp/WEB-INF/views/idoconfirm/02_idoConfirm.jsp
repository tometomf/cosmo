<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 
    [화면ID] 0200 異動有無確認 (이동유무확인)
    * 고객님 기존 HTML/CSS 레이아웃 및 일본어 텍스트를 유지하고, 로직 주석은 한국어입니다.
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>異動有無確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>
<style>
/* 고객님 기존 인라인 CSS 유지 */
#form_Text1 { display: grid; grid-template-columns: 1fr 5fr; }
#form_Text2 { display: grid; grid-template-columns: 1fr 1.2fr 1.2fr; }

.form_Column1 {
    display: flex;
    align-items: center;
    color: white;
    background-color: #545454;
    border: solid 1px white;
    justify-content: center;
}

.form_Normal1 { border: solid 1px white; display: flex; gap: 5px; }

.button_Left { margin-top: 50px; }
.button_Left_Group {
    display: flex; /* 가로로 일렬 배치 */
    align-items: center; /* 세로 가운데 정렬 */
    gap: 24px; /* 버튼 사이 간격(px) */
}
</style>

<body>
    <div class="layout">
        <%@ include file="/WEB-INF/views/common/header.jsp"%>
        
        <div class="main"> 
            <div class="main_title">
                <div class="subtitle">異動有無確認</div> 

                <%-- 화면 상단 안내 메시지 (일본어 유지) --%>
                <div
                    style="display: flex; flex-direction: column; width: 1010px; margin: auto; padding-top: 40px; padding-bottom: 20px;">
                    <div>
                        勤務地および住所に変更がありますか？<br> それぞれ選択して、「次へ」をクリックしてください。<br>
                    </div>
                    <div style="padding-top: 10px;">
                        (注)異動にともなって転居がある方は、転居先が確定した後に申請してください。
                    </div>
                </div>
            </div>

            <%-- 1. 現勤務地 / 現住所 (서버 데이터 바인딩) --%>
            <div class="content_Form1">
                <div class="form_Text1" id="form_Text1">
                    <div class="form_Column1"
                        style="padding-top: 10px; padding-bottom: 10px;">現勤務地</div>
                    <div class="form_Normal"
                        style="padding-top: 10px; padding-bottom: 10px;">
                        <%-- 현재 근무지 텍스트를 Controller에서 Model로 넘겨받아 출력 --%>
                        <c:out value="${currWorkPlaceText}" default="東京都中野区本町3-30-4KDX中野坂上ビル8F" />
                    </div>
                </div>
                <div class="form_Text1" id="form_Text1">
                    <div class="form_Column1"
                        style="padding-top: 10px; padding-bottom: 10px;">現住所</div>
                    <div class="form_Normal"
                        style="padding-top: 10px; padding-bottom: 10px;">
                        <%-- 현재 주소 텍스트를 Controller에서 Model로 넘겨받아 출력 --%>
                        <c:out value="${currAddressText}" default="神奈川県川崎市高津区下作延1-2-3 レオパレス溝の口 103" />
                    </div>
                </div>
            </div>

            <%-- 2. 라디오 버튼 입력 폼 --%>
            <form action="<c:url value='/idoconfirm/next' />" method="post">
                <div class="content_Form1" style="width: 580px; margin-left: 3.1%;">
                    <div class="form_Text1" id="form_Text2">
                        <div class="form_Column"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            勤務地が
                        </div>
                        <div class="form_Normal"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            <%-- 근무지 변경됨 (変わる) --%>
                            <%-- isWorkPlaceFixed == true 일 때 설계서대로 '変わる'를 강제 선택 --%>
                            <input type="radio" name="workPlaceChange" value="true"
                                <c:if test="${isWorkPlaceFixed}">checked="checked"</c:if>>
                            変わる
                        </div>
                        <div class="form_Normal"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            <%-- 근무지 변경 안 됨 (変わらない) --%>
                            <input type="radio" name="workPlaceChange" value="false"
                                <%-- 기본값: 고정이 아닐 때(기타 알림) '変わらない' 선택 --%>
                                <c:if test="${not isWorkPlaceFixed}">checked="checked"</c:if>
                                <%-- 異動／移転의 경우 설계서에 따라 선택 불가 --%>
                                <c:if test="${isWorkPlaceFixed}">disabled="disabled"</c:if>>
                            変わらない
                        </div>
                    </div>

                    <div class="form_Text1" id="form_Text2">
                        <div class="form_Column"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            住所が
                        </div>
                        <div class="form_Normal"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            <%-- 주소 변경됨 (変わる) --%>
                            <input type="radio" name="addressChange" value="true">変わる
                        </div>
                        <div class="form_Normal"
                            style="display: flex; justify-content: center; align-items: center; padding-top: 15px; padding-bottom: 15px;">
                            <%-- 주소 변경 안 됨 (変わらない) --%>
                            <input type="radio" name="addressChange" value="false" checked>変わらない
                        </div>
                    </div>
                </div>

                <div class="button_Left" style="margin-top: 50px;">
                    <div class="button_Left_Group">
                        <%-- 돌아가기 버튼 (戻る) --%>
                        <a href="<c:url value='/' />"> 
                            <img src="/resources/img/back_btn01.gif" alt="back_btn01">
                        </a>

                        <%-- 다음 버튼 (次へ) - submit 액션 --%>
                        <button type="submit"
                            style="border: none; background: none; padding: 0; cursor: pointer;">
                            <img src="/resources/img/next_btn01.gif" alt="next_btn01">
                        </button>
                    </div>
                </div>
            </form>
            
        </div> 
        <%-- 메인 컨텐츠 영역 끝 --%>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>
</body>
</html>
