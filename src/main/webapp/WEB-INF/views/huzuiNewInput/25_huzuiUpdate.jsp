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
		#form_Text4 {
		display: grid;
		grid-template-columns: 1fr 2fr 1fr 2fr;
		background: white;
	}
		#form_Text5 {
		display: grid;
		grid-template-columns: 1fr 5fr;
		background: white;
	}
	.form_Text2 > div{
		padding:5px;
		font-size:13px;
		
	}
	
	
</style>
<body>
	<div class = "layout">
		<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
		<div class = "main">
			<div class = "main_title">
				<div class="subtitle">付図書類更新 確認</div>
			</div>	
			<div class = "main_Content">
				下記内容で問題がなければ申請ボタンを押してください
			</div>			
			
			
			<div class="content_Form1">
	               <div class="form_Text2" id="form_Text4">
	                  <div class="form_Column">社員番号</div>
	                  <div class="form_Normal">${shain.shain_Uid}</div>
	                   <div class="form_Column">社員名</div>
	                  <div class="form_Normal">${shain.shain_Nm}</div>
	               </div>
	               <div class="form_Text1" id="form_Text5">
	                  <div class="form_Column">申請部分</div>
	                  <div class="form_Normal">期限更新</div>
	               </div>
			</div>
			
			
			
		<div class="multi_Form">	
			<div class="content_Form1" style="width:330px; margin:0;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal"><a href="">免許証コピー</a></div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">免許証有効期限</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.menkyo_Yuko_Kigen ? shainHuzuiShorui.menkyo_Yuko_Kigen : shainHuzui.menkyo_Yuko_Kigen}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">免許証番号</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.menkyo_No ? shainHuzuiShorui.menkyo_No : shainHuzui.menkyo_No}</div>
		               </div>
		    </div>
		    
		    
		    
		    <div class="content_Form1" style="width:330px;margin:0;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal"><a href="">車検書コピー</a></div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車種</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.shashu ? shainHuzuiShorui.shashu : shainHuzui.shashu}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">ナンバー</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.toroku_No.trim() ? shainHuzuiShorui.toroku_No : shainHuzui.toroku_No}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">排気量</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.haikiryo ? shainHuzuiShorui.haikiryo : shainHuzui.haikiryo}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車検有効期限</div>
		                  <div class="form_Normal" style="color: red;">${not empty shainHuzuiShorui.shaken_Yuko_Kigen ? shainHuzuiShorui.shaken_Yuko_Kigen : shainHuzui.shaken_Yuko_Kigen}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">燃費</div>
		                  <div class="form_Normal" style="color: red;"></div>
		               </div>
		     </div>
		            
		            
	            
	       <div class="content_Form1" style="width:330px; margin:0;">      
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">付随書類</div>
	                  <div class="form_Normal">保険書コピー(期間)</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">付随書類</div>
	                  <div class="form_Normal">保険書コピー(賠償内容)</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">保険満了日</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.hoken_Manryo_Ymd ? shainHuzuiShorui.hoken_Manryo_Ymd : shainHuzui.hoken_Manryo_Ymd}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">対人賠償</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.taijin_Baisho ? shainHuzuiShorui.taijin_Baisho : shainHuzui.taijin_Baisho}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">対物賠償</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.taibutsu_Baisho ? shainHuzuiShorui.taibutsu_Baisho : shainHuzui.taibutsu_Baisho}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">人身障害</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.jinshin_Shogai ? shainHuzuiShorui.jinshin_Shogai : shainHuzui.jinshin_Shogai}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">搭乗者障害</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.tojosha_Shogai ? shainHuzuiShorui.tojosha_Shogai : shainHuzui.tojosha_Shogai}</div>
	               </div>
	                 <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">等級</div>
	                  <div class="form_Normal">${not empty shainHuzuiShorui.tokyu ? shainHuzuiShorui.tokyu : shainHuzui.tokyu}</div>
	               </div>
	            </div>
	         </div>
		         
		         
		         <div class = "button_Left_Group" style="margin:3%">   
					<a href="javascript:history.back()"><img src="/resources/img/back_btn01.gif" alt="back_btn01"></a> 
					<img src="/resources/img/shinsei_btn01.gif" alt="shinsei_btn01">
				</div>
			</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>