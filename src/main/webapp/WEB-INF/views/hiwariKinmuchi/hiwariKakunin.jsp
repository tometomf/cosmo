<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style>
  /* 보강 스타일 – 나머지는 main.css 사용 */
  .mt16{margin-top:16px}
  .mt24{margin-top:24px}
  .edit-btn{display:flex; gap:6px; align-items:center; cursor:pointer;}
  .form_Title2 > div:first-child{font-weight:700}

  /* 2열 폼 레이아웃 */
  .twoCol { display:grid; grid-template-columns:180px 1fr; }

  /* 안내문 */
  .note-sm { font-size:.92rem; color:#666; margin-top:6px; }

  /* 섹션 간 여백 줄이기 (기존 25px → 10px) */
  .content_Form1:not(:first-of-type),
  .content_Form2:not(:first-of-type) { margin-top:10px !important; }
</style>
</head>
<body>
<div class="layout">
  <%@ include file="/WEB-INF/views/common/header.jsp"%>

  <!-- 상단 플로우 / 進捗ステップ -->
  <div class="main">
    <div class="main_title">
      <div class="flow">
        <div class="flow_others">申請内容</div>
        <div class="flow_others">勤務地</div>
        <div class="flow_others">住所</div>
        <div class="flow_others">経路</div>
        <div class="flow_current">確認</div>
        <div class="flow_others">完了</div>
      </div>
      <div class="subtitle">確認</div>
    </div>

    <!-- 社員情報（社員番号・社員名） -->
    <div class="content_Form1">
      <div class="form_Text1" style="display:grid; grid-template-columns:180px 1fr 180px 1fr;">
        <div class="form_Column">社員番号</div>
        <div class="form_Normal"><c:out value="${emp.no}" default="123456"/></div>
        <div class="form_Column">社員名</div>
        <div class="form_Normal"><c:out value="${emp.name}" default="田中 太郎"/></div>
      </div>
    </div>

    <!-- 勤務地・住所 -->
    <div class="content_Form1">
      <div class="form_Text1" style="display:grid; grid-template-columns:180px 1fr;">
        <div class="form_Column">勤務地</div>
        <div class="form_Normal">
          <c:out value="${emp.workplace}" default="東京都中野区本町3-30-4 KDX中野坂上ビル8F"/>
        </div>
      </div>
      <div class="form_Text1" style="display:grid; grid-template-columns:180px 1fr;">
        <div class="form_Column">住所</div>
        <div class="form_Normal">
          <c:out value="${emp.address}" default="神奈川県川崎市中原区新丸子1-2-3 レオパレス新丸子201"/>
        </div>
      </div>
    </div>

    <!-- 通勤経路① -->
    <div class="content_Form2">
      <div class="form_Title2">
        <div>通勤経路①</div>
        <div class="edit-btn" onclick="location.href='<c:url value="/hiwariKinmuchi/edit"/>'"></div>
      </div>
      <div class="form_Text1 twoCol"><div class="form_Column">通勤手段</div><div class="form_Normal"><c:out value="${route1.transport}" default="バス"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">経路</div><div class="form_Normal"><c:out value="${route1.route}" default="新九千交差点 → 新九千駅"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">出勤日数</div><div class="form_Normal"><c:out value="${route1.workDays}" default="5日間"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">片道料金</div><div class="form_Normal"><c:out value="${route1.oneWayFee}" default="—"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">金額</div><div class="form_Normal"><c:out value="${route1.amount}" default="1,000円"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">金額（1ヶ月参考値）</div><div class="form_Normal"><c:out value="${route1.amountMonthly}" default="5,000円"/></div></div>
    </div>

    <!-- 通勤経路② -->
    <div class="content_Form2">
      <div class="form_Title2">
        <div>通勤経路②</div>
        <div class="edit-btn" onclick="location.href='<c:url value="/hiwariKinmuchi/route2/edit"/>'"></div>
      </div>
      <div class="form_Text1 twoCol"><div class="form_Column">通勤手段</div><div class="form_Normal"><c:out value="${route2.transport}" default="電車"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">経路</div><div class="form_Normal"><c:out value="${route2.route}" default="新九千交差点 → 新九千駅"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">出勤日数</div><div class="form_Normal"><c:out value="${route2.workDays}" default="5日間"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">片道料金</div><div class="form_Normal"><c:out value="${route2.oneWayFee}" default="—"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">金額</div><div class="form_Normal"><c:out value="${route2.amount}" default="1,000円"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">金額（1ヶ月参考値）</div><div class="form_Normal"><c:out value="${route2.amountMonthly}" default="85,000円"/></div></div>
    </div>

    <!-- 申請情報 -->
    <div class="content_Form1">
      <div class="form_Text1 twoCol"><div class="form_Column">申請区分</div><div class="form_Normal"><c:out value="${apply.kind}" default="日割"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">申請理由</div><div class="form_Normal"><c:out value="${apply.reason}" default="りゆうりゆう"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">申請期間</div><div class="form_Normal"><c:out value="${apply.periodText}" default="2013/09/26 ～ 2013/09/30"/></div></div>
      <div class="form_Text1 twoCol"><div class="form_Column">出勤日数</div><div class="form_Normal"><c:out value="${apply.workDays}" default="4日間"/></div></div>
    </div>

    <!-- 金額合計 -->
    <div class="content_Form1">
      <div class="form_Text1 twoCol"><div class="form_Column">金額合計</div><div class="form_Normal"><c:out value="${apply.totalAmount}" default="3,600円"/></div></div>
    </div>

    <!-- アップロード -->
    <div class="content_Form1">
      <div class="form_Text1 twoCol">
        <div class="form_Column">アップロード</div>
        <div class="form_Normal">
          <form action="<c:url value='/hiwariKakunin/upload'/>" method="post" enctype="multipart/form-data">
            <input type="text" id="uploadName" readonly style="width:280px;">
            <button type="button" onclick="document.getElementById('uploadFile').click();">参照</button>
            <input type="file" id="uploadFile" name="evidence" style="display:none"
                   onchange="document.getElementById('uploadName').value=this.files.length?this.files[0].name:'';">
            <button type="submit">アップロード</button>
          </form>
          <div class="note-sm">
            ※定期券を購入している場合は、定期券のコピーをアップロードしてください。
          </div>
        </div>
      </div>
    </div>

    <!-- 하단 버튼 -->
    <div class="button_Left mt24">
      <div class="button_Left_Group">
        <a href="<c:url value='/hiwariKinmuchi'/>">
          <img src="/resources/img/back_btn01.gif" alt="戻る">
        </a>
        <form action="<c:url value='/hiwariKakunin/save'/>" method="post" style="display:inline;">
          <button type="submit" style="border:0;background:transparent;">
            <img src="/resources/img/shinsei_btn01.gif" alt="申請">
          </button>
        </form>
        <form action="<c:url value='/hiwariKakunin/submit'/>" method="post" style="display:inline;">
          <button type="submit" style="border:0;background:transparent;">
            <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
          </button>
        </form>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</div>
</body>
</html>
