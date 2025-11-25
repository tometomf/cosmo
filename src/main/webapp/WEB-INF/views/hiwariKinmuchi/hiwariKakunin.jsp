<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 유지희 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通勤マネージャー｜確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
/* 오른쪽 칸 전체를 세로정렬 박스로 강제 */
.form_Text1.twoCol .form_Normal {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}
.upload-top {
  display: flex;
  align-items: left;
  gap: 4px;
}
.upload-note {
  margin-top: 4px;
  white-space: normal;
}

  /* 화면 폭 고정 (가운데 정렬) */
  .page-width {
    width: 950px;
    margin: 0 auto;
  }

  /* ===== 確認画面: 테이블 왼쪽 정렬 ===== */
  .content_Form1,
  .content_Form2 {
    margin: 0 !important;           /* 모든 여백 제거 */
    margin-left: 0 !important;      /* 왼쪽 붙이기 */
    width: 100% !important;         /* 전체 너비 사용 */
  }

  /* 바로 이어지는 섹션들끼리만 여백 크게 */
  .content_Form1 + .content_Form1,
  .content_Form1 + .content_Form2,
  .content_Form2 + .content_Form1,
  .content_Form2 + .content_Form2 {
    margin-top: 24px !important;
  }

  /* 각 행을 2컬럼 그리드로 */
  .twoCol {
    display: grid;
    grid-template-columns: 180px 1fr;
  }

  /* 표 형태로 보이도록 셀 스타일 */
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

  .edit-btn {
    width: 24px;
    height: 24px;
    cursor: pointer;
  }

  .note-sm {
    font-size: .92rem;
    color: #666;
    margin-top: 4px;
  }

  .button_Left {
    margin-top: 20px;
  }
  .form_Text1.twoCol .form_Normal {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;  
}
  
</style>
</head>
<body>
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

      <!-- 通勤経路① -->
      <div class="content_Form2">
        <div class="form_Title2">
          <div>通勤経路①</div>
          <div class="edit-btn" onclick="location.href='<c:url value="/hiwariKinmuchi/edit"/>'"></div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">通勤手段</div>
          <div class="form_Normal">
            <c:out value="${route1.transport}" default="バス"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">経路</div>
          <div class="form_Normal">
            <c:out value="${route1.route}" default="新丸子交差点 → 新丸子駅"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">出勤日数</div>
          <div class="form_Normal">
            <c:out value="${route1.workDays}" default="5日間"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">片道料金</div>
          <div class="form_Normal">
            <c:out value="${route1.oneWayFee}" default="―"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">金額</div>
          <div class="form_Normal">
            <c:out value="${route1.amount}" default="1,000円"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">金額（1ヶ月参考値）</div>
          <div class="form_Normal">
            <c:out value="${route1.amountMonthly}" default="5,000円"/>
          </div>
        </div>
      </div>
<br>
      <!-- 通勤経路② -->
      <div class="content_Form2">
        <div class="form_Title2">
          <div>通勤経路②</div>
          <div class="edit-btn" onclick="location.href='<c:url value="/hiwariKinmuchi/route2/edit"/>'"></div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">通勤手段</div>
          <div class="form_Normal">
            <c:out value="${route2.transport}" default="電車"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">経路</div>
          <div class="form_Normal">
            <c:out value="${route2.route}" default="新丸子駅 → 中野坂上駅"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">出勤日数</div>
          <div class="form_Normal">
            <c:out value="${route2.workDays}" default="5日間"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">片道料金</div>
          <div class="form_Normal">
            <c:out value="${route2.oneWayFee}" default="―"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">金額</div>
          <div class="form_Normal">
            <c:out value="${route2.amount}" default="2,500円"/>
          </div>
        </div>
        <div class="form_Text1 twoCol">
          <div class="form_Column">金額（1ヶ月参考値）</div>
          <div class="form_Normal">
            <c:out value="${route2.amountMonthly}" default="13,000円"/>
          </div>
        </div>
      </div>

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

      <!-- アップロード 영역 -->
<div class="content_Form1">

  <div class="form_Text1 twoCol">
    <!-- 왼쪽: 라벨 -->
    <div class="form_Column" style="display:flex; align-items:center;">
      アップロード
    </div>

    <!-- 오른쪽: 업로드 + 안내문 한 박스 안에 -->
    <div class="form_Normal">
      <!-- 위: 업로드줄 -->
      <div class="upload-top">
        <input type="text" id="uploadName" readonly style="width:180px;">
        <button type="button"
                onclick="document.getElementById('uploadFile').click();">参照</button>
        <button type="button">アップロード</button>
        <input type="file" id="uploadFile" name="evidence" style="display:none"
               onchange="document.getElementById('uploadName').value=this.files[0].name;">
      </div>

      <!-- 아래: 안내문 -->
      <div class="upload-note">
        ※定期券を購入している場合は、定期券コピーをアップロードしてください。
      </div>
    </div>
  </div>

</div>

      <br>
      <!-- 버튼 영역 -->
      <div class="button_Left">
        <div class="button_Left_Group">
          <a href="<c:url value='/hiwariKinmuchi/keiro'/>">
			 <img src="/resources/img/back_btn01.gif" alt="戻る">
			 </a>
       
    <form id="submitForm" method="post" action="<c:url value='/hiwariKakunin/submit'/>" style="display:inline;">
      <a href="javascript:void(0);" onclick="document.getElementById('submitForm').submit();">
        <img src="/resources/img/shinsei_btn01.gif" alt="申請へ">
      </a>
    </form>

           <!-- 一時保存: JS 호출 -->
          <a href="javascript:void(0);" onclick="saveTempFromKakunin();">
            <img src="/resources/img/hozon_btn01.gif" alt="一時保存">
          </a>
        </div>
      </div>

      <br><br><br>
 
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>
  </div>
</div>

<script type="text/javascript">
  /**
   * Kakunin 화면에서 보여지는 값을 JSON으로 묶어서
   * /hiwariKinmuchi/tempSave (POST)로 보내는 함수
   */
  function saveTempFromKakunin() {
    var data = {
      emp: {
        no:        "${emp.no}",
        name:      "${emp.name}",
        workplace: "${emp.workplace}",
        address:   "${emp.address}"
      },
      route1: {
        transport:     "${route1.transport}",
        route:         "${route1.route}",
        workDays:      "${route1.workDays}",
        oneWayFee:     "${route1.oneWayFee}",
        amount:        "${route1.amount}",
        amountMonthly: "${route1.amountMonthly}"
      },
      route2: {
        transport:     "${route2.transport}",
        route:         "${route2.route}",
        workDays:      "${route2.workDays}",
        oneWayFee:     "${route2.oneWayFee}",
        amount:        "${route2.amount}",
        amountMonthly: "${route2.amountMonthly}"
      },
      apply: {
        kind:        "${apply.kind}",
        reason:      "${apply.reason}",
        periodText:  "${apply.periodText}",
        workDays:    "${apply.workDays}",
        totalAmount: "${apply.totalAmount}"
      }
    };

    var form = document.createElement("form");
    form.method = "POST";
    form.action = "<c:url value='/hiwariKinmuchi/tempSave'/>";

    var jsonInput = document.createElement("input");
    jsonInput.type = "hidden";
    jsonInput.name = "commuteJson";
    jsonInput.value = JSON.stringify(data);
    form.appendChild(jsonInput);

    var actionInput = document.createElement("input");
    actionInput.type = "hidden";
    actionInput.name = "actionUrl";
    actionInput.value = "/hiwariKakunin/kakunin";
    form.appendChild(actionInput);

    document.body.appendChild(form);
    form.submit();
  }
</script>

</body>
</html>