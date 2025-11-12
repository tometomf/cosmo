<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    margin-left: -1px;
    display: inline-block;
    width: 90px;
    height: 33px;
    line-height: 33px;
    text-align: center;
    font-size: 15px;
    font-weight: 400;
    color: #1f6b1f;
    background: url("<c:url value='/resources/img/tn/bg_keirotitle.gif'/>") no-repeat center top;
    background-size: cover;
    border: 1px solid #64c764;
    border-top-color: #46b946;
    border-radius: 0;
  }

  .route-add {
    position: relative;
    top: -6px;
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

/*追加する */
.route-add{
  top: -15px;           /* 기존 -6px → 조금 더 위로 */
}

/*経路①*/
.route-label{
  margin-left: -10px;    /* 배경 박스(회색 박스) 왼쪽 테두리와 정확히 맞춤 */
  margin-top: 3px;    /* 상단 초록 라인에 더 가깝게 */
  width: 106px;         /* 스샷 느낌이면 100~110px 사이에서 조정 */
  height: 30px;         /* 높이·라인하이트 조금 낮춰 타이트하게 */
  line-height: 30px;
  background-size: 100% 100%;
  border-left: none;     /* 왼쪽 보더 제거 */
  border-radius: 0 0 6px 0;   /* 좌하단만 라운드( top-left, top-right, bottom-right, bottom-left ) */
  .route-label {
  border-left: none;   
 
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

    
      <div class="route-section">
        <div class="route-head">
          <span class="route-label">経路①</span>
          <a class="route-add" href="<c:url value='/hiwariKinmuchi/route/add'/>">
            <img src="/resources/img/tuika_icon.gif" alt="追加アイコン">
            追加する
          </a>
        </div>
      </div>

	<br><br>
	
    
      <div class="button_Left">
        <div class="button_Left_Group">
          <a href="<c:url value='/hiwariKinmuchi/back'/>">
            <img src="/resources/img/back_btn01.gif" alt="戻る">
          </a>
          <a href="<c:url value='/hiwariKakunin'/>">
            <img src="/resources/img/shinsei_btn01.gif" alt="申請へ">
          </a>
          <a href="<c:url value='/hiwariKinmuchi/saveTemp'/>">
            <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
          </a>
        </div>
      </div>

      <br><br>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </div>
</div>
</body>
</html>
