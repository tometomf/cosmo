<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 제교 -->

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

#form_Text3 {
	display: grid;
	grid-template-columns: 2fr 3fr;
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
					<div class="form_Normal">${header.joutaiName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請番号</div>
					<div class="form_Normal">${header.shinseiNo}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請日</div>
					<div class="form_Normal">${header.shinseiYmd}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">差戻し日</div>
					<div class="form_Normal">${header.sashimodoshiYmd}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">再申請日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.saishinseiDate}"
							pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">承認日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.shoninDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">支給開始日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.shikyuuKaishiDate}"
							pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">本人申し送りコメント</div>
					<div class="form_Normal">${header.honninComment}</div>
				</div>
			</div>

			<c:if
				test="${not empty header.shinchokuKbn and fn:trim(header.shinchokuKbn) ne '4'}">
				<div class="button_Left">
					<form action="<c:url value='/shinsei/hikimodosu' />" method="post">
						<input type="hidden" name="shinseiNo" value="${header.shinseiNo}" />
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
					<div class="form_Normal">${header.genAddress}</div>
					<div class="form_Normal">${header.newAddress}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${header.shozokuBeforeNm}</div>
					<div class="form_Normal">${header.shozokuAfterNm}</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${header.kinmuchiBefore}</div>
					<div class="form_Normal">${header.kinmuchiAfter}</div>
				</div>
			</div>

			<!-- ===== 경로 정보 (複数対応) ===== -->
			<c:forEach var="keiro" items="${detailList}" varStatus="st">
				<div class="content_Form2" style="margin-top: 25px;">
					<div class="form_Title2">
						<div>経路&#${9312 + st.index};</div>
					</div>

					<!-- 通勤手段 공통 -->
					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">通勤手段</div>
						<div class="form_Normal">${keiro.tsukinShudanName}</div>
					</div>

					<!-- ===== 자동차/오토바이 (tsukinShudanKbn = '3') ===== -->
					<c:if test="${keiro.tsukinShudanKbn eq '3'}">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">経路 自</div>
							<div class="form_Normal">${keiro.keiro}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">経路 至</div>
							<div class="form_Normal">${keiro.keiro}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">距離</div>
							<div class="form_Normal">${keiro.kyori}km</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">有料道路 IC</div>
							<div class="form_Normal">${keiro.yuryoIcS} ～
								${keiro.yuryoIcE}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">有料道路 片道</div>
							<div class="form_Normal">
								<fmt:formatNumber value="${keiro.yuryoKatamichiKin}"
									pattern="#,##0" />
								円
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">金額 1ヶ月</div>
							<div class="form_Normal">
								<fmt:formatNumber value="${keiro.kingakuMonth}" pattern="#,##0" />
								円
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">有料道路 1ヶ月</div>
							<div class="form_Normal">
								<fmt:formatNumber value="${keiro.yuryodouroMonth}"
									pattern="#,##0" />
								円
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">付随書類</div>
							<div class="form_Normal">
								<a href="#">${keiro.fuzuiFileTitle}</a>
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">保険満了日</div>
							<div class="form_Normal">
								<fmt:formatDate value="${keiro.hokenManryoDate}"
									pattern="yyyy/MM/dd" />
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">対人賠償</div>
							<div class="form_Normal">${keiro.taijinBaisho}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">対物賠償</div>
							<div class="form_Normal">${keiro.taibutsuBaisho}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">人身障害</div>
							<div class="form_Normal">${keiro.jinshinShogai}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">搭乗者障害</div>
							<div class="form_Normal">${keiro.tojoshaShogai}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">等級</div>
							<div class="form_Normal">${keiro.tokyu}級</div>
						</div>
					</c:if>

					<!-- ===== 전철/버스 (tsukinShudanKbn = '1' or '2') ===== -->
					<c:if
						test="${keiro.tsukinShudanKbn eq '1' or keiro.tsukinShudanKbn eq '2'}">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">経路</div>
							<div class="form_Normal">${keiro.keiro}</div>
						</div>

						<c:if test="${not empty keiro.sanshoTeikiKin1}">
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">${keiro.sanshoTeikiTsukiSu1}ヶ月</div>
								<div class="form_Normal">
									<fmt:formatNumber value="${keiro.sanshoTeikiKin1}"
										pattern="#,##0" />
									円
								</div>
							</div>
						</c:if>

						<c:if test="${not empty keiro.sanshoTeikiKin2}">
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">${keiro.sanshoTeikiTsukiSu2}ヶ月</div>
								<div class="form_Normal">
									<fmt:formatNumber value="${keiro.sanshoTeikiKin2}"
										pattern="#,##0" />
									円
								</div>
							</div>
						</c:if>

						<c:if test="${not empty keiro.sanshoTeikiKin3}">
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">${keiro.sanshoTeikiTsukiSu3}ヶ月</div>
								<div class="form_Normal">
									<fmt:formatNumber value="${keiro.sanshoTeikiKin3}"
										pattern="#,##0" />
									円
								</div>
							</div>
						</c:if>

						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">片道料金</div>
							<div class="form_Normal">
								<fmt:formatNumber value="${keiro.katamichi}" pattern="#,##0" />
								円
							</div>
						</div>
					</c:if>

					<!-- ===== 도보/자전거 (tsukinShudanKbn = '6') ===== -->
					<c:if test="${keiro.tsukinShudanKbn eq '6'}">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">住所</div>
							<div class="form_Normal">${keiro.startPlace}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">勤務地</div>
							<div class="form_Normal">${keiro.endPlace}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">距離</div>
							<div class="form_Normal">${keiro.kyori}km</div>
						</div>
					</c:if>
				</div>

				<!-- ===== 자동차인 경우 付随書類 (멀티폼) ===== -->
				<c:if test="${keiro.tsukinShudanKbn eq '3'}">
					<div class="multi_Form">
						<div class="content_Form1" style="width: 330px; margin: 0;">
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<a href="">免許証コピー</a>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">免許証有効期限</div>
								<div class="form_Normal">${keiro.menkyoYukoKigen}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">免許証番号</div>
								<div class="form_Normal">${keiro.menkyoNo}</div>
							</div>
						</div>

						<div class="content_Form1" style="width: 330px; margin: 0;">
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<a href="">車検証コピー</a>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">車種</div>
								<div class="form_Normal">${keiro.shashu}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">ナンバー</div>
								<div class="form_Normal">${keiro.torokuNo}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">排気量</div>
								<div class="form_Normal">${keiro.haikiryo}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">車検有効期限</div>
								<div class="form_Normal">${keiro.shakenYukoKigen}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">燃費</div>
								<div class="form_Normal">${keiro.nenpi}km/L</div>
							</div>
						</div>

						<div class="content_Form1" style="width: 330px; margin: 0;">
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<a href="">保険証券コピー（場所）</a>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<a href="">保険証券コピー（郵便内容）</a>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">保険満了日</div>
								<div class="form_Normal">
									<fmt:formatDate value="${keiro.hokenManryoDate}"
										pattern="yyyy/MM/dd" />
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">対人賠償</div>
								<div class="form_Normal">${keiro.taijinBaisho}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">対物賠償</div>
								<div class="form_Normal">${keiro.taibutsuBaisho}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">人身障害</div>
								<div class="form_Normal">${keiro.jinshinShogai}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">搭乗者障害</div>
								<div class="form_Normal">${keiro.tojoshaShogai}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">等級</div>
								<div class="form_Normal">${keiro.tokyu}</div>
							</div>
						</div>
					</div>
				</c:if>

				<!-- ===== 전철/버스인 경우 付随書類 ===== -->
				<c:if
					test="${keiro.tsukinShudanKbn eq '1' or keiro.tsukinShudanKbn eq '2'}">
					<div class="multi_Form"
						style="justify-content: flex-start; margin-top: 15px;">
						<div class="content_Form1" style="width: 330px; margin: 0;">
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<c:choose>
										<c:when test="${not empty keiro.fileUid1}">
											<a href="/idoconfirm/download?fileUid=${keiro.fileUid1}">
												${keiro.fileUid1} </a>
										</c:when>
										<c:otherwise>添付なし</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回定期期間</div>
								<div class="form_Normal">
									<c:if test="${not empty keiro.firstTeikiKikan}">
                                        ${keiro.firstTeikiKikan}ヶ月
                                    </c:if>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回以降定期期間</div>
								<div class="form_Normal">
									<c:if test="${not empty keiro.nextTeikiKikan}">
                                        ${keiro.nextTeikiKikan}ヶ月
                                    </c:if>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>

			<!-- ===== 신청 정보 ===== -->
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${header.shinseiKbnName}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">${header.shinseiRiyu}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">異動日/移動日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.idouDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.tennyuDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">
						<fmt:formatDate value="${header.kaishiDate}" pattern="yyyy/MM/dd" />
					</div>
				</div>
			</div>

			<!-- ===== 돌아가기 버튼 (왼쪽 정렬) ===== -->
			<div class="button_Left">
				<div class="button_Left_Group">
					<a href="/"> <img src="/resources/img/back_btn01.gif"
						alt="back_btn01">
					</a>
				</div>
			</div>

			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>
