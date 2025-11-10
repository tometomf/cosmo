<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/main.css">
<style>
		#form_Text3 {
		display: grid;
		grid-template-columns: 1fr 2fr;
		background: white;
	}
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class="subtitle">
					<div class="">付図書類更新 確認</div>
				</div>	
				<div>
					<div style="margin: 3%">下記内容で問題がなければ申請ボタンを押してください</div>
				</div>			
			</div>
			<div style = "display: flex; gap: 5px; width: 1010px; align-items: flex-start; justify-content: space-between; margin: auto;">
		            <div style="border: solid 1px #a0a0a0; width: 330px;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal">免許証コピー</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">免許証有効期限</div>
		                  <div class="form_Normal">2015/10/21</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">免許証番号</div>
		                  <div class="form_Normal">1234-5678-90</div>
		               </div>
		            </div>
		            <div style="border: solid 1px #a0a0a0; width: 330px;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal">車検書コピー</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車種</div>
		                  <div class="form_Normal">ベンツ</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">登録番号</div>
		                  <div class="form_Normal">1234-5678-90</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">排気量</div>
		                  <div class="form_Normal">3000cc</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車検有効期限</div>
		                  <div class="form_Normal">2014/12/24</div>
		               </div>
		            </div>
		            <div style="border: solid 1px #a0a0a0; width: 330px;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal">保険書コピー</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">保険満了日</div>
		                  <div class="form_Normal">2015/10/21</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">対人賠償</div>
		                  <div class="form_Normal">無制限</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">対物賠償</div>
		                  <div class="form_Normal">無制限</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">人身障害</div>
		                  <div class="form_Normal">無制限</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">搭乗者障害</div>
		                  <div class="form_Normal">無制限</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">等級</div>
		                  <div class="form_Normal">3級</div>
		               </div>
		            </div>
		         </div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>