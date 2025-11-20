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
		                  <div class="form_Normal" style="color: red;" id="menkyo_Yuko_Kigen">${not empty shainHuzui.menkyo_Yuko_Kigen ? shainHuzui.menkyo_Yuko_Kigen : shainHuzuiShorui.menkyo_Yuko_Kigen}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">免許証番号</div>
		                  <div class="form_Normal" style="color: red;" id="menkyo_No">${not empty shainHuzui.menkyo_No ? shainHuzui.menkyo_No : shainHuzuiShorui.menkyo_No}</div>
		               </div>
		    </div>
		    
		    
		    
		    <div class="content_Form1" style="width:330px;margin:0;">
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">付随書類</div>
		                  <div class="form_Normal"><a href="">車検書コピー</a></div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車種</div>
		                  <div class="form_Normal" style="color: red;" id="shashu">${not empty shainHuzui.shashu ? shainHuzui.shashu : shainHuzuiShorui.shashu}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">ナンバー</div>
		                  <div class="form_Normal" style="color: red;" id=toroku_No>${not empty shainHuzui.toroku_No.trim() ? shainHuzui.toroku_No : shainHuzuiShorui.toroku_No}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">排気量</div>
		                  <div class="form_Normal" style="color: red;" id="haikiryo">${not empty shainHuzui.haikiryo ? shainHuzui.haikiryo : shainHuzuiShorui.haikiryo}</div>
		               </div>
		               <div class="form_Text1" id="form_Text3">
		                  <div class="form_Column">車検有効期限</div>
		                  <div class="form_Normal" style="color: red;" id="shaken_Yuko_Kigen">${not empty shainHuzui.shaken_Yuko_Kigen ? shainHuzui.shaken_Yuko_Kigen : shainHuzuiShorui.shaken_Yuko_Kigen}</div>
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
	                  <div class="form_Normal" id="hoken_Manryo_Ymd">${not empty shainHuzui.hoken_Manryo_Ymd ? shainHuzui.hoken_Manryo_Ymd : shainHuzuiShorui.hoken_Manryo_Ymd}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">対人賠償</div>
	                  <div class="form_Normal" id="taijin_Baisho">${not empty shainHuzui.taijin_Baisho ? shainHuzui.taijin_Baisho : shainHuzuiShorui.taijin_Baisho}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">対物賠償</div>
	                  <div class="form_Normal" id="taibutsu_Baisho">${not empty shainHuzui.taibutsu_Baisho ? shainHuzui.taibutsu_Baisho : shainHuzuiShorui.taibutsu_Baisho}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">人身障害</div>
	                  <div class="form_Normal" id="jinshin_Shogai">${not empty shainHuzui.jinshin_Shogai ? shainHuzui.jinshin_Shogai : shainHuzuiShorui.jinshin_Shogai}</div>
	               </div>
	               <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">搭乗者障害</div>
	                  <div class="form_Normal" id="tojosha_Shogai">${not empty shainHuzui.tojosha_Shogai ? shainHuzui.tojosha_Shogai : shainHuzuiShorui.tojosha_Shogai}</div>
	               </div>
	                 <div class="form_Text1" id="form_Text3">
	                  <div class="form_Column">等級</div>
	                  <div class="form_Normal" id="tokyu">${not empty shainHuzui.tokyu ? shainHuzui.tokyu : shainHuzuiShorui.tokyu}</div>
	               </div>
	            </div>
	         </div>
		         
		         
		         <div class = "button_Left_Group" style="margin:3%">   
					<a href="javascript:history.back()"><img src="/resources/img/back_btn01.gif" alt="back_btn01"></a> 
					<a href="#" id="shincou"><img src="/resources/img/shinsei_btn01.gif" alt="shinsei_btn01"></a>
				</div>
			</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
<script type="text/javascript">


document.getElementById("shincou").addEventListener("click", function(e) {
	
	e.preventDefault(); // a 태그 링크 이동 막기
	
 	const file_Uid1 = document.getElementById("file_Uid1") ? document.getElementById("file_Uid1").innerText : null;
	const file_Uid2 = document.getElementById("file_Uid2") ? document.getElementById("file_Uid2").innerText : null;
	const file_Uid3= document.getElementById("file_Uid3") ? document.getElementById("file_Uid3").innerText : null;
	const file_Uid4= document.getElementById("file_Uid4") ? document.getElementById("file_Uid4").innerText : null;
	const file_Uid5= document.getElementById("file_Uid5") ? document.getElementById("file_Uid5").innerText : null;
	const menkyo_Yuko_Kigen= document.getElementById("menkyo_Yuko_Kigen") ? document.getElementById("menkyo_Yuko_Kigen").innerText : null;
	const menkyo_No= document.getElementById("menkyo_No") ? document.getElementById("menkyo_No").innerText : null;
	const shashu= document.getElementById("shashu") ? document.getElementById("shashu").innerText : null;
	const toroku_No= document.getElementById("toroku_No") ? document.getElementById("toroku_No").innerText : null;
	const haikiryo= document.getElementById("haikiryo") ? document.getElementById("haikiryo").innerText : null;
	const shaken_Yuko_Kigen= document.getElementById("shaken_Yuko_Kigen") ? document.getElementById("shaken_Yuko_Kigen").innerText : null;
	const hoken_Manryo_Ymd= document.getElementById("hoken_Manryo_Ymd") ? document.getElementById("hoken_Manryo_Ymd").innerText : null;
	const taijin_Baisho= document.getElementById("taijin_Baisho") ? document.getElementById("taijin_Baisho").innerText : null;
	const taibutsu_Baisho= document.getElementById("taibutsu_Baisho") ? document.getElementById("taibutsu_Baisho").innerText : null;
	const jinshin_Shogai= document.getElementById("jinshin_Shogai") ? document.getElementById("jinshin_Shogai").innerText  : null;
	const tojosha_Shogai= document.getElementById("tojosha_Shogai") ? document.getElementById("tojosha_Shogai").innerText : null;
	const tokyu= document.getElementById("tokyu") ? document.getElementById("tokyu").innerText : null;
	const add_User_Id= document.getElementById("add_Shain_Uid") ? document.getElementById("add_Shain_Uid").innerText : null;
	const add_Date= document.getElementById("add_Date") ? document.getElementById("add_Date").innerText: null;
	const upd_User_Id= document.getElementById("upd_Shain_Uid") ? document.getElementById("upd_Shain_Uid").innerText : null;
	const upd_Date= document.getElementById("upd_Date") ? document.getElementById("upd_Date").innerText : null;
			
	 const data = {
			 fileUid1: file_Uid1,
			 fileUid2: file_Uid2,
			 fileUid3: file_Uid3,
			 fileUid4: file_Uid4,
			 fileUid5: file_Uid5,
			 menkyoYukoKigen: menkyo_Yuko_Kigen,
			 menkyoNo: menkyo_No,
		     shashu: shashu,
		     torokuNo: toroku_No,
		     haikiryo: parseInt(haikiryo.trim()),
		     shakenYukoKigen:shaken_Yuko_Kigen,
		     hokenManryoYmd: hoken_Manryo_Ymd,
		     taijinBaisho:taijin_Baisho,
		     taibutsuBaisho: taibutsu_Baisho,
		     jinshinShogai:jinshin_Shogai,
		     tojoshaShogai: tojosha_Shogai,
		     tokyu: parseInt(tokyu.trim()),
		     addUserId: add_User_Id,
		     addDate: add_Date,
		     updUserId: upd_User_Id,
		     updDate: upd_Date
		    };
		console.log(data);


	fetch('/huzuiNewInput/shinseiFuzuiShorui',{
			method : 'POST',
			headers :{
				'Content-Type' : 'application/json'				
			},
			body : JSON.stringify(data)
	})
	.then(response => { // 💡 중괄호 시작! (함수 블록)
	    return response.json(); // 💡 response.json()을 명시적으로 반환
	})
	.then(data => {
			console.log("success:" + data)
	})
    .catch((error) => {
    		console.log("error:" + error)
    });

});


</script>
</html>