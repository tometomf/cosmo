<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 하나 -->
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

			<!-- ★ 기본 정보 -->
			<div class="content_Form1">

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">状況</div>
					<div class="form_Normal">${empty jyohou? '一時保存中' : jyohou.codeNm}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請番号</div>
					<div class="form_Normal">${empty jyohou.shinseiNo ? '' : jyohou.shinseiNo}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請日</div>
					<div class="form_Normal">${empty jyohou.shinseiYmd ? '' : jyohou.shinseiYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">差戻し日</div>
					<div class="form_Normal">${empty jyohou.ssmdsYmd ? '' : jyohou.ssmdsYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">不備内容</div>
					<div class="form_Normal">${empty jyohou.moComment ? '' : jyohou.moComment}</div>
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
					<div class="form_Normal">${empty jyohou ? ichiji.genAddress : jyohou.genAddress}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newAddress : jyohou.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${empty jyohou ? ichiji.genShozoku : jyohou.genShozoku}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newShozoku : jyohou.newShozoku}</div>

				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${empty jyohou ? ichiji.genKinmuchi : jyohou.genKinmuchi}</div>
					<div class="form_Normal">${empty jyohou ? ichiji.newKinmuchi : jyohou.newKinmuchi}</div>
				</div>
			</div>

			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路&#${9311 + (empty keiro.keiroSeq ? 0 :
						keiro.keiroSeq)};</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Required">${empty keiro.shudanName ? ichiji.keiro.shudanName : keiro.shudanName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">経路</div>
					<div class="form_Required">
						${empty keiro.startPlace ? '' : keiro.startPlace}

						<c:if
							test="${not empty keiro.startPlace && not empty keiro.endPlace}">
       						     ⟶
      				  </c:if>
						${empty keiro.endPlace ? '' : keiro.endPlace}
					</div>
				</div>


				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">距離</div>
					<div class="form_Required">
						${empty keiro.shinseiKm ? '' : keiro.shinseiKm}
						<c:if test="${not empty keiro.shinseiKm}">km</c:if>
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">金額 1ヶ月</div>
					<div class="form_Required">
						<c:choose>
							<c:when test="${keiro.total > 0}">
       								 ${keiro.total} 円
   								 </c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">有料道路 1ヶ月</div>
					<div class="form_Required">
						<c:choose>
							<c:when test="${keiro.yuryo != null && keiro.yuryo > 0}">
                ${keiro.yuryo} 円
            </c:when>
						</c:choose>
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Required">${empty fileName ? '' : fileName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">保険満了日</div>
					<div class="form_Required">${empty shorui.manryoYmd ? '' : shorui.manryoYmd}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対人賠償</div>
					<div class="form_Required">${empty shorui.taijin ? '' : shorui.taijin}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対物賠償</div>
					<div class="form_Required">${empty shorui.taibutsu ? '' : shorui.taibutsu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">人身障害</div>
					<div class="form_Required">${empty shorui.jinshin ? '' : shorui.jinshin}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">搭乗者障害</div>
					<div class="form_Required">${empty shorui.tojosha ? '' : shorui.tojosha}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">等級</div>
					<div class="form_Required">
						${empty shorui.tokyu ? '' : shorui.tokyu}
						<c:if test="${not empty shorui.tokyu}">級</c:if>
					</div>
				</div>

			</div>

			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${empty jyohou ? ichiji.shinseiName : jyohou.shinseiName}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${empty jyohou ? ichiji.riyu : jyohou.riyu}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移転日</div>
					<div class="form_Normal">
						<c:set var="ido"
							value="${empty jyohou ? ichiji.idoYmd  : jyohou.idoYmd}" />
						<c:set var="iten"
							value="${empty jyohou ? ichiji.itenYmd : jyohou.itenYmd}" />

						<c:if test="${not empty ido}">${ido}</c:if>
						<c:if test="${not empty ido and not empty iten}">/</c:if>
						<c:if test="${not empty iten}">${iten} </c:if>
					</div>
				</div>


				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${empty jyohou ? ichiji.tennyuYmd : jyohou.tennyuYmd}</div>
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
						name="hozonUid" value="${hozonUid}"> <input type="hidden"
						name="shinseiKbn" value="${jyohou.shinseiKbn}"> <input
						type="hidden" name="shinseiYmd" value="${jyohou.shinseiYmd}">
				</form>

			</div>

			<div class="button_Side">
				<div class="button_Side_Group">

					<c:choose>
						<c:when test="${not empty hozonUid}">
							<img src="/resources/img/back_btn01.gif" alt="back_btn01"
								onclick="location.href='/shinsei/ichiji?hozonUid=${hozonUid}'">
						</c:when>
						<c:when test="${not empty jyohou and not empty jyohou.shinseiNo}">
							<img src="/resources/img/back_btn01.gif" alt="back_btn01"
								onclick="location.href='/'">
						</c:when>

					</c:choose>
					<img src="/resources/img/shinsei_btn02.gif" alt="shinsei_btn02"
						onclick="submitCancelForm()">
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>


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
