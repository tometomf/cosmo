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
	
	.zipcode {
  width: 50px;          /* 우편번호 입력칸 폭 줄이기 */
  
}
	
	.zipcode2 {
  width: 100%;
  box-sizing: border-box;
}
	
</style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class = "flow">
					<div class = "flow_current">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_others">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				<div class="subtitle">勤務地　入力</div>
			</div>
			
			
			
			<div class = "main">
			<!-- form 예제 -->
			<div>勤務地を入力してください</div>
			<div class="content_Form1">
				<!-- 제목예제1 -->
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>現勤務地</div>
					<div>新勤務地</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">所属コード</div>
					<div class = "form_Normal">1234</div>
					<div class = "form_Normal"><input type="text" id="newShozokuCd" name="newShozokuCd" class="short_input">
											   <button type="button" class="search_btn" onclick="openShozokuPopup();">検索</button>

						<script>
						function openShozokuPopup() {
						    window.open("/idoconfirm/shozokuSearchPopup",
						                "shozokuPopup",
						                "width=800,height=600,scrollbars=yes");
						}
						</script>

   					</div>				
  
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">所属名</div>
					<div class = "form_Normal">中野店</div>
					<div class = "form_Normal"><select>
									<option>江戸川店</option>
    									</select></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">郵便番号</div>
					<div class = "form_Normal">164-0012</div>
					<div class = "form_Normal"><input type="text" value="134" class="zipcode"> - 
												<input type="text" value="4567" class="zipcode">
												<button class="search_btn">検索</button></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">都道府県</div>
					<div class = "form_Normal">東京都</div>
					<div class = "form_Normal"><input type="text" value="東京都"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">所在地１</div>
					<div class = "form_Normal">中野区本町3-30-4</div>
					<div class = "form_Normal"><input type="text" value="江戸川区船堀2-1-5" class="zipcode2"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">所在地２（建物名等)</div>
					<div class = "form_Normal">KDX中野坂上ビル8F</div>
					<div class = "form_Normal"><input type="text" value="江戸川区" class="zipcode2"></div>
				</div>
			</div>
			
			<div class="content_Form1" style = "margin-top: 5px;">
			
			<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">異動区分</div>
					<div class="form_Normal">
    <label>
      <input type="radio" name="diff" value="ido" checked> 異動 ／ 異動日 2013/04/10
    </label>
  </div>
  <div class="form_Normal">
    <label>
      <input type="radio" name="diff" value="iten"> 移転 ／ 移転日
    </label>
  </div>
			</div>
			</div>
	
		<div class = "button_Left">
				<div class = "button_Left_Group">   
				
					<img src="/resources/img/back_btn01.gif" alt="back_btn01" 
					 style="cursor:pointer;" 
					 onclick="location.href='/idoconfirm/idoconfirm';">
					
					 
					<img src="/resources/img/next_btn01.gif" alt="next_btn01"
								style="cursor:pointer;"
     onclick="location.href='/idoconfirm/addressinput';">
     
					<img src="/resources/img/hozon_btn02.gif" alt="hozon_btn02">
				</div>
			</div>	
			
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
			
		
</body>
</html>