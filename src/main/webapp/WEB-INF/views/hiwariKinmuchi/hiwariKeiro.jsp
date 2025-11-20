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
    cursor: pointer;
  }
  .route-add img {
    width: 14px;
    height: 14px;
  }
  .route-add:hover { text-decoration: underline; }

  .keiro-box {
    background: #ffffff;
    border: 1px solid #dcdcdc;
    padding: 10px 14px;
    margin-top: 6px;
  }

  .keiro-row {
    font-size: 13px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    column-gap: 20px;
    row-gap: 4px;
  }

  .keiro-row span { white-space: nowrap; }

  .button_Left {
    margin-top: 18px;
  }
  .button_Left_Group {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 14px;
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

    <%
      // 経路タブの丸数字表示용 (index 0은 미사용)
      String[] maruDigits = {"", "①","②","③","④","⑤","⑥","⑦","⑧","⑨"};
      pageContext.setAttribute("maruDigits", maruDigits);
    %>

    <div class="page-width">

      <c:if test="${not empty errorMsg}">
        <div style="color:#d00; margin: 4px 0 6px; font-size: 12px;">
          <c:out value="${errorMsg}"/>
        </div>
      </c:if>

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

        <c:url var="keiroInputUrl" value="/hiwariKinmuchi/keiroInput" />

        <%-- ▼ DB 유무에 따른 분기 ▼ --%>
        <c:choose>

          <%-- 1) DB에 경로가 없을 때: 경로 repRouteNo + 追加する + 빈 리스트 --%>
          <c:when test="${empty keiroList}">
            <div class="route-section">
              <div class="route-head">
                <span class="route-label">
                  経路${maruDigits[repRouteNo]}
                </span>

                <button type="button"
                        class="route-add"
                        style="border:none;background:none;padding:0;"
                        onclick="location.href='${keiroInputUrl}'">
                  <img src="/resources/img/tuika_icon.gif" alt="追加">
                  追加する
                </button>
              </div>

              <!-- keiroList가 비어 있으므로 실제 경로행 없음 -->
            </div>
          </c:when>

          <%-- 2) DB에 경로가 있을 때: 경로①,②,... 를 회색 박스로 반복 표시 --%>
          <c:otherwise>
            <c:forEach var="row" items="${keiroList}" varStatus="st">

              <%-- 수정 화면용: 추가 화면과 동일한 keiroInput 으로, keiroSeq 파라미터만 추가 --%>
              <c:url var="editUrl" value="/hiwariKinmuchi/keiroInput">
                <c:param name="keiroSeq" value="${row.keiroSeq}"/>
              </c:url>

              <%-- 삭제용: GET /keiro/delete?keiroSeq=... 으로 전송 --%>
              <c:url var="deleteUrl" value="/hiwariKinmuchi/keiro/delete">
                <c:param name="keiroSeq" value="${row.keiroSeq}"/>
              </c:url>

              <div class="route-section">
                <div class="route-head">
                  <span class="route-label">
                    <%-- 리스트 index 기준으로 経路①,②,... 부여 --%>
                    経路${maruDigits[st.index + 1]}
                  </span>

                  <button type="button"
                          class="route-add"
                          style="border:none;background:none;padding:0;"
                          onclick="location.href='${keiroInputUrl}'">
                    <img src="/resources/img/tuika_icon.gif" alt="追加">
                    追加する
                  </button>
                </div>

                <div class="keiro-box">
                  <div class="keiro-row">
                    <span>通勤手段：<c:out value="${row.tsukinShudanNm}"/></span>
                    <span>出発地：<c:out value="${row.startPlace}"/></span>
                    <span>到着地：<c:out value="${row.endPlace}"/></span>

                    <span style="margin-left: 20px;">
                      <a href="${editUrl}">変更する</a>｜
                      <a href="${deleteUrl}"
                         onclick="return confirm('この経路を削除しますか？');">
                        削除する
                      </a>
                    </span>
                  </div>
                </div>
              </div>

            </c:forEach>
          </c:otherwise>

        </c:choose>
        <%-- ▲ 분기 끝 ▲ --%>

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
