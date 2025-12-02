<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 유지희 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
/* ===== kakunin 화면 전용 커스텀 ===== */

/* 오른쪽 칸 세로 정렬 */
.form_Text1.twoCol .form_Normal {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
}

/* 업로드 영역 */
.upload-top {
  display: flex;
  align-items: left;
  gap: 4px;
}
.upload-note {
  margin-top: 4px;
  white-space: normal;
}

/* 화면 폭 고정 */
.page-width {
  width: 950px;
  margin: 0 auto;
}

/* 테이블 왼쪽 정렬 */
.content_Form1,
.content_Form2 {
  margin: 0 !important;
  margin-left: 0 !important;
  width: 100% !important;
}
.content_Form1 + .content_Form1,
.content_Form1 + .content_Form2,
.content_Form2 + .content_Form1,
.content_Form2 + .content_Form2 {
  margin-top: 24px !important;
}

/* 2컬럼 그리드 */
.twoCol {
  display: grid;
  grid-template-columns: 180px 1fr;
}

/* 표 셀 스타일 */
.form_Column {
  background: #e5e5e5;
  padding: 4px 8px;
  border: 1px solid #d5d5d5;
  font-weight: normal;
  box-sizing: border-box;
}
.form_Normal {
  border: 1px solid #d5d5d5;
  padding: 4px 8px;
  box-sizing: border-box;
}

/* 경로 제목 바 */
.form_Title2 {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 4px 8px;
  background: #4c4c4c;
  color: #fff;
  border: 1px solid #4c4c4c;
  font-weight: bold;
}
.form_Title2 > div:first-child {
  font-weight: bold;
}

/* 버튼 영역 */
.button_Left {
  margin-top: 20px;
}

/* 버튼 3개 한 줄로 */
.button_Left_Group {
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

/* footer 고정 해제 + 가운데 정렬 */
#footer {
  position: static !important;   /* fixed 풀기 */
  width: 950px;
  margin: 20px auto 0;
  text-align: center;
  float: none !important;
}
</style>

</head>
<body>
<c:if test="${not empty tempSaveMsg}">
  <div class="info-message">
    ${tempSaveMsg}
  </div>
</c:if>
<div class="layout">
  <%@ include file="/WEB-INF/views/common/header.jsp"%>
  
  <!-- 신청선택 화면과 동일한 상단 구조 -->
  <div class="main">
    <div class="main_title">
      <div class="flow">
        <div class="flow_others">勤務地入力</div>
        <div class="flow_others">住所入力</div>
        <div class="flow_others">申請理由入力</div>
        <div class="flow_others">経路入力</div>
        <div class="flow_current">確認</div>
        <div class="flow_others">完了</div>
      </div>
      <div class="subtitle">確認</div>
    </div>

    <!-- 여기부터 내용 영역을 page-width로 감싸서 폭만 950px로 제한 -->
    <div class="page-width">

     


      <!-- 社員情報 -->
      <div class="content_Form1">
        <div class="form_Text1" style="display:grid; grid-template-columns:180px 1fr 180px 1fr;">
          <div class="form_Column" style="text-align:center;">社員番号</div>
          <div class="form_Normal">
            <c:out value="${emp.no}" default="123456"/>
          </div>
          <div class="form_Column" style="text-align:center;">社員名</div>
          <div class="form_Normal">
            <c:out value="${emp.name}" default="田中 太郎"/>
          </div>
        </div>
      </div>

      <!-- 勤務地 / 住所 -->
      <div class="content_Form1">
        <div class="form_Text1 twoCol">
          <div class="form_Column" style="text-align:center;">勤務地</div>
          <div class="form_Normal">
            <c:out value="${emp.workplace}" default="東京都中野区本町3-30-4 KDX中野坂上ビル8F"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column" style="text-align:center;">住所</div>
          <div class="form_Normal">
            <c:out value="${emp.address}" default="神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201"/>
          </div>
        </div>
      </div>

              <!-- 通勤経路一覧（SHINSEI_START_KEIRO 그대로 표시） -->
      <c:if test="${not empty keiroList}">
        <!-- 목록 한 번만 정의 -->
        <c:set var="circledNums" value="①,②,③,④,⑤,⑥,⑦,⑧,⑨,⑩" />

        <c:forEach var="r" items="${keiroList}" varStatus="st">
          <div class="content_Form2">
            <div class="form_Title2">
              <div>
                通勤経路
                <!-- index 0부터 시작 -->
                <c:out value="${fn:split(circledNums, ',')[st.index]}"/>
              </div>
              <div class="edit-btn"
                   onclick="location.href='<c:url value="/hiwariKinmuchi/keiro/edit"/>?keiroSeq=${r.keiroSeq}'"></div>
            </div>

            <!-- 通勤手段 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">通勤手段</div>
              <div class="form_Normal">
                <c:out value="${r.tsukinShudanNm}" default="―"/>
              </div>
            </div>

            <!-- 経路（START ～ END ＋ 経由） -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">経路</div>
              <div class="form_Normal">
                <c:out value="${r.startPlace}" default=""/> ～ 
                <c:out value="${r.endPlace}" default=""/>

                <c:if test="${not empty r.viaPlace1 
                             or not empty r.viaPlace2 
                             or not empty r.viaPlace3 
                             or not empty r.viaPlace4 
                             or not empty r.viaPlace5}">
                  （経由：
                  <c:if test="${not empty r.viaPlace1}"><c:out value="${r.viaPlace1}"/> </c:if>
                  <c:if test="${not empty r.viaPlace2}"><c:out value="${r.viaPlace2}"/> </c:if>
                  <c:if test="${not empty r.viaPlace3}"><c:out value="${r.viaPlace3}"/> </c:if>
                  <c:if test="${not empty r.viaPlace4}"><c:out value="${r.viaPlace4}"/> </c:if>
                  <c:if test="${not empty r.viaPlace5}"><c:out value="${r.viaPlace5}"/></c:if>
                  )
                </c:if>
              </div>
            </div>

            <!-- 対象期間 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">対象期間</div>
              <div class="form_Normal">
                <c:out value="${r.kikanStartYmd}" default=""/> ～ 
                <c:out value="${r.kikanEndYmd}" default=""/>
              </div>
            </div>

            <!-- 出勤日数 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">出勤日数</div>
              <div class="form_Normal">
                <c:out value="${r.shukkinNissuu}" default="0"/>日間
              </div>
            </div>

            <!-- 片道料金 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">片道料金</div>
              <div class="form_Normal">
                <c:out value="${r.kataMichiKin}" default="0"/>円
              </div>
            </div>

            <!-- 申請金額 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">申請金額</div>
              <div class="form_Normal">
                <c:out value="${r.shinseiKin}" default="0"/>円
              </div>
            </div>

            <!-- 月額（1ヶ月参考値） -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">金額（1ヶ月参考値）</div>
              <div class="form_Normal">
                <c:out value="${r.tsukiShikyuKin}" default="0"/>円
              </div>
            </div>

            <!-- 日割額 -->
            <div class="form_Text1 twoCol">
              <div class="form_Column">日割額</div>
              <div class="form_Normal">
                <c:out value="${r.hiwariAto}" default="0"/>円
              </div>
            </div>

          </div>
        </c:forEach>
      </c:if>

      <!-- 申請情報 -->
      <div class="content_Form1">
        <div class="form_Text1 twoCol">
          <div class="form_Column">申請区分</div>
          <div class="form_Normal">
            <c:out value="${apply.kind}" default="日割"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">申請理由</div>
          <div class="form_Normal">
            <c:out value="${apply.reason}" default="りゆうりゆう"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">申請期間</div>
          <div class="form_Normal">
            <c:out value="${apply.periodText}" default="2013/09/26 ～ 2013/09/30"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">出勤日数</div>
          <div class="form_Normal">
            <c:out value="${apply.workDays}" default="4日間"/>
          </div>
        </div>
      </div>
      <!-- 合計金額 -->
      <div class="content_Form1">
        <div class="form_Text1 twoCol">
          <div class="form_Column">金額合計</div>
          <div class="form_Normal">
            <c:out value="${apply.totalAmount}" default="3,600円"/>
          </div>
        </div>
      </div>

      <br>

      <!-- アップロード + 申請 を 하나의 form 으로 묶기 -->
      <form id="submitForm"
            method="post"
            action="<c:url value='/hiwariKinmuchi/submit'/>"
            enctype="multipart/form-data"
            style="display:inline;">

        <!-- アップロード 영역 -->
        <div class="content_Form1">
          <div class="form_Text1 twoCol">
            <div class="form_Column" style="display:flex; align-items:center;">
              アップロード
            </div>
            <div class="form_Normal">
              <div class="upload-top">
                <input type="text" id="uploadName" readonly style="width:180px;">
                <button type="button"
                        onclick="document.getElementById('uploadFile').click();">参照</button>
                <button type="button">アップロード</button>
                <input type="file" id="uploadFile" name="evidence" style="display:none"
                       onchange="document.getElementById('uploadName').value=this.files[0].name;">
              </div>

              <div class="upload-note">
                ※定期券を購入している場合は、定期券コピーをアップロードしてください。
              </div>
            </div>
          </div>
        </div>

        <br>

        <!-- 3개 버튼을 한 줄에 배치 -->
        <div class="button_Left">
          <div class="button_Left_Group">

            <!-- 戻る: 그냥 링크 -->
            <a href="<c:url value='/hiwariKinmuchi/keiro'/>">
              <img src="/resources/img/back_btn01.gif" alt="戻る">
            </a>

            <!-- 申請: submitForm submit -->
            <a href="javascript:void(0);"
               onclick="document.getElementById('submitForm').submit();">
              <img src="/resources/img/shinsei_btn01.gif" alt="申請へ">
            </a>

            <!-- 一時保存: 별도 form 이지만 같은 줄에 표시 -->
            <form id="tempForm"
                  method="post"
                  action="<c:url value='/hiwariKinmuchi/tempSave'/>"
                  style="display:inline;">
              <a href="javascript:void(0);"
                 onclick="document.getElementById('tempForm').submit();">
                <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
              </a>
            </form>

          </div>
        </div>

      </form>   <!-- submitForm 끝 -->

    </div>  <!-- .page-width -->
  </div>    <!-- .main -->

  <%@ include file="/WEB-INF/views/common/footer.jsp"%>

</div>      <!-- .layout -->
</body>
</html>
      