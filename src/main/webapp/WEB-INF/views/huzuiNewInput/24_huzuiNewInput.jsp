<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 		display : flex;
		border : solid 1px #ededed;
		padding:2px;
		margin-left:3%;		
		margin-right:3%;		
	}
	.input_form  input{
		margin-left:5px;
	}
	.input_form input[type="text"]:last-child{
		width:500px;

	}
	.item_head{
		width:100px;
		text-align:center;
		background-color: #dddddd;
		padding:3px;
		font-size:13px;
	}
	
	

 </style>
<body>
	<div class = "layout">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class = "main">
			<div class = "main_title">
				<!-- 진척도 예제 -->
				<div class="subtitle">
					<div class="">付図書類更新 入力</div>
				</div>	
				<div>
					<div style="margin: 3%">付随書類の更新内容を入力してください</div>
				</div>			
			</div>

		<div class="main_container" style="background:#ededed; padding-bottom:25px; box-sizing: border-box; margin:3%;">
			<div class="content_Form2" style = "margin-top: 25px; padding-top: 25px; ">
				<div class="form_Title2">
					<div>免許証</div>
					<div style="display: flex; gap: 5px; cursor: pointer;">
						<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
						<div>変更する</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">免許証コピー</div>
					<div class = "form_Normal"><a href="">表示</a></div>
					<div class = "form_Normal"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">免許証有効期限</div>
					<div class = "form_Normal">2025/11/10</div>
					<div class = "form_Normal"><input type="text" style="width:250px"> <img src="/resources/img/cal_icon.gif"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">免許証番号</div>
					<div class = "form_Normal">1234-5678-90</div>
					<div class = "form_Normal"><input type="text" style="width:250px"></div>
				</div>
			</div>
			
			
				
			<div class="content_Form2" style = "margin-top: 25px; padding-top: 25px; ">
				<div class="form_Title2">
					<div>車検証</div>
					<div style="display: flex; gap: 5px; cursor: pointer;">
						<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
						<div>変更する</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">車検証コピー</div>
					<div class = "form_Normal"><a href="">表示</a></div>
					<div class = "form_Normal"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">車種</div>
					<div class = "form_Normal">ベンツ</div>
					<div class = "form_Normal"><input type="text" style="width:250px"></div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">ナンバー</div>
					<div class = "form_Normal">品川　５００　あ　7777</div>
					<div class = "form_Normal" >
						<div class="member_input">
							<input type="text"><input type="text"><input type="text"><input type="text">
						</div>
						<div>
							（記入例）　　 品川 　　　300　　　 い　　　１１１１
						</div>
					</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">排気量</div>
					<div class = "form_Normal">3000</div>
					<div class = "form_Normal"><input type="text" style="width:250px">㏄</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class = "form_Column">車検有効期限</div>
					<div class = "form_Normal">2014/12/24</div>
					<div class = "form_Normal"><input type="text" style="width:250px"> <img src="/resources/img/cal_icon.gif"></div>
				</div>
			</div>
			
			
			
			<div class="content_Form2" style = "margin-top: 25px; padding-top: 25px;">
					<div class="form_Title2">
						<div>保険証券</div>
						<div style="display: flex; gap: 5px; cursor: pointer;">
							<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
							<div>変更する</div>
						</div>
					</div>
					<div class="form_Text0" style="border:0px;  margin:10px 10px;">
						※保険証券コピーは、 満了日の記載部分と、賠償額の記載部分が両方確認できるようにアップロードしてください。
					</div>
					<div class="form_Text1" id="form_Text1" style="border:solid 1px #a0a0a0; border-bottom:none;">
						<div class="form_Column">保険証券コピー（期間）</div>
						<div class = "form_Normal"><a href="">表示</a></div>
						<div class = "form_Normal"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">保険証券コピー（賠償内容）</div>
						<div class = "form_Normal"><a href="">表示</a></div>
						<div class = "form_Normal"><input type="text">　<input type="button" value="参照">　<input type="button" value="アップロード"></div>
					</div>
					<div class="form_Text1" id="form_Text1">
						<div class = "form_Column">保険満了日</div>
						<div class = "form_Normal">
							<div>
							2013/03/31
							</div>
							<div style="color:red;">
							※まもなく期限が切れます。
							</div>
						</div>
						<div class = "form_Normal"><input type="text" style="width:250px"> <img src="/resources/img/cal_icon.gif"></div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対人賠償</div>
						<div class = "form_Normal">無制限</div>
						<div class = "form_Normal"><input type="text" style="width:250px">万円</div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">対物賠償</div>
						<div class = "form_Normal">無制限</div>
						<div class = "form_Normal"><input type="text" style="width:250px">万円</div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">人身障害</div>
						<div class = "form_Normal">無制限</div>
						<div class = "form_Normal"><input type="text" style="width:250px">万円</div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">搭乗者障害</div>
						<div class = "form_Normal">無制限</div>
						<div class = "form_Normal"><input type="text" style="width:250px">万円</div>
					</div>
					<div class="form_Text1" id="form_Text1" >
						<div class = "form_Column">等級</div>
						<div class = "form_Normal">3級</div>
						<div class = "form_Normal"><input type="text" style="width:250px">等級</div>
					</div>
			</div>
		</div>
		
		
		<div style="margin-left:700px">コメント入力欄</div>
		
		
		<div class="input_form" style="">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text">
			</div>
		</div>
		
				
		<div class="input_form" style="">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text">
			</div>
		</div>		
		
		
		<div class="input_form" style="">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text">
			</div>
		</div>	
		
		<div class="input_form" style="">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text">
			</div>
		</div>	
		
		<div class="input_form" style="">
			<div class="item_head">その他</div>
			<div style="margin-right:50px;">
				<input type="text"> <input type="button" value="参照"> <input type="button" value="アップロード">
			</div>
			<div>
				<input type="text">
			</div>
		</div>	
		
		<div class = "button_Left_Group" style="margin-top:30px; margin:3%;">   
			<img src="/resources/img/back_btn01.gif" alt="back_btn01"> 
			<img src="/resources/img/next_btn01.gif" alt="nyuryoku_btn01">
			<img src="/resources/img/hozon_btn01.gif" alt="hozon_btn01">
		</div>
	</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>