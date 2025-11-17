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
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">状況</div>
					<div class="form_Normal">${jyohou.codeNm }</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請番号</div>
					<div class="form_Normal">
						<c:if test="${jyohou.shinchokuKbn == '3'}">
            ${jyohou.shinseiNo}
        </c:if>
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請日</div>
					<div class="form_Normal">${jyohou.shinseiYmd }</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">差戻し日</div>
					<div class="form_Normal">${jyohou.ssmdsYmd }</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">不備内容</div>
					<div class="form_Normal">${jyohou.moComment }</div>
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
					<div>経路&#${9311 + keiro.keiroSeq};</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Required">${keiro.shudanName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">経路</div>
					<div class="form_Required">${keiro.startPlace}⟶
						${keiro.endPlace}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">距離</div>
					<div class="form_Required">${keiro.shinseiKm }km</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">金額 1ヶ月</div>
					<div class="form_Required">${keiro.tsuki + keiro.yuryo}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">有料道路 1ヶ月</div>
					<div class="form_Required">${keiro.yuryo}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Required">${fileName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">保険満了日</div>
					<div class="form_Required">${shorui.manryoYmd}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対人賠償</div>
					<div class="form_Required">${shorui.taijin}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対物賠償</div>
					<div class="form_Required">${shorui.taibutsu}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">人身障害</div>
					<div class="form_Required">${shorui.jinshin}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">搭乗者障害</div>
					<div class="form_Required">${shorui.tojosha}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">等級</div>
					<div class="form_Required">${shorui.tokyu}級</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${jyohou.shinseiName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${jyohou.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移転日</div>
					<div class="form_Normal">
						<c:if test="${not empty jyohou.idoYmd}">
            ${jyohou.idoYmd}
        </c:if>

						<c:if test="${not empty jyohou.itenYmd}">
            ${jyohou.itenYmd}
        </c:if>
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${jyohou.tennyuYmd}</div>
				</div>

				<form action="/shinsei/updateTorikesu" method="post" id="tkForm">

					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">取消理由</div>
						<div class="form_Normal">
							<textarea name="tkCommentInput"
								style="width: 100%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
						</div>
					</div>

					<input type="hidden" name="tkComment" id="tkCommentForm"> <input
						type="hidden" name="shinseiNo" value="${jyohou.shinseiNo}">
					<input type="hidden" name="beforeKbn"
						value="${jyohou.shinchokuKbn}"> <input type="hidden"
						name="hozonUid" value="${hozon.hozonUid}"> <input
						type="hidden" name="shinseiKbn" value="${jyohou.shinseiKbn}">
					<input type="hidden" name="shinseiYmd" value="${jyohou.shinseiYmd}">
				</form>
			</div>

			<div class="button_Side">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="location.href='/shinsei/ichijihozon?no=${jyohou.shinseiNo}'">

					<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
						onclick="submitCancelForm()">
				</div>
			</div>

			<c:if test="${not empty errorMessage}">
				<script>
					alert("${errorMessage}");
					location.href = "/"; // 나중에 링크 수정할게요
				</script>
			</c:if>

			<%@ include file="/WEB-INF/views/common/footer.jsp"%>

			<script>
				function submitCancelForm() {

					const textarea = document
							.querySelector("textarea[name='tkCommentInput']");
					const value = textarea.value.trim();

					if (value.length === 0) {
						alert("取消理由を入力してください。");
						return;
					}

					if (value.length > 1000) {
						alert("取消理由は1000文字以内で入力してください。");
						return;
					}

					document.getElementById("tkCommentForm").value = value;

					document.getElementById("tkForm").submit();
				}
			</script>
</body>
</html>
