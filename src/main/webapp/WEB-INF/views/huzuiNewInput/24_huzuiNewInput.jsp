<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

</head>

 <style>
.form_Text1 > div {
	min-width: 25px;
	text-align: left;
	padding: 5px;
	font-size: 13px;
	align-items: center;
	display:flex;
}
	#form_Text1 {
		display: grid;
		grid-template-columns: 1fr 2fr 2fr;
		background: white;
	}

	.member_input > input:first-child{
		margin-left: 70px;
	
	}

	.member_input > input{
		width:50px;
		margin-right:8px;
	}
	
	.input_form{
 		display : grid;
		border : solid 1px #ededed;
		margin:auto;	
		width:1040px;
		height:40px;
		grid-template-columns: 1fr 4fr 4fr;	
	}
	.input_form > div{
		align-items: center;
		padding: 5px;
	}
	
	
	.input_form  input{
		margin-left:5px;
	}
	.input_form input[type="text"]:last-child{
		width:500px;

	}
	.input_container{
		display:grid;
		gap:5px;
		margin:auto;
		width:1040px;
	}
	.item_head{
		text-align:center;
		background-color: #dddddd;
		font-size:13px;
		padding:5px;
	}
	.content_Form2{
		background:#ededed;
	}
	
	.content_container{
		margin:auto;
		width:1040px;
		padding-top:15px;
		padding-bottom:15px;
		display:grid;
		background:#ededed;
		gap:20px;
	}
	
input[type="file"] {
    display: none; /* 기본 파일 입력 요소를 숨깁니다 */
}
.form_Normal > img {
	left: 5px;
	display: block; 
    position: relative;
    top:1px;
}


 </style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class="subtitle">
					付図書類更新 入力
				</div>			
			</div>

		<div class = "main_Content">
			<div>付随書類の更新内容を入力してください</div>
		</div>	


	<form action="/huzuiNewInput/updateForm" method="post" id="shainForm" enctype="multipart/form-data">	
		<div class="content_container">
			<div class="content_Form2">
				<div class="form_Title2">
					<div>免許証</div>
					<div style="display: flex; gap: 5px; cursor: pointer;">
						<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
						<div class="toggleBtn" data-target="henkou1">変更する</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">免許証コピー</div>
					<div class = "form_Normal"><c:if test="${not empty shainHuzuiShorui.file_Uid_4}"><a href="/huzuiNewInput/downloadFile?fileUid=${shainHuzuiShorui.file_Uid_4}">表示</a> <img class="clearBox" alt="ゴミ箱" src="/resources/img/clear_icon.gif"></c:if></div>
					<div class = "form_Normal henkou1"><input type="text" id="file-name-display1" name="file_Uid_4" readonly>　<input type="file" name="uploadedFiles" id="file1" class="custom-file-upload"><input type="button" value="参照" class="file-select-button" data-target="file1">　<input type="button" value="アップロード" class="upload-btn"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">免許証有効期限</div>
					<div class = "form_Normal" style="display:grid" id="menkyoKigen">
							<div class="newInput1">${shainHuzuiShorui.menkyo_Yuko_Kigen}</div>
					</div>
					<div class = "form_Normal henkou1"><input id="menkyoKigenInput" type="text" style="width:250px" name="menkyo_Yuko_Kigen" readonly> <img class="calendar-icon" src="/resources/img/cal_icon.gif">
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">免許証番号</div>
					<div class = "form_Normal">${shainHuzuiShorui.menkyo_No}</div>
					<div class = "form_Normal henkou1"><input type="text" style="width:250px" name="menkyo_No"></div>
				</div>
			</div>
			
			
				
			<div class="content_Form2">
				<div class="form_Title2">
					<div>車検証</div>
					<div style="display: flex; gap: 5px; cursor: pointer;">
						<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
						<div class="toggleBtn" data-target="henkou2">変更する</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">車検証コピー</div>
					<div class = "form_Normal"><c:if test="${not empty file.fileName2}"><a href="/huzuiNewInput/downloadFile?fileUid=${shainHuzuiShorui.file_Uid_5}">表示</a> <img class="clearBox" alt="ゴミ箱" src="/resources/img/clear_icon.gif"></c:if></div>
					<div class = "form_Normal henkou2"><input type="text"  id="file-name-display2" name="file_Uid_5" readonly>　<input  name="uploadedFiles" type="file" id="file2" class="custom-file-upload"><input type="button" value="参照" class="file-select-button" data-target="file2">　<input type="button" value="アップロード" class="upload-btn"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">車種</div>
					<div class = "form_Normal">${shainHuzuiShorui.shashu}</div>
					<div class = "form_Normal henkou2"><input type="text" style="width:250px" name="shashu"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">ナンバー</div>
					<div class = "form_Normal">${shainHuzuiShorui.toroku_No}</div>
					<div class = "form_Normal henkou2" style="display:grid">
						<div class="member_input">
							<input type="text" name="torokuParts"><input type="text" name="torokuParts"><input type="text" name="torokuParts"><input type="text" name="torokuParts">
							<input type="hidden" name="toroku_No" id="toroku_No">
						</div>
						<div >
							（記入例）　　 品川 　　　300　　　 い　　　１１１１
						</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">排気量</div>
					<div class = "form_Normal">${shainHuzuiShorui.haikiryo}</div>
					<div class = "form_Normal henkou2"><input type="number" style="width:250px" name="haikiryo"><div>㏄</div></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">車検有効期限</div>
					<div class = "form_Normal" style="display:grid" id="shakenKigen">
							<div class="newInput2">${shainHuzuiShorui.shaken_Yuko_Kigen}</div>
					</div>
					<div class = "form_Normal henkou2"><input id="shakenKigenInput" type="text" style="width:250px" name="shaken_Yuko_Kigen" readonly> <img  src="/resources/img/cal_icon.gif" class="calendar-icon"></div>
				</div>
			</div>
			
			
		
			<div class="content_Form2">
					<div class="form_Title2">
						<div>保険証券</div>
						<div style="display: flex; gap: 5px; cursor: pointer;">
							<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
							<div class="toggleBtn" data-target="henkou3">変更する</div>
						</div>
					</div>
					<div class="form_Text0" style="border:0px;  margin:10px 10px;">
						※保険証券コピーは、 満了日の記載部分と、賠償額の記載部分が両方確認できるようにアップロードしてください。
					</div>
					<div class="form_Text1" id="form_Text1" style="border:solid 1px #a0a0a0; border-bottom:none;">
						<div class="form_Column">保険証券コピー（期間）</div>
						<div class = "form_Normal"><c:if test="${not empty file.fileName3}"><a href="/huzuiNewInput/downloadFile?fileUid=${shainHuzuiShorui.file_Uid_6}">表示</a> <img class="clearBox" alt="ゴミ箱" src="/resources/img/clear_icon.gif"></c:if></div>
						<div class = "form_Normal henkou3"><input type="text" id="file-name-display3" name="file_Uid_6" readonly>　<input name="uploadedFiles"  type="file" id="file3" class="custom-file-upload"><input type="button" value="参照"  class="file-select-button" data-target="file3">　<input type="button" value="アップロード" class="upload-btn"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">保険証券コピー（賠償内容）</div>
						<div class = "form_Normal"><c:if test="${not empty file.fileName4}"><a href="/huzuiNewInput/downloadFile?fileUid=${shainHuzuiShorui.file_Uid_7}">表示</a> <img class="clearBox" alt="ゴミ箱" src="/resources/img/clear_icon.gif"></c:if></div>
						<div class = "form_Normal henkou3"><input type="text" id="file-name-display4" name="file_Uid_7" readonly>　<input name="uploadedFiles"  type="file" id="file4" class="custom-file-upload"><input type="button" value="参照"  class="file-select-button" data-target="file4">　<input type="button" value="アップロード" class="upload-btn"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column" style="">保険満了日</div>
						<div class = "form_Normal" style="display:grid" id="hokenKigen">
							<div class="newInput3">${shainHuzuiShorui.hoken_Manryo_Ymd}</div>
						</div>
						<div class = "form_Normal henkou3"><input id="hokenKigenInput" type="text" style="width:250px" name="hoken_Manryo_Ymd" readonly> <img class="calendar-icon" src="/resources/img/cal_icon.gif"></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対人賠償</div>
						<div class = "form_Normal">${shainHuzuiShorui.taijin_Baisho}</div>
						<div class = "form_Normal henkou3"><input type="number" style="width:250px" name="taijin_Baisho"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対物賠償</div>
						<div class = "form_Normal">${shainHuzuiShorui.taibutsu_Baisho}</div>
						<div class = "form_Normal henkou3"><input type="number" style="width:250px" name="taibutsu_Baisho"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">人身障害</div>
						<div class = "form_Normal">${shainHuzuiShorui.jinshin_Shogai}</div>
						<div class = "form_Normal henkou3"><input type="number" style="width:250px" name="jinshin_Shogai"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">搭乗者障害</div>
						<div class = "form_Normal">${shainHuzuiShorui.tojosha_Shogai}</div>
						<div class = "form_Normal henkou3"><input type="number" style="width:250px" name="tojosha_Shogai"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">等級</div>
						<div class = "form_Normal">${shainHuzuiShorui.tokyu}</div>
						<div class = "form_Normal henkou3"><input type="number" style="width:250px" name="tokyu" ><div>等級</div></div>
					</div>
			</div>
		</div>
		
		
	<div class="input_container">	
		
		<div style="margin-left:700px">コメント入力欄</div>
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${file.etcFileName1}" name="etc_File_Uid_1"  id="file-name-display5" readonly><input name="uploadedFiles" type="file" id="file5" class="custom-file-upload"> <input type="button" value="参照" class="file-select-button" data-target="file5"> <input type="button" value="アップロード" class="upload-btn">
			</div>
			<div>
				<input type="text" name="etc_Comment_1" value="${shainHuzuiShorui.etc_Comment_1}">
			</div>
		</div>
		
				
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${file.etcFileName2}" name="etc_File_Uid_2"  id="file-name-display6" readonly><input name="uploadedFiles" type="file" id="file6" class="custom-file-upload"> <input type="button" value="参照" class="file-select-button" data-target="file6"> <input type="button" value="アップロード" class="upload-btn">
			</div>
			<div>
				<input type="text" name="etc_Comment_2" value="${shainHuzuiShorui.etc_Comment_2}">
			</div>
		</div>		
		
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${file.etcFileName3}" name="etc_File_Uid_3"  id="file-name-display7" readonly><input name="uploadedFiles" type="file" id="file7" class="custom-file-upload"> <input type="button" value="参照" class="file-select-button" data-target="file7"> <input type="button" value="アップロード" class="upload-btn">
			</div>
			<div>
				<input type="text" name="etc_Comment_3" value="${shainHuzuiShorui.etc_Comment_3}">
			</div>
		</div>	
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${file.etcFileName4}" name="etc_File_Uid_4"  id="file-name-display8" readonly><input name="uploadedFiles" type="file" id="file8" class="custom-file-upload"> <input type="button" value="参照" class="file-select-button" data-target="file8"> <input type="button" value="アップロード" class="upload-btn">
			</div>
			<div>
				<input type="text" name="etc_Comment_4" value="${shainHuzuiShorui.etc_Comment_4}">
			</div>
		</div>	
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${file.etcFileName5}" name="etc_File_Uid_5"  id="file-name-display9" readonly> <input name="uploadedFiles" type="file" id="file9" class="custom-file-upload"><input type="button" value="参照" class="file-select-button" data-target="file9"> <input type="button" value="アップロード" class="upload-btn">
			</div>
			<div>
				<input type="text" name="etc_Comment_5" value="${shainHuzuiShorui.etc_Comment_5}">
			</div>
		</div>
	</div>
	</form>	
		<div class = "button_Left_Group" style="margin-top:30px; margin:3%;">   
			<a href="javascript:history.back()"><img src="/resources/img/back_btn01.gif" alt="back_btn01"></a> 
			<a href="#" id="next"><img src="/resources/img/next_btn01.gif" alt="next_btn01"></a>
			<a href="#" id="hozon"><img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01"></a>
		</div>
	</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>	
</body>
<script type="text/javascript">

	const menkyoKigen = "<c:out value='${shainHuzuiShorui.menkyo_Yuko_Kigen}' />";
	const menkyoKigenBox = document.getElementById("menkyoKigen");
	
	const shakenKigen = "<c:out value='${shainHuzuiShorui.shaken_Yuko_Kigen}' />";
	const shakenKigenBox = document.getElementById("shakenKigen");
	
	const hokenKigen = "<c:out value='${shainHuzuiShorui.hoken_Manryo_Ymd}' />";
	const hokenKigenBox = document.getElementById("hokenKigen");
	
	 $(function(){
	$("#menkyoKigenInput, #shakenKigenInput, #hokenKigenInput").datepicker({
	    dateFormat : 'y/mm/dd',
	    showButtonPanel : true,
	    changeMonth : true,
	    changeYear : true
	});
	
	$(".calendar-icon").each(function(index) {
	    $(this).on("click", function() {
	    	$("#" + (index === 0 ? "menkyoKigenInput" : index === 1 ? "shakenKigenInput" : "hokenKigenInput"))
	        .datepicker("show");
	    });
	});
	});
	
	// 페이지 로딩 시 함수 호출
	function kigen(value,boxValue){
		
	    const now = new Date();
		 // 1. 연도, 월, 일 분리
		 const [yy, mm, dd] = value.split("-");
	
		 // 2. 연도 보정 (예: 2000년대 기준)
		 const fullYear = Number(yy) < 50 ? 2000 + Number(yy) : 1900 + Number(yy);
	
		 // 3. Date 객체 생성 (월은 0~11)
		 const dateValue = new Date(fullYear, Number(mm) - 1, Number(dd));
	
	    const oneMonthBefore = new Date(dateValue);
	    oneMonthBefore.setMonth(oneMonthBefore.getMonth() - 1);
	    
	    
	    if(!value){
	    	return;
	    }
	    
	    
	    if(dateValue < now){
	        const newDiv = document.createElement("div");
	    	newDiv.innerHTML = "<div style='color:red;'>※期限が切れました。</div>";
	    	boxValue.appendChild(newDiv);
	    } else if(now < oneMonthBefore) {
	    } else {
	    	const newDiv = document.createElement("div");
	    	newDiv.innerHTML = "<div style='color:red;'>※まもなく期限が切れます。</div>";
	    	boxValue.appendChild(newDiv);
	    }
	    
	}
	
	kigen(menkyoKigen,menkyoKigenBox);
	
	kigen(shakenKigen,shakenKigenBox);
	
	kigen(hokenKigen,hokenKigenBox);
	
	
	function toggleOpacity(targetSelector) {
		  const targets = document.querySelectorAll('.' + targetSelector + ' > *');
		  targets.forEach(target => {
		    if (target.style.opacity === '0' || target.style.opacity === '') {
		      target.style.opacity = '1';
		    } else {
		      target.style.opacity = '0';
		    }
		  });
		}
		
		// 버튼에 클릭 이벤트 등록
		document.querySelectorAll('.toggleBtn').forEach(btn => {
		  btn.addEventListener('click', () => {
		    const targetSelector = btn.dataset.target; // data-target에서 선택자 가져오기
		    toggleOpacity(targetSelector);
		  });
		});
	
		
		
		document.addEventListener('DOMContentLoaded', () => {
			  const mapping = [
			    { input: 'newInput1', henkou: 'henkou1' },
			    { input: 'newInput2', henkou: 'henkou2' },
			    { input: 'newInput3', henkou: 'henkou3' }
			  ];

			  mapping.forEach(item => {
			    const inputElements = document.getElementsByClassName(item.input);
			    if (inputElements.length === 0) return;
				
			  	
			    const inputEl = inputElements[0];
			    const hasValue = inputEl.value !== undefined
			      ? inputEl.value.trim() !== ""
			      : inputEl.innerText.trim() !== "";

			    
			    if (hasValue) {
			      const henkouElements = document.getElementsByClassName(item.henkou);
			      Array.from(henkouElements).forEach(parentEl => {
			        // 부모 요소는 그대로 두고 자식 요소만 opacity 0
			        Array.from(parentEl.children).forEach(child => {
			          child.style.opacity = '0';
			        });
			      });
			    }
			  });
			});
		
		
		document.getElementById("next").addEventListener("click", function(e) {
			
			e.preventDefault(); // a 태그 링크 이동 막기

		    const inputs = document.getElementsByName("torokuParts");
		    const torokuParts = Array.from(inputs).map(input => input.value);

		    const toroku_No = torokuParts.join(" ");
		    document.getElementById("toroku_No").value = toroku_No;
		    
		    const formElements = document.getElementById("shainForm").elements;
		    
		    // 3. file_Uid_X 패턴을 가진 필드를 찾아 값을 초기화합니다.
		    for (let i = 0; i < formElements.length; i++) {
		        const element = formElements[i];
		        
		        // name이 'file_Uid_'로 시작하는 필드를 찾습니다.
		        if (element.name.startsWith("etc_File_Uid_") || element.name.startsWith("file_Uid_")) {
		            
		          
		                element.value = ""; 
		            }
		            
		        } 
		    
			document.getElementById("shainForm").submit();
		});
		
		

		document.addEventListener("DOMContentLoaded", function () {

		    document.querySelectorAll(".file-select-button").forEach(function (button) {

		        const fileInputId = button.dataset.target;
		        const fileInput = document.getElementById(fileInputId);
		        const fileNameDisplay = document.getElementById("file-name-display" + fileInputId.slice(-1));

		        // 파일 선택 버튼 클릭 → 숨겨진 파일 input 실행
		        button.addEventListener("click", function (event) {
		            event.preventDefault();
		            fileInput.click();
		        });

		        // 파일 선택되면 → 이름 표시 + 자동 업로드까지 실행
		        fileInput.addEventListener("change", function (event) {

		            const file = event.target.files[0];
		            if (!file) {
		                fileNameDisplay.value = "ファイルが選択されていません。";
		                return;
		            }

		            // 파일 이름 표시
		            //fileNameDisplay.value = file.name;

		            // 업로드 버튼 로직 가져와서 자동 실행
		            const container = button.closest(".form_Normal") ? button.closest(".form_Normal") : button.closest(".input_form");
		            const fileNameput = container.querySelector("input[type='text']");
		            const fileNameUp = fileNameput.name.toUpperCase();
		            const wrapper = button.closest(".form_Text1") ? button.closest(".form_Text1") : container;
		            const textElement = wrapper.querySelector(".form_Column")
		                ? wrapper.querySelector(".form_Column")
		                : wrapper.querySelector(".item_head");

		            const fileDescription = textElement.textContent.trim();

		            // 업로드
		            let formData = new FormData();
		            formData.append("file", file);
		            formData.append("fileNo", fileDescription);
		            formData.append("fileName", fileNameUp);

		            fetch('/huzuiNewInput/upload', {
		                method: 'POST',
		                body: formData
		            })
		                .then(response => {
		                    if (!response.ok) throw new Error('파일 업로드 실패');
		                    return response.json();
		                })
		                .then(data => {
		                    //alert("ファイルをアップロードしました");

		                    // UID hidden field 업데이트
		                    const uploadFieldName = fileNameput.name;
		                    const uidHiddenField = document.querySelector('input[name="' + uploadFieldName + '"]');
		                    uidHiddenField.value = data.uid;

		                })
		                .catch(error => {
		                    alert("アップロードに失敗しました");
		                    console.error(error);
		                });
		        });

		    });

		});

		document.querySelectorAll(".upload-btn").forEach(function(button){
			
		
			button.addEventListener("click", function(){
				const container = button.closest(".form_Normal") ? button.closest(".form_Normal"): button.closest(".input_form"); // 같은 div 안
		        const fileInput = container.querySelector("input[type='file']");
		        const fileNameput = container.querySelector("input[type='text']");
		        const fileNameUp = fileNameput.name.toUpperCase();
		        const wrapper = button.closest(".form_Text1") ? button.closest(".form_Text1") : container; 
		        // ⭐ 2. 텍스트를 포함하는 요소(.form_Column)를 찾습니다.
		        const textElement = wrapper.querySelector(".form_Column") ? wrapper.querySelector(".form_Column") : wrapper.querySelector(".item_head");
		       
		        const fileDescription = textElement.textContent.trim();
		        const file = fileInput.files[0];
		        if (!file) { alert("ファイルを選択してください"); return; }
		        
		        alert("ファイルをアップロードしました");
		        return;
		        
		    if(file){
		        var formData = new FormData();
		        formData.append("file", file);
		        formData.append("fileNo", fileDescription);
		        formData.append("fileName", fileNameUp);
		        fetch('/huzuiNewInput/upload', {
		            method : 'POST',
		            body : formData
		        })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('파일 업로드 실패');
		            }
		            return response.json(); // 응답을 JSON으로 파싱
		        })
		        .then(data => {
		            console.log("파일 업로드 성공:", data); // 성공적인 업로드 후 데이터 처리
		            alert("ファイルをアップロードしました");
		            const uploadFieldName = fileNameput.name;
		            const newUid = data.uid; 
		            const uidHiddenField = document.querySelector('input[name="' + uploadFieldName + '"]'); 
		            uidHiddenField.value = newUid;
		           	console.log(uidHiddenField);
		            
		        })
		        .catch(error => {
		            console.error("파일 업로드 실패:", error); // 실패 시 오류 처리
		            alert("アップロードに失敗しました");
		        });
		    } else {
		        alert('파일을 선택해주세요');
		    }
		});
		});
		
		document.getElementById("hozon").addEventListener("click", function(e){
		        
			e.preventDefault(); // a 태그 링크 이동 막기
			
		    const formData = new FormData(document.getElementById("shainForm"));
		    const dtoData = {};
			
		    const fileUidKeys = ["file_Uid_1", "file_Uid_2", "file_Uid_3", "file_Uid_4","file_Uid_5","file_Uid_6","file_Uid_7","etc_File_Uid_1","etc_File_Uid_2","etc_File_Uid_3","etc_File_Uid_4","etc_File_Uid_5"];
		    const integerKeys = ["tokyu", "haikiryo"];
		    
		    // FormData 전체를 반복하며 기본 필드와 숫자 필드를 분리 처리
		    formData.forEach((rawValue, key) => {

		    	 if (typeof rawValue === "string") {
		    	        value = rawValue.trim();
		    	    }
		    	
		        // 2. 숫자가 필요한 필드 (UID, 등급, 배기량 등) 처리
		         if (fileUidKeys.includes(key) || integerKeys.includes(key)) {

	            const num = Number(value);
	
	            if (value !== "" && !isNaN(num)) {
	                dtoData[key] = num;
	            } else {
	                dtoData[key] = null;
	            }
	
	       		} else {
	         	   // ⭐ 문자열 또는 파일 객체 그대로 저장
	            dtoData[key] = value;
	      		}
		    });
		    
		    
		        fetch('/huzuiNewInput/hozon', {
		        	method : 'POST',
					headers :{
						'Content-Type' : 'application/json'				
					},
					body : JSON.stringify(dtoData)
		        })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('HTTP error! status: ' + response.status);
		            }
		            return response.text(); // 응답을 JSON으로 파싱
		        })
		        .then(data => {
		            console.log("success", data); // 성공적인 업로드 후 데이터 처리
		            alert("保存しました");
		        })
		        .catch(error => {
		            console.error("error", error); // 실패 시 오류 처리
		        });
		});

		document.querySelectorAll(".clearBox").forEach(function(button){
			button.addEventListener("click",function(){
				
				 const container = button.closest(".form_Text1");				
				 const fileName = container.querySelector("input[type='text']");
			     const fNo = fileName.name.toUpperCase();
				 
		         const params = new URLSearchParams();
		         params.append("fileName", fNo);
			        
				
				
				 fetch('/huzuiNewInput/removeFile', {
			            method : 'POST',
			            body : params
			        })
			        .then(response => {
			            if (!response.ok) {
			                throw new Error('파일 업로드 실패');
			            }
			        })
			        .then(data => {
			            console.log("삭제 성공:", data); // 성공적인 업로드 후 데이터 처리
			            alert("削除しました");
			            location.reload();
			        })
			        .catch(error => {
			            console.error("파일 업로드 실패:", error); // 실패 시 오류 처리
			            alert("削除に失敗しました");
			        });
			})
		});
		
		
</script>
</html>