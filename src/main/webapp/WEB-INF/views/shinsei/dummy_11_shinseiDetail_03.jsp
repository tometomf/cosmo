<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請中案件 詳細</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
#form_Title1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Text1 {
	display: grid;
	grid-template-columns: 1fr 2fr 2fr;
}

#form_Title2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}

#form_Text2 {
	display: grid;
	grid-template-columns: 1fr 4fr;
}
</style>
</head>
<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<div class="main">
			<div class="main_title">
				<div class="subtitle">
					<div>申請中案件 詳細</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">状況</div>
					<div>差し戻し</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">申請番号</div>
					<div>20180730</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">申請日</div>
					<div>2018/07/30</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">差戻し日</div>
					<div>2018/07/31</div>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">不備内容</div>
					<div>省略</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal">${jyohou.genAddress}</div>
					<div class="form_Normal">${jyohou.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${jyohou.genShozoku}</div>
					<div class="form_Normal">${jyohou.newShozoku}</div>
					
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${jyohou.genKinmuchi}</div>
					<div class="form_Normal">${jyohou.newKinmuchi}</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路①</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">経路</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">距離</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">金額 1ヶ月</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">有料道路 1ヶ月</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">保険満了日</div>
					<div class="form_Required"></div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対人賠償</div>
					<div class="form_Required">無制限</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対物賠償</div>
					<div class="form_Required">無制限</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">人身障害</div>
					<div class="form_Required">無制限</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">搭乗者障害</div>
					<div class="form_Required">無制限</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">等級</div>
					<div class="form_Required"></div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${jyohou.shinseiKbn}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${jyohou.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移転日</div>
					<div class="form_Normal">${jyohou.idoYmd} / ${jyohou.itenYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${jyohou.tennyuYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">${jyohou.riyoStartYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">取消理由</div>
					<div class="form_Normal">
						<textarea 
							style="width: 90%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
					</div>
				</div>
			</div>


			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onClick="location.href='/shinsei/ichijihozon?no=${jyohou.shinseiNo}'"> <img
						src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02">
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>
