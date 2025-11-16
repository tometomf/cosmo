<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜経路入力</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
  html { overflow-y: scroll; }

  .page-width {
    width: 950px;
    margin: 0 auto;
  }

  .hint-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin: 8px 0 10px;
  }
  .hint-text { color: #333; line-height: 1.9; flex: 1; }
  .map-btn img { display: block; }

  .route-section {
    position: relative;
    background: #f7f7f7;
    border: 1px solid #ccc;
    border-top: 3px solid #228B22;
    border-radius: 0;
    padding: 20px 10px 18px;
    margin-top: 8px;
  }

  .route-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .route-label {
    position: relative;
    top: -23px;
    margin-left: -10px;
    margin-top: 3px;
    display: inline-block;
    width: 106px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 15px;
    font-weight: 400;
    color: #1f6b1f;
    background: url("<c:url value='/resources/img/tn/bg_keirotitle.gif'/>") no-repeat center top;
    background-size: 100% 100%;
    border: 1px solid #64c764;
    border-top-color: #46b946;
    border-left: none;
    border-radius: 0 0 6px 0;
  }

  .route-add {
    position: relative;
    top: -15px;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 13px;
    color: #7d3fb2;
    text-decoration: none;
  }
  .route-add img { width: 14px; height: 14px; }
  .route-add:hover { text-decoration: underline; }

  .button_Left {
    width: 100%;
    margin: 12px 0 0;
  }
  .button_Left_Group {
    display: flex;
    justify-content: flex-start; 
    align-items: center;
    gap: 14px;
  }
  .button_Left_Group img {
    display: block;
  }

  .keiro-box {
    background: #ffffff;
    border: 1px solid #dcdcdc;
    padding: 10px 14px;
    margin-top: 4px;
  }

  /* ==== 한 줄 정렬 + 줄바꿈 방지 ==== */
  .keiro-row {
    font-size: 13px;
    display: flex;
    flex-wrap: nowrap;
    white-space: nowrap;
    align-items: center;
    column-gap: 20px;
  }

  .keiro-row label {
    display: inline-flex;
    align-items: center;
  }

  .keiro-row .field-label {
    display: inline-block;
    width: 70px;
    text-align: right;
    margin-right: 4px;
  }

  .keiro-row select {
    font-size: 13px;
    padding: 2px 4px;
    width: 110px;  /* 폭 살짝 줄임 */
  }

  .keiro-row input[type="text"] {
    font-size: 13px;
    padding: 2px 4px;
    width: 130px;  /* 폭 줄여서 한 줄 유지 */
  }

  .delete-btn {
    padding: 0 10px;
    height: 24px;
    font-size: 12px;
    border: 1px solid #b0b0b0;
    background: #f7f7f7;
    cursor: pointer;
    white-space: nowrap;
    margin-left: 8px;
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
        <div class="flow_others">申請理由入力</div>
        <div class="flow_current">経路入力</div>
        <div class="flow_others">確認</div>
        <div class="flow_others">完了</div>
      </div>
      <div class="subtitle">日割　通勤経路情報</div>
    </div>

    <div class="page-width">

      <!-- 안내문 + 지도 버튼 (원래 디자인) -->
      <div class="hint-row">
        <div class="hint-text">
          自転車・徒歩・自転車は、住所から勤務地まで、その手段のみを利用する場合に限ります。<br><br>
          電車・バスは、複数手段の利用（乗り継ぎ）が可能です。<br>
          複数手段を利用する場合、手段ごとに線路を分割して登録してください。
        </div>
        <div class="map-btn">
          <br>
          <a href="<c:url value='/hiwariKinmuchi/map'/>">
            <img src="/resources/img/map_mini_btn01.gif" alt="地図を確認">
          </a>
        </div>
      </div>
      <br>

      <form action="<c:url value='/hiwariKinmuchi/keiro'/>" method="post">

        <input type="hidden" id="deleteIndex" name="deleteIndex" value="">

        <div class="route-section">
          <div class="route-head">
           <span class="route-label">
			  経路${repRouteNo}
			</span>

            <button type="submit" name="action" value="addRow"
                    class="route-add" style="border:none;background:none;padding:0;cursor:pointer;">
              <img src="/resources/img/tuika_icon.gif" alt="追加アイコン">
              追加する
            </button>
          </div>

          <c:forEach var="row" items="${keiroList}" varStatus="st">
            <div class="keiro-box">
              <div class="keiro-row">

                <label>
                  <span class="field-label">通勤手段：</span>
                  <select name="tsukinShudanKbn">
                    <option value="">選択してください</option>
                    <option value="01" <c:if test="${row.tsukinShudanKbn == '01'}">selected</c:if>>電車</option>
                    <option value="02" <c:if test="${row.tsukinShudanKbn == '02'}">selected</c:if>>バス</option>
                    <option value="03" <c:if test="${row.tsukinShudanKbn == '03'}">selected</c:if>>徒歩</option>
                    <option value="04" <c:if test="${row.tsukinShudanKbn == '04'}">selected</c:if>>自転車</option>
                    <option value="05" <c:if test="${row.tsukinShudanKbn == '05'}">selected</c:if>>自動車</option>
                  </select>
                </label>

                <label>
                  <span class="field-label">出発地：</span>
                  <input type="text"
                         name="startPlace"
                         value="${row.startPlace}">
                </label>

                <label>
                  <span class="field-label">到着地：</span>
                  <input type="text"
                         name="endPlace"
                         value="${row.endPlace}">
                </label>

                <label>
                  <span class="field-label">代表経路：</span>
                  <input type="radio"
                         name="kekkaSelectIndex"
                         value="${st.index}"
                         <c:if test="${row.kekkaSelect == '1'}">checked</c:if> >
                </label>

                <input type="hidden" name="kigyoCd"   value="${row.kigyoCd}"/>
                <input type="hidden" name="shinseiNo" value="${row.shinseiNo}"/>
                <input type="hidden" name="keiroSeq"  value="${row.keiroSeq}"/>

                <button type="submit"
                        name="action"
                        value="deleteRow"
                        class="delete-btn"
                        onclick="document.getElementById('deleteIndex').value='${st.index}'">
                  削除
                </button>

              </div>
            </div>
          </c:forEach>

        </div>

        <br><br>
        <div class="button_Left">
          <div class="button_Left_Group">
            <a href="<c:url value='/hiwariKinmuchi/back'/>">
              <img src="/resources/img/back_btn01.gif" alt="戻る">
            </a>

            <button type="submit" name="action" value="apply"
                    style="border:none;background:none;padding:0;cursor:pointer;">
              <img src="/resources/img/next_btn01.gif" alt="次へ">
            </button>

            <button type="submit" name="action" value="temp"
                    style="border:none;background:none;padding:0;cursor:pointer;">
              <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
            </button>
          </div>
        </div>

      </form>

      <br><br>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </div>
</div>
</body>
</html>
