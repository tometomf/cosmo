<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">状況</div>
					<c:choose>
						<c:when test="${mode eq 'view'}">
							<div class="form_Normal">${view.codeNm}</div>
						</c:when>
						<c:when test="${mode eq 'ichiji'}">
							<div class="form_Normal">一時保存中</div>
						</c:when>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${view.shinchokuKbn eq '3' }">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請番号</div>
							<div class="form_Normal">${view.shinseiNo}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請日</div>
							<div class="form_Normal">
								<c:if test="${not empty view.shinseiYmd}">
									<c:set var="ymd" value="${view.shinseiYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">差戻し日</div>
							<div class="form_Normal">
								<c:if test="${not empty view.ssmdsYmd}">
									<c:set var="ymd" value="${view.ssmdsYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">不備内容</div>
							<div class="form_Normal">${view.moComment}</div>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="content_Form1">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<c:choose>
						<c:when test="${mode eq 'view'}">
							<div class="form_Normal">${view.genAddress}</div>
							<div class="form_Normal">${view.newAddress}</div>
						</c:when>
						<c:when test="${mode eq 'ichiji'}">
							<div class="form_Normal">${ichiji.genAddress}</div>
							<div class="form_Normal">${ichiji.newAddress}</div>
						</c:when>
					</c:choose>
				</div>
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<c:choose>
						<c:when test="${mode eq 'view'}">
							<div class="form_Normal">${view.genShozoku}</div>
							<div class="form_Normal">${view.newShozoku}</div>
						</c:when>
						<c:when test="${mode eq 'ichiji'}">
							<div class="form_Normal">${ichiji.genShozoku}</div>
							<div class="form_Normal">${ichiji.newShozoku}</div>
						</c:when>
					</c:choose>
				</div>

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<c:choose>
						<c:when test="${mode eq 'view'}">
							<div class="form_Normal">${view.genKinmuchi}</div>
							<div class="form_Normal">${view.newKinmuchi}</div>
						</c:when>
						<c:when test="${mode eq 'ichiji'}">
							<div class="form_Normal">${ichiji.genKinmuchi}</div>
							<div class="form_Normal">${ichiji.newKinmuchi}</div>
						</c:when>
					</c:choose>
				</div>
			</div>

			<c:choose>
				<c:when test="${mode eq 'view'}">
					<c:forEach var="keiro" items="${view.keiroList}">
						<div class="content_Form2">
							<div class="form_Title2">
								<div>経路${keiro.circleNumber}</div>
							</div>

							<c:if test="${keiro.tsukinShudan eq '1'}">

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">通勤手段</div>
									<div class="form_Required">${keiro.shudanName}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">経路</div>
									<div class="form_Required">
										${keiro.startPlace}
										<c:if test="${not empty keiro.viaPlace1}"> → ${keiro.viaPlace1}</c:if>
										<c:if test="${not empty keiro.viaPlace2}"> → ${keiro.viaPlace2}</c:if>
										<c:if test="${not empty keiro.viaPlace3}"> → ${keiro.viaPlace3}</c:if>
										<c:if test="${not empty keiro.viaPlace4}"> → ${keiro.viaPlace4}</c:if>
										<c:if test="${not empty keiro.viaPlace5}"> → ${keiro.viaPlace5}</c:if>
										→ ${keiro.endPlace}
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">金額</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.tsuki}" type="number" />
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">片道料金</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.katamichi}" type="number" />
									</div>
								</div>

								<c:forEach var="shorui" items="${view.shoruiList}">
									<c:if test="${shorui.keiroSeq eq keiro.keiroSeq}">
										<div class="form_Text1" id="form_Text2">
											<div class="form_Column">付随書類</div>
											<div class="form_Required">${shorui.fileUid1}</div>
										</div>
									</c:if>
								</c:forEach>
								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">初回定期期間</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstTeikiTsukiSu}">
											<c:set var="ymd" value="${keiro.firstTeikiTsukiSu}" />
											<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
											<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
											<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">定期期間</div>
									<div class="form_Required">${keiro.nextTeikiTsukiSu}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">支給開始日</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstShikyuYmd}">
											<c:set var="ymd" value="${keiro.firstShikyuYmd}" />
											<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
											<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
											<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
									</div>
								</div>
							</c:if>

							<c:if
								test="${keiro.tsukinShudan eq '2' or keiro.tsukinShudan eq '7'}">

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">通勤手段</div>
									<div class="form_Required">${keiro.shudanName}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">その他の通勤手段</div>
									<div class="form_Required">${keiro.idoShudanEtcNm}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">バス会社名</div>
									<div class="form_Required">${keiro.busCorpNm}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">区間</div>
									<div class="form_Required">
										${keiro.startPlace}
										<c:if test="${not empty keiro.endPlace}"> → ${keiro.endPlace}</c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">片道料金</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.katamichi}" type="number" />
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">1ヶ月</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.sanshoTeikiKin1}"
											type="number" />
									</div>
								</div>

								<c:forEach var="shorui" items="${view.shoruiList}">
									<c:if test="${shorui.keiroSeq eq keiro.keiroSeq}">
										<div class="form_Text1" id="form_Text2">
											<div class="form_Column">付随書類</div>
											<div class="form_Required">${shorui.fileUid1}
												<c:if test="${not empty shorui.fileUid2}">${shorui.fileUid2}</c:if>
												<c:if test="${not empty shorui.fileUid3}">${shorui.fileUid3}</c:if>
												<c:if test="${not empty shorui.fileUid4}">${shorui.fileUid4}</c:if>
												<c:if test="${not empty shorui.fileUid5}">${shorui.fileUid5}</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">初回定期期間</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstTeikiTsukiSu}">
        ${keiro.firstTeikiTsukiSu}ヶ月
    </c:if>
									</div>
								</div>


								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">定期期間</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.nextTeikiTsukiSu}">
        ${keiro.firstTeikiTsukiSu}ヶ月
    </c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">支給開始日</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstShikyuYmd}">
											<c:set var="ymd" value="${keiro.firstShikyuYmd}" />
											<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
											<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
											<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
									</div>
								</div>
							</c:if>

							<c:if
								test="${keiro.tsukinShudan eq '3' or keiro.tsukinShudan eq '4'}">

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">通勤手段</div>
									<div class="form_Required">${keiro.shudanName}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">経路</div>
									<div class="form_Required">
										${keiro.startPlace}
										<c:if test="${not empty keiro.endPlace}"> → ${keiro.endPlace}</c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">距離</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.shinseiKm}"> ${keiro.shinseiKm}km </c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">金額 1ケ月</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.tsuki}" type="number" />
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">有料道路 1ケ月</div>
									<div class="form_Required">
										<fmt:formatNumber value="${keiro.yuryo}" type="number" />
									</div>
								</div>

								<c:forEach var="shorui" items="${view.shoruiList}">
									<c:if test="${shorui.keiroSeq eq keiro.keiroSeq}">
										<div class="form_Text1" id="form_Text2">
											<div class="form_Column">付随書類</div>
											<div class="form_Required">${shorui.fileUid1}</div>
										</div>

										<div class="form_Text1" id="form_Text2">
											<div class="form_Column">保険満了日</div>
											<div class="form_Required">
												<c:if test="${not empty shorui.manryoYmd}">
													<c:set var="ymd" value="${shorui.manryoYmd}" />
													<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
													<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
													<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
											</div>
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
									</c:if>
								</c:forEach>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">支給開始日</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstShikyuYmd}">
											<c:set var="ymd" value="${keiro.firstShikyuYmd}" />
											<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
											<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
											<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
									</div>
								</div>

							</c:if>

							<c:if
								test="${keiro.tsukinShudan eq '5' or keiro.tsukinShudan eq '6'}">

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">通勤手段</div>
									<div class="form_Required">${keiro.shudanName}</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">住所</div>
									<div class="form_Required">
										<c:if test="${not empty shinseiUser.address1}">${shinseiUser.address1} </c:if>
										<c:if test="${not empty shinseiUser.address2}">${shinseiUser.address2} </c:if>
										<c:if test="${not empty shinseiUser.address3}">${shinseiUser.address3}</c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">勤務地</div>
									<div class="form_Required">
										<c:if test="${not empty shinseiUser.kinmuAddress1}">${shinseiUser.kinmuAddress1} </c:if>
										<c:if test="${not empty shinseiUser.kinmuAddress2}">${shinseiUser.kinmuAddress2} </c:if>
										<c:if test="${not empty shinseiUser.kinmuAddress3}">${shinseiUser.kinmuAddress3}</c:if>
									</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">距離</div>
									<div class="form_Required">${keiro.shinseiKm}km</div>
								</div>

								<div class="form_Text1" id="form_Text2">
									<div class="form_Column">支給開始日</div>
									<div class="form_Required">
										<c:if test="${not empty keiro.firstShikyuYmd}">
											<c:set var="ymd" value="${keiro.firstShikyuYmd}" />
											<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
											<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
											<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
									</div>
								</div>
							</c:if>
						</div>
					</c:forEach>


					<div class="content_Form1">

						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請区分</div>
							<div class="form_Normal">${view.shinseiName}</div>
						</div>

						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請理由</div>
							<div class="form_Normal">${view.riyu}</div>
						</div>

						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">異動日/移転日</div>
							<div class="form_Normal">
								<c:if test="${not empty view.idoYmd}">
									<c:set var="ymd" value="${view.idoYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
								<c:if test="${not empty view.idoYmd and not empty view.itenYmd}"> / </c:if>
								<c:if test="${not empty view.itenYmd}">
									<c:set var="ymd" value="${view.itenYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
							</div>
						</div>


						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">転入日</div>
							<div class="form_Normal">
								<c:if test="${not empty view.tennyuYmd}">
									<c:set var="ymd" value="${view.tennyuYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
							</div>
						</div>


						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">開始日</div>
							<div class="form_Normal">
								<c:if test="${not empty view.riyoStartYmd}">
									<c:set var="ymd" value="${view.riyoStartYmd}" />
									<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
            ${yyyy}/${mm}/${dd}
        </c:if>
							</div>
						</div>
						<form action="/shinsei/updateTorikesu" method="post" id="tkForm">
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">取消理由</div>
								<div class="form_Normal">
									<textarea name="tkCommentInput"
										style="width: 100%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
								</div>
							</div>

							<input type="hidden" name="tkComment" id="tkCommentForm">
							<input type="hidden" name="shinseiNo" value="${view.shinseiNo}">
							<input type="hidden" name="beforeKbn"
								value="${view.shinchokuKbn}"> <input type="hidden"
								name="hozonUid" value="${hozonUid}"> <input
								type="hidden" name="shinseiKbn" value="${view.shinseiKbn}">
							<input type="hidden" name="shinseiYmd" value="${view.shinseiYmd}">
						</form>
					</div>
				</c:when>

				<c:otherwise>
					<c:if
						test="${not empty ichiji.keiro and not empty ichiji.keiro.tsukinShudan}">
						<div class="content_Form2">
							<div class="form_Title2">
								<div>経路①</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">通勤手段</div>
								<c:if test="${not empty ichiji.keiro.tsukinShudan}">
									<div class="form_Normal">${ichiji.keiro.shudanName}</div>
								</c:if>
							</div>
						</div>
					</c:if>

					<div class="content_Form1">
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請区分</div>
							<div class="form_Normal">${ichiji.shinseiName}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">申請理由</div>
							<div class="form_Normal">${ichiji.riyu}</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">異動日/移転日</div>
							<div class="form_Normal">
								<c:set var="ido" value="${ichiji.idoYmd}" />
								<c:set var="iten" value="${ichiji.itenYmd}" />
								<c:if test="${not empty ido}">
									<c:set var="yyyy" value="${fn:substring(ido, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(ido, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(ido, 6, 8)}" />
                ${yyyy}/${mm}/${dd}
            </c:if>
								<c:if test="${not empty ido and not empty iten}"> / </c:if>
								<c:if test="${not empty iten}">
									<c:set var="yyyy" value="${fn:substring(iten, 0, 4)}" />
									<c:set var="mm" value="${fn:substring(iten, 4, 6)}" />
									<c:set var="dd" value="${fn:substring(iten, 6, 8)}" />
                ${yyyy}/${mm}/${dd}
            </c:if>
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">転入日</div>
							<div class="form_Normal">
								<c:set var="ymd" value="${ichiji.tennyuYmd}" />
								<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
								<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
								<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
								${yyyy}/${mm}/${dd}
							</div>
						</div>
						<div class="form_Text1" id="form_Text2">
							<div class="form_Column">開始日</div>
							<div class="form_Normal">
								<c:set var="ymd" value="${ichiji.riyoStartYmd}" />
								<c:set var="yyyy" value="${fn:substring(ymd, 0, 4)}" />
								<c:set var="mm" value="${fn:substring(ymd, 4, 6)}" />
								<c:set var="dd" value="${fn:substring(ymd, 6, 8)}" />
								${yyyy}/${mm}/${dd}
							</div>
						</div>
						<form action="/shinsei/updateTorikesu" method="post" id="tkForm">
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">取消理由</div>
								<div class="form_Normal">
									<textarea name="tkCommentInput"
										style="width: 100%; height: 80px; border: 2px solid #ccc; padding: 6px; background-color: #f8f8f8; overflow-y: auto;"></textarea>
								</div>
							</div>

							<input type="hidden" name="tkComment" id="tkCommentForm">
							<input type="hidden" name="hozonUid" value="${hozonUid}">
							<input type="hidden" name="shinseiKbn" value="${view.shinseiKbn}">
							<input type="hidden" name="shinseiYmd" value="${view.shinseiYmd}">
						</form>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="button_Side">
				<div class="button_Side_Group">
					<c:choose>
						<c:when test="${not empty hozonUid}">
							<img src="/resources/img/back_btn01.gif" alt="back_btn01"
								onclick="location.href='/shinsei/ichiji?hozonUid=${hozonUid}'">
						</c:when>
						<c:when test="${not empty view.shinseiNo}">
							<img src="/resources/img/back_btn01.gif" alt="back_btn01"
								onclick="location.href='/shinsei/ichiji?no=${view.shinseiNo}'">
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
