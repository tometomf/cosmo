<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請中案件 詳細</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
#form_Ttile1 {
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
			<!-- ===== 제목 ===== -->
			<div class="main_title">
				<div class="subtitle">
					<div>申請中案件 詳細</div>
				</div>
			</div>

			<!-- ===== 상태 정보 ===== -->
			<div class="content_Form1" style="margin-top: 25px;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">状況</div>
					<div class="form_Normal">${detail.joutaiName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請番号</div>
					<div class="form_Normal">${detail.shinseiNo}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請日</div>
					<div class="form_Normal">${detail.shinseiYmd}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">差戻し日</div>
					<div class="form_Normal">${detail.sashimodoshiYmd}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">再申請日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.saishinseiDate}"
							pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">承認日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.shoninDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">支給開始日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.shikyuuKaishiDate}"
							pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">本人申し送りコメント</div>
					<div class="form_Normal">${detail.honninComment}</div>
				</div>
			</div>




			<c:if
				test="${not empty detail.shinchokuKbn and fn:trim(detail.shinchokuKbn) ne '4'}">
				<div class="button_Left">
					<form action="<c:url value='/shinsei/hikimodosu' />" method="post">
						<input type="hidden" name="shinseiNo" value="${detail.shinseiNo}" />
						<div class="button_Left_Group">
							<button type="submit"
								style="border: 0; padding: 0; margin: 0; background: none; cursor: pointer;">
								<img src="/resources/img/shinsei_btn04.gif" alt="この申請を引戻す">
							</button>
						</div>
					</form>
				</div>
			</c:if>


			<!-- ===== 신청 전 / 후 ===== -->
			<div class="content_Form1">
				<div class="form_Title1" id="form_Ttile1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<div class="form_Normal">${detail.genAddress}</div>
					<div class="form_Normal">${detail.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${detail.shozokuBeforeNm}</div>
					<div class="form_Normal">${detail.shozokuAfterNm}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${detail.kinmuchiBefore}</div>
					<div class="form_Normal">${detail.kinmuchiAfter}</div>
				</div>
			</div>

			<!-- ===== 경로 정보 ===== -->
			<div class="content_Form2">
				<div class="form_Title2">
					<div>経路①</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">通勤手段</div>
					<div class="form_Normal">${detail.tsukinShudanName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">経路</div>
					<div class="form_Normal">${detail.keiro}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">距離</div>
					<div class="form_Normal">${detail.kyori}km</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">金額 1ヶ月</div>
					<div class="form_Normal">
						<fmt:formatNumber value="${detail.kingakuMonth}" pattern="#,##0" />
						円
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">有料道路 1ヶ月</div>
					<div class="form_Normal">
						<fmt:formatNumber value="${detail.yuryodouroMonth}"
							pattern="#,##0" />
						円
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">付随書類</div>
					<div class="form_Normal">
						<a href="#">${detail.fuzuiFileTitle}</a>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">保険満了日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.hokenManryoDate}"
							pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対人賠償</div>
					<div class="form_Normal">${detail.taijinBaisho}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">対物賠償</div>
					<div class="form_Normal">${detail.taibutsuBaisho}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">人身障害</div>
					<div class="form_Normal">${detail.jinshinShogai}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">搭乗者障害</div>
					<div class="form_Normal">${detail.tojoshaShogai}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">等級</div>
					<div class="form_Normal">${detail.tokyu}級</div>
				</div>
			</div>

			<!-- ===== 신청 정보 ===== -->
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${detail.shinseiKbnName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${detail.shinseiRiyu}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移動日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.idouDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.tennyuDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${detail.kaishiDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
			</div>

			<!-- ===== 돌아가기 버튼 (왼쪽 정렬) ===== -->
			<div class="button_Left">
				<div class="button_Left_Group">
					<a href="사원톱메뉴"> <img src="/resources/img/back_btn01.gif"
						alt="back_btn01">
					</a>
				</div>
			</div>

			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>
