<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
 <style>

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


	<form action="/huzuiNewInput/updateForm" method="post" id="shainForm">	
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
					<div class = "form_Normal"><c:if test="${not empty file_Uid_4}"><a href="#">表示</a></c:if></div>
					<div class = "form_Normal henkou1"><input type="text" name="" id="file-name-display">　<input type="file" id="file" class="custom-file-upload"><input type="button" value="参照" id="file-select-button">　<input type="button" value="アップロード" id="upload-btn"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">免許証有効期限</div>
					<div class = "form_Normal" style="display:grid" id="menkyoKigen">
							<div class="newInput1">${shainHuzuiShorui.menkyo_Yuko_Kigen}</div>
					</div>
					<div class = "form_Normal henkou1"><input id="dateInputText" type="text" style="width:250px" name="menkyo_Yuko_Kigen"> <img id="dateIcon" src="/resources/img/cal_icon.gif"> <input id="hiddenDateInput" type="date" style="display:none;">
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
					<div class = "form_Normal"><c:if test="${not empty file_Uid_5}"><a href="#">表示</a></c:if></div>
					<div class = "form_Normal henkou2"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
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
					<div class = "form_Normal henkou2"><input type="text" style="width:250px" name="haikiryo"><div>㏄</div></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">車検有効期限</div>
					<div class = "form_Normal" style="display:grid" id="shakenKigen">
							<div class="newInput2">${shainHuzuiShorui.shaken_Yuko_Kigen}</div>
					</div>
					<div class = "form_Normal henkou2"><input type="text" style="width:250px" name="shaken_Yuko_Kigen"> <img src="/resources/img/cal_icon.gif"></div>
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
						<div class = "form_Normal"><c:if test="${not empty file_Uid_6}"><a href="#">表示</a></c:if></div>
						<div class = "form_Normal henkou3"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">保険証券コピー（賠償内容）</div>
						<div class = "form_Normal"><c:if test="${not empty file_Uid_7}"><a href="#">表示</a></c:if></div>
						<div class = "form_Normal henkou3"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column" style="">保険満了日</div>
						<div class = "form_Normal" style="display:grid" id="hokenKigen">
							<div class="newInput3">${shainHuzuiShorui.hoken_Manryo_Ymd}</div>
						</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="hoken_Manryo_Ymd"> <img src="/resources/img/cal_icon.gif"></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対人賠償</div>
						<div class = "form_Normal">${shainHuzuiShorui.taijin_Baisho}</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="taijin_Baisho"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対物賠償</div>
						<div class = "form_Normal">${shainHuzuiShorui.taibutsu_Baisho}</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="taibutsu_Baisho"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">人身障害</div>
						<div class = "form_Normal">${shainHuzuiShorui.jinshin_Shogai}</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="jinshin_Shogai"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">搭乗者障害</div>
						<div class = "form_Normal">${shainHuzuiShorui.tojosha_Shogai}</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="tojosha_Shogai"><div>万円</div></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">等級</div>
						<div class = "form_Normal">${shainHuzuiShorui.tokyu}</div>
						<div class = "form_Normal henkou3"><input type="text" style="width:250px" name="tokyu"><div>等級</div></div>
					</div>
			</div>
		</div>
	</form>	
		
	<div class="input_container">	
		
		<div style="margin-left:700px">コメント入力欄</div>
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${shainHuzuiShorui.etc_File_Uid_1}"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text" value="${shainHuzuiShorui.etc_Comment_1}">
			</div>
		</div>
		
				
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${shainHuzuiShorui.etc_File_Uid_2}"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text" value="${shainHuzuiShorui.etc_Comment_2}">
			</div>
		</div>		
		
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${shainHuzuiShorui.etc_File_Uid_3}"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text" value="${shainHuzuiShorui.etc_Comment_3}">
			</div>
		</div>	
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${shainHuzuiShorui.etc_File_Uid_4}"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text" value="${shainHuzuiShorui.etc_Comment_4}">
			</div>
		</div>	
		
		<div class="input_form">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text" value="${shainHuzuiShorui.etc_File_Uid_5}"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text" value="${shainHuzuiShorui.etc_Comment_5}">
			</div>
		</div>
	</div>		
		
		<div class = "button_Left_Group" style="margin-top:30px; margin:3%;">   
			<a href="javascript:history.back()"><img src="/resources/img/back_btn01.gif" alt="back_btn01"></a> 
			<a href="#" id="next"><img src="/resources/img/next_btn01.gif" alt="next_btn01"></a>
			<a href="#" id="hozon"><img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01"></a>
		</div>
	</div>
	
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>	
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

	const menkyoKigen = "<c:out value='${shainHuzuiShorui.menkyo_Yuko_Kigen}' />";
	const menkyoKigenBox = document.getElementById("menkyoKigen");
	
	const shakenKigen = "<c:out value='${shainHuzuiShorui.shaken_Yuko_Kigen}' />";
	const shakenKigenBox = document.getElementById("shakenKigen");
	
	const hokenKigen = "<c:out value='${shainHuzuiShorui.hoken_Manryo_Ymd}' />";
	const hokenKigenBox = document.getElementById("hokenKigen");
	
	const textInput = document.getElementById('dateInputText');
	const icon = document.getElementById('dateIcon');
	const hiddenDate = document.getElementById('hiddenDateInput');

	icon.addEventListener('click', () => {
	    // 숨겨진 date input 클릭
	    hiddenDate.click();
	});

	// date input 값이 바뀌면 기존 텍스트 인풋에 값 넣기
	hiddenDate.addEventListener('change', () => {
	    textInput.value = hiddenDate.value; // YYYY-MM-DD 형식
	});
	
	
	// 페이지 로딩 시 함수 호출
	function kigen(value,boxValue){
	    console.log("면허증 유효기간:", value);
	
	    const now = new Date();
	    const dateValue = new Date(value);
	    const oneMonthBefore = new Date(dateValue);
	    oneMonthBefore.setMonth(oneMonthBefore.getMonth() - 1);
	    
	    if(!value){
	    	console.log('기한 없음');
	    	return;
	    }
	    
	    
	    if(dateValue < now){
	        console.log("면허증 만료");
	        const newDiv = document.createElement("div");
	    	newDiv.innerHTML = "<div style='color:red;'>※期限が切れました。</div>";
	    	boxValue.appendChild(newDiv);
	    } else if(now < oneMonthBefore) {
	    	console.log("문제없음");
	    } else {
	    	console.log("기간 한달 미만");
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
				
			    console.log(inputElements);
			  	
			    const inputEl = inputElements[0];
			    const hasValue = inputEl.value !== undefined
			      ? inputEl.value.trim() !== ""
			      : inputEl.innerText.trim() !== "";

			    console.log(hasValue);
			    
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
		    
			document.getElementById("shainForm").submit();
		});
		
		

		// DOM이 완전히 로드된 후 실행
		document.addEventListener("DOMContentLoaded", function() {
		    // 파일 선택 버튼 클릭 시, 숨겨진 파일 입력 필드를 클릭하도록 합니다.
		    document.getElementById("file-select-button").addEventListener("click", function(event) {
		        event.preventDefault(); // 기본 동작 막기 (필요 시)
		        document.getElementById("file").click(); // 숨겨진 파일 입력 필드를 클릭
		    });

		    // 파일이 선택되면 선택된 파일 이름을 입력 텍스트 필드에 표시
		    document.getElementById("file").addEventListener("change", function(event) {
		        var selectedFile = event.target.files[0];
		        if (selectedFile) {
		            // 인풋 텍스트 필드에 선택된 파일의 이름을 표시
		            document.getElementById("file-name-display").value = "選択されたファイル: " + selectedFile.name;
		        } else {
		            // 파일이 선택되지 않았을 경우
		            document.getElementById("file-name-display").value = "ファイルが選択されていません。";
		        }
		    });
		});

		document.getElementById("upload-btn").addEventListener("click", function(event){
		    var fileInput = document.getElementById("file");
		    var file = fileInput.files[0];
		    
		    if(file){
		        var formData = new FormData();
		        formData.append("file", file);
		        
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
		        })
		        .catch(error => {
		            console.error("파일 업로드 실패:", error); // 실패 시 오류 처리
		        });
		    } else {
		        alert('파일을 선택해주세요');
		    }
		});
		
		document.getElementById("hozon").addEventListener("click", function(e){
		        
			e.preventDefault(); // a 태그 링크 이동 막기
			
		        fetch('/huzuiNewInput/hozon', {
		        	method : 'POST',
					headers :{
						'Content-Type' : 'application/json'				
					},
					body : JSON.stringify({})
		        })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('파일 업로드 실패');
		            }
		            return response.json(); // 응답을 JSON으로 파싱
		        })
		        .then(data => {
		            console.log("파일 업로드 성공:", data); // 성공적인 업로드 후 데이터 처리
		        })
		        .catch(error => {
		            console.error("파일 업로드 실패:", error); // 실패 시 오류 처리
		        });
		});


		
</script>
</html>