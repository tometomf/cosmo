<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
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
			
			
<div class="wrapper">
  <!-- 노란 경고 박스 -->
  <div class="warning_box">
    <span class="warning_label">【警告】</span>
    この申請は特例申請です
    <span class="warning_label">【警告】</span>
  </div>

  <!-- 안내문 박스 -->
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
</div>


<div class="confirm_box">
  <label>
    <input type="radio" name="agree" value="yes">
    <span class="underline_text">特例について内容を理解した上で申請します。</span>
  </label>
</div>


<div class="reason_wrapper">
  <div class="reason_label">特例申請理由</div>
  <div class="reason_field">
    <textarea class="reason_textarea"></textarea>
  </div>
</div>

<div class = "button_Center">
				<div class = "button_Center_Group">
					<div><img src="/resources/img/back_btn01.gif" alt="back_btn01"
						 style="cursor:pointer;" 
						 onclick="location.href='/idoconfirm/kakuninpage';"></div>
					<div><img src="/resources/img/shinsei_btn01.gif" alt="shinsei_btn01"></div>
				</div>
			</div>
	

			</div>
			
			<div></div>
			<div></div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	
</body>
</html>