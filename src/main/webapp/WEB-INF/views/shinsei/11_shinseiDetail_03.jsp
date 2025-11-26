<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 제교 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請内容 確認</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<!-- AjaxZip3 CDN 추가 -->
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<!-- ★★★ 여기에 JavaScript 함수들을 먼저 선언 ★★★ -->
<script type="text/javascript">
	function openAddressCheck() {
		console.log('=== openAddressCheck 함수 시작 ===');

		var zip1Element = document.getElementById("zipCode1");
		var zip2Element = document.getElementById("zipCode2");
		var prefElement = document.getElementById("prefectureSelect");
		var addr1Element = document.getElementById("address1Input");
		var addr2Element = document.getElementById("address2Input");

		if (!zip1Element || !zip2Element || !prefElement || !addr1Element
				|| !addr2Element) {
			alert("入力項目が見つかりません。");
			console.error("요소를 찾을 수 없습니다.");
			return;
		}

		var zip1 = zip1Element.value.trim();
		var zip2 = zip2Element.value.trim();
		var pref = prefElement.value.trim();
		var addr1 = addr1Element.value.trim();
		var addr2 = addr2Element.value.trim();

		console.log('입력값 확인: zip1=' + zip1 + ', zip2=' + zip2 + ', pref='
				+ pref + ', addr1=' + addr1 + ', addr2=' + addr2);

		if (!pref && !addr1) {
			alert("都道府県または住所を入力してください。");
			return;
		}

		var params = "zip=" + encodeURIComponent(zip1 + zip2) + "&pref="
				+ encodeURIComponent(pref) + "&addr1="
				+ encodeURIComponent(addr1) + "&addr2="
				+ encodeURIComponent(addr2);

		var url = "/shinsei/addressCheck?" + params;

		console.log('팝업 URL: ' + url);

		try {
			var popup = window.open(url, "addressCheckWindow",
					"width=800,height=600,scrollbars=yes,resizable=yes");

			if (!popup || popup.closed || typeof popup.closed == 'undefined') {
				alert("ポップアップがブロックされました。\nブラウザの設定でポップアップを許可してください。");
				console.error('팝업이 차단되었습니다.');
			} else {
				console.log('팝업이 정상적으로 열렸습니다.');
				popup.focus();
			}
		} catch (error) {
			console.error('팝업 열기 중 오류:', error);
			alert("エラーが発生しました: " + error.message);
		}
	}

	function openKinmuAddressCheck() {
		console.log('=== openKinmuAddressCheck 함수 시작 ===');

		var zip = "${empty jyohou.newKinmuZipCd ? '' : jyohou.newKinmuZipCd}";
		var pref = "${empty jyohou.newKinmuAddress1 ? '' : jyohou.newKinmuAddress1}";
		var addr1 = "${empty jyohou.newKinmuAddress2 ? '' : jyohou.newKinmuAddress2}";
		var addr2 = "${empty jyohou.newKinmuAddress3 ? '' : jyohou.newKinmuAddress3}";

		console.log("근무지 주소:", zip, pref, addr1, addr2);

		if (!pref && !addr1) {
			alert("勤務先住所情報がありません。");
			return;
		}

		var params = "zip=" + encodeURIComponent(zip) + "&pref="
				+ encodeURIComponent(pref) + "&addr1="
				+ encodeURIComponent(addr1) + "&addr2="
				+ encodeURIComponent(addr2) + "&mode=kinmu"; // ★ 집/근무지 구분용

		var url = "/shinsei/addressCheck?" + params;

		try {
			var popup = window.open(url, "kinmuAddressCheckWindow",
					"width=800,height=600,scrollbars=yes,resizable=yes");

			if (!popup || popup.closed || typeof popup.closed == 'undefined') {
				alert("ポップアップがブロックされました。\nブラウザの設定でポップアップを許可してください。");
				console.error('근무지 팝업이 차단되었습니다.');
			} else {
				console.log('근무지 팝업이 정상적으로 열렸습니다.');
				popup.focus();
			}
		} catch (error) {
			console.error('근무지 팝업 열기 중 오류:', error);
			alert("エラーが発生しました: " + error.message);
		}
	}

	function applyAddressFromCheck(pref, addr1, addr2, lat, lng) {
		console.log('=== applyAddressFromCheck 호출됨 ===');
		console.log('받은 값: pref=' + pref + ', addr1=' + addr1 + ', addr2='
				+ addr2 + ', lat=' + lat + ', lng=' + lng);

		try {
			var latNum = Number(lat);
			var lngNum = Number(lng);

			if (isNaN(latNum) || isNaN(lngNum)) {
				console.error('緯度経度が数値ではありません: lat=' + lat + ', lng=' + lng);
				alert('緯度経度の取得に失敗しました。(数値ではありません)');
				return;
			}

			var latStr = latNum.toFixed(3);
			var lngStr = lngNum.toFixed(3);
			var newIdoKeido = latStr + "," + lngStr;

			console.log('잘라낸 緯度経度: ' + newIdoKeido + ' (length='
					+ newIdoKeido.length + ')');

			var prefElement = document.getElementById("prefectureSelect");
			var addr1Element = document.getElementById("address1Input");
			var addr2Element = document.getElementById("address2Input");

			if (!prefElement) {
				console.error('prefectureSelect 요소를 찾을 수 없습니다.');
				alert('都道府県の入力欄が見つかりません。');
				return;
			}
			if (!addr1Element) {
				console.error('address1Input 요소를 찾을 수 없습니다.');
				alert('住所1の入力欄が見つかりません。');
				return;
			}
			if (!addr2Element) {
				console.error('address2Input 요소를 찾을 수 없습니다.');
				alert('住所2の入力欄が見つかりません。');
				return;
			}

			prefElement.value = pref;
			addr1Element.value = addr1;
			addr2Element.value = addr2;

			console.log('住所入力欄の更新完了');

			var idoKeidoElement = document
					.getElementById("addressIdoKeidoHidden");
			var oldIdoKeidoElement = document
					.getElementById("oldAddressIdoKeido");
			var flgElement = document.getElementById("addressChgKbnHidden");

			if (!idoKeidoElement) {
				console.error('addressIdoKeidoHidden 요소를 찾을 수 없습니다.');
				alert('緯度経度の保存領域が見つかりません。');
				return;
			}
			if (!flgElement) {
				console.error('addressChgKbnHidden 요소를 찾을 수 없습니다.');
				alert('住所変更フラグの保存領域が見つかりません。');
				return;
			}

			console.log("addressChgKbnHidden 최종값 = "
					+ (flgElement.value || '(未設定)'));

			idoKeidoElement.value = newIdoKeido;
			console.log('新しい緯度経度: ' + newIdoKeido);

			var oldVal = oldIdoKeidoElement ? oldIdoKeidoElement.value : '';

			console.log('修正前緯度経度: ' + oldVal);
			console.log('修正後緯度経度: ' + newIdoKeido);

			if (newIdoKeido && newIdoKeido.trim() !== ''
					&& oldVal !== newIdoKeido) {
				flgElement.value = "1";
				console.log('住所変更フラグ: 1 (変更あり)');
				alert("住所情報が更新されました。\n緯度経度: " + newIdoKeido
						+ "\n\n※ 住所が変更されました。");
			} else {
				flgElement.value = "0";
				console.log('住所変更フラグ: 0 (変更なし)');
				alert("住所情報が更新されました。\n緯度経度: " + newIdoKeido);
			}

		} catch (e) {
			console.error('applyAddressFromCheck 에러:', e);
			alert('エラーが発生しました: ' + e.message);
		}
	}

	function applyKinmuAddressFromCheck(pref, addr1, addr2, lat, lng) {
		console.log('=== applyKinmuAddressFromCheck 호출됨 ===');
		console.log('받은 값(근무지): pref=' + pref + ', addr1=' + addr1 + ', addr2='
				+ addr2 + ', lat=' + lat + ', lng=' + lng);

		try {
			var latNum = Number(lat);
			var lngNum = Number(lng);

			if (isNaN(latNum) || isNaN(lngNum)) {
				console.error('근무지 緯度経度가 수치가 아님: lat=' + lat + ', lng=' + lng);
				alert('勤務先の緯度経度の取得に失敗しました。(数値ではありません)');
				return;
			}

			var latStr = latNum.toFixed(3);
			var lngStr = lngNum.toFixed(3);
			var newIdoKeido = latStr + "," + lngStr;

			console.log('근무지 잘라낸 緯度経度: ' + newIdoKeido + ' (length='
					+ newIdoKeido.length + ')');

			var idoKeidoElement = document
					.getElementById("kinmuAddressIdoKeidoHidden");
			var oldIdoKeidoElement = document
					.getElementById("oldKinmuAddressIdoKeido");
			var flgElement = document
					.getElementById("kinmuAddressChgKbnHidden");

			if (!idoKeidoElement) {
				console.error('kinmuAddressIdoKeidoHidden 요소를 찾을 수 없습니다.');
				alert('勤務先緯度経度の保存領域が見つかりません。');
				return;
			}
			if (!flgElement) {
				console.error('kinmuAddressChgKbnHidden 요소를 찾을 수 없습니다.');
				alert('勤務先住所変更フラグの保存領域が見つかりません。');
				return;
			}

			idoKeidoElement.value = newIdoKeido;
			console.log('근무지 새로운緯度経度: ' + newIdoKeido);

			var oldVal = oldIdoKeidoElement ? oldIdoKeidoElement.value : '';

			console.log('근무지 修正前緯度経度: ' + oldVal);
			console.log('근무지 修正後緯度経度: ' + newIdoKeido);

			if (newIdoKeido && newIdoKeido.trim() !== ''
					&& oldVal !== newIdoKeido) {
				flgElement.value = "1";
				console.log('勤務先変更フラグ: 1 (変更あり)');
				alert("勤務先緯度経度が更新されました。\n緯度経度: " + newIdoKeido
						+ "\n\n※ 勤務地が変更されました。");
			} else {
				flgElement.value = "0";
				console.log('勤務先変更フラグ: 0 (変更なし)');
				alert("勤務先緯度経度が更新されました。\n緯度経度: " + newIdoKeido);
			}

		} catch (e) {
			console.error('applyKinmuAddressFromCheck 에러:', e);
			alert('エラーが発生しました: ' + e.message);
		}
	}

	function submitReapplyForm() {
		var textarea = document.getElementById("shinseiRiyuInput");
		var value = (textarea.value || "").trim();

		if (value.length === 0) {
			alert("申請理由を入力してください。");
			return;
		}

		document.getElementById("shinseiRiyuHidden").value = value;

		var zip1 = document.getElementById("zipCode1").value.trim();
		var zip2 = document.getElementById("zipCode2").value.trim();
		document.getElementById("newZipCdHidden").value = zip1 + zip2;

		var pref = document.getElementById("prefectureSelect").value.trim();
		var addr1 = document.getElementById("address1Input").value.trim();
		var addr2 = document.getElementById("address2Input").value.trim();

		document.getElementById("newAddress1Hidden").value = pref;

		document.getElementById("newAddress2Hidden").value = addr1;

		document.getElementById("newAddress3Hidden").value = addr2;

		var jitsuInput = document.getElementById("jitsuKinmuInput");
		if (jitsuInput) {
			document.getElementById("jitsuKinmuNissuHidden").value = jitsuInput.value
					.trim();
		}

		var addressChgKbn = document.getElementById("addressChgKbnHidden").value;
		var addressIdoKeido = document.getElementById("addressIdoKeidoHidden").value;

		console.log('=== 送信データ確認 ===');
		console.log('NEW_ZIP_CD:', zip1 + zip2);
		console.log('NEW_ADDRESS_1 (都道府県):', pref);
		console.log('NEW_ADDRESS_2 (住所1):', addr1);
		console.log('NEW_ADDRESS_3 (住所2):', addr2);
		console.log('ADDRESS_CHG_KBN:', addressChgKbn);
		console.log('ADDRESS_IDO_KEIDO:', addressIdoKeido);

		if (pref.length > 8) {
			alert('都道府県が長すぎます。(最大8文字)');
			return;
		}
		if (addr1.length > 200) {
			alert('住所1が長すぎます。(最大200文字)');
			return;
		}
		if (addr2.length > 200) {
			alert('住所2が長すぎます。(最大200文字)');
			return;
		}
		if (addressIdoKeido && addressIdoKeido.length > 19) {
			alert('緯度経度が長すぎます。(最大19文字)');
			return;
		}

		var confirmMsg = "以下の内容で送信します。よろしいですか?\n\n";
		confirmMsg += "郵便番号: " + zip1 + "-" + zip2 + "\n";
		confirmMsg += "都道府県: " + pref + "\n";
		confirmMsg += "住所1: " + addr1 + "\n";
		confirmMsg += "住所2: " + addr2 + "\n";
		confirmMsg += "住所変更フラグ: "
				+ (addressChgKbn === "1" ? "1 (変更あり)" : "0 (変更なし)") + "\n";
		confirmMsg += "緯度経度: " + (addressIdoKeido || "(未設定)");

		if (!confirm(confirmMsg)) {
			return;
		}

		document.getElementById("reapplyForm").submit();
	}

	function goToCancelPage() {
		var shinseiNo = "${jyohou.shinseiNo}";
		var hozonUid = "${hozonUid}";

		if (!shinseiNo) {
			alert("申請番号が取得できません。");
			return;
		}

		var url = "/shinsei/torikesu?no=" + encodeURIComponent(shinseiNo);

		if (hozonUid && hozonUid !== "") {
			url += "&hozonUid=" + encodeURIComponent(hozonUid);
		}

		location.href = url;
	}

	function submitBackForm() {
		document.getElementById("backForm").submit();
	}
</script>
<style>
/* ====== 테이블 구조 ====== */
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
					<div>申請内容 確認</div>
				</div>
			</div>

			<!-- ===== 경고 영역 ===== -->
			<c:if test="${jyohou.shinchokuKbn eq '3'}">
				<div
					style="display: flex; align-items: flex-start; gap: 8px; margin-top: 10px; width: 1010px; margin-left: auto; margin-right: auto;">

					<!-- 경고 아이콘 -->
					<img src="/resources/img/icon_attention.gif" alt="warning"
						style="width: 35px; height: 35px; flex-shrink: 0; margin-top: 2px;">

					<!-- 경고 문장 -->
					<div style="font-size: 13px; color: #cc0000; line-height: 1.6;">
						<div>申請内容に不備があったため差戻しされています。</div>
						<div>不備内容を確認のうえ、再申請を行ってください。</div>
						<div style="margin-top: 3px; font-weight: bold;">
							[注意] <span style="font-weight: normal;">
								申請期限日を過ぎると通勤費申請は行えなくなります。 </span>
						</div>
					</div>
				</div>
			</c:if>

			<!-- ===== 상태 정보 ===== -->
			<div class="content_Form1" style="margin-top: 25px;">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">状況</div>
					<div class="form_Normal">${empty jyohou.codeNm ? '' : jyohou.codeNm}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請番号</div>
					<div class="form_Normal">${empty jyohou.shinseiNo ? '' : jyohou.shinseiNo}</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請日</div>
					<div class="form_Normal">${empty jyohou.shinseiYmd ? '' : jyohou.shinseiYmd}</div>
				</div>

				<!-- ※ 進捗状況区分 が 「一時保存」 以外のとき만 표시 -->
				<c:if test="${jyohou.shinchokuKbn ne '1'}">

					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">差戻し日</div>
						<div class="form_Normal">${empty jyohou.ssmdsYmd ? '' : jyohou.ssmdsYmd}
						</div>
					</div>

					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">申請解除日</div>
						<div class="form_Normal">${empty jyohou.torikeshiYmd ? '' : jyohou.torikeshiYmd}
						</div>
					</div>

					<div class="form_Text1" id="form_Text2">
						<div class="form_Column">不備内容</div>
						<div class="form_Normal">${empty jyohou.moComment ? '' : jyohou.moComment}
						</div>
					</div>

				</c:if>

			</div>

			<!-- ===== 申請前後情報 ===== -->
			<div class="content_Form1" style="margin-top: 25px;">
				<div class="form_Title1" id="form_Title1">
					<div></div>
					<div>申請前</div>
					<div>申請後</div>
				</div>

				<!-- 住所 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">住所</div>
					<!-- 申請前 -->
					<div class="form_Normal">${empty jyohou.genAddress ? '' : jyohou.genAddress}</div>

					<!-- 申請後 -->
					<div class="form_Normal"
						style="display: flex; flex-direction: column; gap: 5px; align-items: flex-start;">
						<!-- 우편번호 -->
						<div style="display: flex; align-items: center; gap: 5px;">
							<input type="text" id="zipCode1" name="zip1" maxlength="3"
								style="width: 40px; text-align: center;"> - <input
								type="text" id="zipCode2" name="zip2" maxlength="4"
								style="width: 60px; text-align: center;">
							<button type="button" style="padding: 2px 8px;"
								onclick="AjaxZip3.zip2addr('zip1','zip2','prefecture','address1','address2');">検索</button>
						</div>
						<!-- 도도부현 -->
						<div>
							<select id="prefectureSelect" name="prefecture"
								style="width: 120px;">
								<option value="">選択</option>
								<option value="北海道">北海道</option>
								<option value="青森県">青森県</option>
								<option value="岩手県">岩手県</option>
								<option value="宮城県">宮城県</option>
								<option value="秋田県">秋田県</option>
								<option value="山形県">山形県</option>
								<option value="福島県">福島県</option>
								<option value="茨城県">茨城県</option>
								<option value="栃木県">栃木県</option>
								<option value="群馬県">群馬県</option>
								<option value="埼玉県">埼玉県</option>
								<option value="千葉県">千葉県</option>
								<option value="東京都">東京都</option>
								<option value="神奈川県">神奈川県</option>
								<option value="新潟県">新潟県</option>
								<option value="富山県">富山県</option>
								<option value="石川県">石川県</option>
								<option value="福井県">福井県</option>
								<option value="山梨県">山梨県</option>
								<option value="長野県">長野県</option>
								<option value="岐阜県">岐阜県</option>
								<option value="静岡県">静岡県</option>
								<option value="愛知県">愛知県</option>
								<option value="三重県">三重県</option>
								<option value="滋賀県">滋賀県</option>
								<option value="京都府">京都府</option>
								<option value="大阪府">大阪府</option>
								<option value="兵庫県">兵庫県</option>
								<option value="奈良県">奈良県</option>
								<option value="和歌山県">和歌山県</option>
								<option value="鳥取県">鳥取県</option>
								<option value="島根県">島根県</option>
								<option value="岡山県">岡山県</option>
								<option value="広島県">広島県</option>
								<option value="山口県">山口県</option>
								<option value="徳島県">徳島県</option>
								<option value="香川県">香川県</option>
								<option value="愛媛県">愛媛県</option>
								<option value="高知県">高知県</option>
								<option value="福岡県">福岡県</option>
								<option value="佐賀県">佐賀県</option>
								<option value="長崎県">長崎県</option>
								<option value="熊本県">熊本県</option>
								<option value="大分県">大分県</option>
								<option value="宮崎県">宮崎県</option>
								<option value="鹿児島県">鹿児島県</option>
								<option value="沖縄県">沖縄県</option>
							</select>
						</div>
						<!-- 주소1 -->
						<div>
							<input type="text" id="address1Input" name="address1"
								value="${empty jyohou.newAddress ? '' : jyohou.newAddress}"
								style="width: 385px;">
						</div>
						<!-- 주소2 -->
						<div>
							<input type="text" id="address2Input" name="address2" value=""
								style="width: 385px;">
						</div>

						<!-- 주소 확인(緯度経度 취득) 버튼 -->
						<button type="button"
							style="border: none; background: none; cursor: pointer; padding: 5px;"
							onclick="openAddressCheck()">
							<img src="/resources/img/tn/search_btn02.gif" alt="住所確認"
								style="vertical-align: middle; display: block;">
						</button>
					</div>
				</div>

				<!-- 勤務先 -->
				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務先</div>
					<div class="form_Normal">${empty jyohou.genShozoku ? '' : jyohou.genShozoku}</div>
					<div class="form_Normal"
						style="display: flex; align-items: center; gap: 5px;">
						<span>${empty jyohou.newShozoku ? '' : jyohou.newShozoku}</span>
					</div>
				</div>

				<!-- 勤務地 -->

				<div class="form_Text1" id="form_Text1">
					<div class="form_Column">勤務地</div>
					<div class="form_Normal">${empty jyohou.genKinmuchi ? '' : jyohou.genKinmuchi}</div>
					<div class="form_Normal">${empty jyohou.newKinmuchi ? '' : jyohou.newKinmuchi}
						<button type="button"
							style="border: none; background: none; cursor: pointer; padding: 5px;"
							onclick="openKinmuAddressCheck()">
							<img src="/resources/img/tn/search_btn02.gif" alt="勤務地確認"
								style="vertical-align: middle; display: block;">
						</button>
					</div>
				</div>


			</div>

			<!-- ===== 経路 섹션 시작 ===== -->
			<c:forEach var="keiro" items="${keiroList}" varStatus="st">

				<div class="content_Form2"
					style="margin-top: 25px; font-size: 13px;">

					<div class="form_Title2"
						style="background-color: #333; color: #fff; font-weight: bold; padding: 5px 10px;">
						経路&#${9312 + st.index};</div>

					<c:choose>
						<c:when test="${keiro.tsukinShudanKbn eq '3'}">

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">通勤手段</div>
								<div class="form_Normal">${empty keiro.shudanName ? '' : keiro.shudanName}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">経路 自</div>
								<div class="form_Normal">${empty keiro.startPlace ? '' : keiro.startPlace}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">経路 至</div>
								<div class="form_Normal">${empty keiro.endPlace ? '' : keiro.endPlace}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">距離</div>
								<div class="form_Normal">
									${empty keiro.shinseiKm ? '' : keiro.shinseiKm}
									<c:if test="${not empty keiro.shinseiKm}">km</c:if>
								</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">有料道路 IC</div>
								<div class="form_Normal">${empty keiro.yuryoIcS && empty keiro.yuryoIcE ? '' : 
                          keiro.yuryoIcS += ' ～ ' += keiro.yuryoIcE}
								</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">有料道路 片道</div>
								<div class="form_Normal">
									${empty keiro.katamichi ? '' : keiro.katamichi}
									<c:if test="${not empty keiro.katamichi}">円</c:if>
								</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">1ヶ月金額</div>
								<div class="form_Normal">
									<c:if test="${keiro.tsuki != null && keiro.tsuki > 0}">
                            ${keiro.tsuki}円
                        </c:if>
								</div>
							</div>

						</c:when>

						<c:when
							test="${keiro.tsukinShudanKbn eq '1' or keiro.tsukinShudanKbn eq '2'}">

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">通勤手段</div>
								<div class="form_Normal">${empty keiro.shudanName ? '' : keiro.shudanName}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">経路</div>
								<div class="form_Normal">
									${empty keiro.startPlace ? '' : keiro.startPlace}
									<c:if test="${not empty keiro.endPlace}">
                            → ${keiro.endPlace}
                        </c:if>
								</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">1ヶ月</div>
								<div class="form_Normal">
									<c:if test="${keiro.sanshoTeikiKin1 != null}">
                            ${keiro.sanshoTeikiKin1}円 / ${keiro.sanshoTeikiTsukiSu1}ヶ月
                        </c:if>
									<c:if test="${keiro.sanshoTeikiKin2 != null}">
                            &nbsp; ${keiro.sanshoTeikiKin2}円 / ${keiro.sanshoTeikiTsukiSu2}ヶ月
                        </c:if>
									<c:if test="${keiro.sanshoTeikiKin3 != null}">
                            &nbsp; ${keiro.sanshoTeikiKin3}円 / ${keiro.sanshoTeikiTsukiSu3}ヶ月
                        </c:if>
								</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">片道料金</div>
								<div class="form_Normal">
									${empty keiro.katamichi ? '' : keiro.katamichi}
									<c:if test="${not empty keiro.katamichi}">円</c:if>
								</div>
							</div>

						</c:when>

						<c:when test="${keiro.tsukinShudanKbn eq '6'}">

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">通勤手段</div>
								<div class="form_Normal">${empty keiro.shudanName ? '' : keiro.shudanName}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">住所</div>
								<div class="form_Normal">${empty keiro.startPlace ? '' : keiro.startPlace}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">勤務地</div>
								<div class="form_Normal">${empty keiro.endPlace ? '' : keiro.endPlace}</div>
							</div>

							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">距離</div>
								<div class="form_Normal">
									${empty keiro.shinseiKm ? '' : keiro.shinseiKm}
									<c:if test="${not empty keiro.shinseiKm}">km</c:if>
								</div>
							</div>

						</c:when>

						<c:otherwise>
							<div class="form_Text1" id="form_Text2">
								<div class="form_Column">通勤手段</div>
								<div class="form_Normal">${empty keiro.shudanName ? '不明な通勤手段' : keiro.shudanName}
								</div>
							</div>
						</c:otherwise>

					</c:choose>

				</div>

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
								<div class="form_Normal">${empty shorui.menkyoYukoKigen ? '' : shorui.menkyoYukoKigen}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">免許証番号</div>
								<div class="form_Normal">${empty shorui.menkyoNo ? '' : shorui.menkyoNo}</div>
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
								<div class="form_Normal">${empty shorui.shashu ? '' : shorui.shashu}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">ナンバー</div>
								<div class="form_Normal">${empty shorui.torokuNo ? '' : shorui.torokuNo}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">排気量</div>
								<div class="form_Normal">
									<c:if test="${not empty shorui.haikiryo}">
                            ${shorui.haikiryo}
                        </c:if>
								</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">車検有効期限</div>
								<div class="form_Normal">${empty shorui.shakenYukoKigen ? '' : shorui.shakenYukoKigen}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">燃費</div>
								<div class="form_Normal">
									<c:if test="${not empty shorui.nenpi}">
                            ${shorui.nenpi}km/L
                        </c:if>
								</div>
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
								<div class="form_Normal">${empty shorui.hokenManryoYmd ? '' : shorui.hokenManryoYmd}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">対人賠償</div>
								<div class="form_Normal">${empty shorui.taijinBaisho ? '' : shorui.taijinBaisho}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">対物賠償</div>
								<div class="form_Normal">${empty shorui.taibutsuBaisho ? '' : shorui.taibutsuBaisho}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">人身障害</div>
								<div class="form_Normal">${empty shorui.jinshinShogai ? '' : shorui.jinshinShogai}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">搭乗者障害</div>
								<div class="form_Normal">${empty shorui.tojoshaShogai ? '' : shorui.tojoshaShogai}</div>
							</div>
							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">等級</div>
								<div class="form_Normal">${empty shorui.tokyu ? '' : shorui.tokyu}</div>
							</div>
						</div>
					</div>
				</c:if>

				<c:if
					test="${keiro.tsukinShudanKbn eq '1' or keiro.tsukinShudanKbn eq '2'}">
					<div class="multi_Form"
						style="justify-content: flex-start; margin-top: 15px;">
						<div class="content_Form1" style="width: 330px; margin: 0;">


							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">付随書類</div>
								<div class="form_Normal">
									<c:choose>

										<c:when test="${not empty shorui.fileUid1}">
											<a href="/idoconfirm/download?fileUid=${shorui.fileUid1}">定期コピー</a>
										</c:when>
										<c:otherwise>
                        添付なし
                    </c:otherwise>
									</c:choose>
								</div>
							</div>


							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">初回定期期間</div>
								<div class="form_Normal">
									<c:choose>
										<c:when test="${shorui.firstTeikiKikan == '1'}">1カ月</c:when>
										<c:when test="${shorui.firstTeikiKikan == '3'}">3カ月</c:when>
										<c:when test="${shorui.firstTeikiKikan == '6'}">6カ月</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="form_Text1" id="form_Text3">
								<div class="form_Column">次回以降定期期間</div>
								<div class="form_Normal">
									<c:choose>
										<c:when test="${shorui.nextTeikiKikan == '1'}">1カ月</c:when>
										<c:when test="${shorui.nextTeikiKikan == '3'}">3カ月</c:when>
										<c:when test="${shorui.nextTeikiKikan == '6'}">6カ月</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</div>
							</div>

						</div>
					</div>

				</c:if>

				<c:choose>
					<c:when test="${keiro.tsukinShudanKbn eq '1'}">
						<c:url var="keiroEditUrl" value="/keiroinput/07_keirodtInput">
							<c:param name="kigyoCd" value="${jyohou.kigyoCd}" />
							<c:param name="shinseiNo" value="${jyohou.shinseiNo}" />
							<c:param name="keiroNo" value="${keiro.keiroSeq}" />
						</c:url>
					</c:when>
					<c:when test="${keiro.tsukinShudanKbn eq '2'}">
						<c:url var="keiroEditUrl" value="/keiroinput/07_keirodtInput_02">
							<c:param name="kigyoCd" value="${jyohou.kigyoCd}" />
							<c:param name="shinseiNo" value="${jyohou.shinseiNo}" />
							<c:param name="keiroNo" value="${keiro.keiroSeq}" />
						</c:url>
					</c:when>
					<c:when test="${keiro.tsukinShudanKbn eq '3'}">
						<c:url var="keiroEditUrl" value="/keiroinput/07_keirodtInput_03">
							<c:param name="kigyoCd" value="${jyohou.kigyoCd}" />
							<c:param name="shinseiNo" value="${jyohou.shinseiNo}" />
							<c:param name="keiroNo" value="${keiro.keiroSeq}" />
						</c:url>
					</c:when>
					<c:when test="${keiro.tsukinShudanKbn eq '6'}">
						<c:url var="keiroEditUrl" value="/keiroinput/07_keirodtInput_04">
							<c:param name="kigyoCd" value="${jyohou.kigyoCd}" />
							<c:param name="shinseiNo" value="${jyohou.shinseiNo}" />
							<c:param name="keiroNo" value="${keiro.keiroSeq}" />
						</c:url>
					</c:when>
					<c:otherwise>
						<c:url var="keiroEditUrl" value="/keiroinput/06_keirodtInput">
							<c:param name="kigyoCd" value="${jyohou.kigyoCd}" />
							<c:param name="shinseiNo" value="${jyohou.shinseiNo}" />
							<c:param name="keiroNo" value="${keiro.keiroSeq}" />
						</c:url>
					</c:otherwise>
				</c:choose>

				<div class="button_Right">
					<div class="button_Right_Group">
						<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01"
							style="cursor: pointer;"
							onclick="location.href='${keiroEditUrl}'">
					</div>
				</div>

			</c:forEach>

			<!-- 기타 테이블 (dummy) -->
			<div class="content_Form1">
				<div class="form_Text1" style="display: flex;">
					<div class="form_Column" style="width: 100px;">その他</div>
					<div class="form_Normal" style="width: 450px;">
						<a href="#" style="color: blue; text-decoration: underline;">${empty shorui.etcFileUid1 ? '' : shorui.etcFileUid1}</a>
					</div>
					<div class="form_Normal" style="width: 460px;"> ${empty shorui.etcComment1 ? '' : shorui.etcComment1}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" style="display: flex;">
					<div class="form_Column" style="width: 100px;">その他</div>
					<div class="form_Normal" style="width: 450px;">
						<a href="#" style="color: blue; text-decoration: underline;">${empty shorui.etcFileUid2 ? '' : shorui.etcFileUid2}</a>
					</div>
					<div class="form_Normal" style="width: 460px;">${empty shorui.etcComment2 ? '' : shorui.etcComment2}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" style="display: flex;">
					<div class="form_Column" style="width: 100px;">その他</div>
					<div class="form_Normal" style="width: 450px;">
						<a href="#" style="color: blue; text-decoration: underline;">${empty shorui.etcFileUid3 ? '' : shorui.etcFileUid3}</a>
					</div>
					<div class="form_Normal" style="width: 460px;">${empty shorui.etcComment3 ? '' : shorui.etcComment3}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" style="display: flex;">
					<div class="form_Column" style="width: 100px;">その他</div>
					<div class="form_Normal" style="width: 450px;">
						<a href="#" style="color: blue; text-decoration: underline;">${empty shorui.etcFileUid4 ? '' : shorui.etcFileUid4}</a>
					</div>
					<div class="form_Normal" style="width: 460px;">${empty shorui.etcComment4 ? '' : shorui.etcComment4}</div>
				</div>
			</div>

			<div class="content_Form1">
				<div class="form_Text1" style="display: flex;">
					<div class="form_Column" style="width: 100px;">その他</div>
					<div class="form_Normal" style="width: 450px;">
						<a href="#" style="color: blue; text-decoration: underline;">${empty shorui.etcFileUid5 ? '' : shorui.etcFileUid5}</a>
					</div>
					<div class="form_Normal" style="width: 460px;">${empty shorui.etcComment5 ? '' : shorui.etcComment5}</div>
				</div>
			</div>

			<c:url var="huzuiUrl" value="/idoconfirm/huzuikanri">
				<c:param name="kigyoCd" value="${shinseiJyohou.kigyoCd}" />
				<c:param name="shinseiNo" value="${shinseiJyohou.shinseiNo}" />
			</c:url>


			<div class="button_Right">
				<div class="button_Right_Group">
					<img src="/resources/img/tn/shusei_btn01.gif" alt="shusei_btn01"
						style="cursor: pointer;" onclick="location.href='${huzuiUrl}'">
				</div>
			</div>

			<!-- ===== 申請区分 섹션 ===== -->
			<div class="content_Form1">
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請区分</div>
					<div class="form_Normal">${empty jyohou.shinseiKbn ? '' : jyohou.shinseiKbn}</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">申請理由</div>
					<div class="form_Normal">

						<textarea id="shinseiRiyuInput" name="shinseiRiyu"
							style="width: 100%; min-height: 60px; border: 1px solid #ccc; padding: 5px;">${empty jyohou.riyu ? '' : jyohou.riyu}</textarea>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">離納日／移転日</div>
					<div class="form_Normal">
						${empty jyohou.idoYmd ? '' : jyohou.idoYmd}
						<c:if test="${not empty jyohou.itenYmd}"> / ${jyohou.itenYmd}</c:if>
					</div>
				</div>
				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">転入日</div>
					<div class="form_Normal">${empty jyohou.tennyuYmd ? '' : jyohou.tennyuYmd}
					</div>
				</div>

				<div class="form_Text1" id="form_Text2">
					<div class="form_Column">開始日</div>
					<div class="form_Normal">${empty jyohou.riyoStartYmd ? '' : jyohou.riyoStartYmd}
					</div>
				</div>
			</div>

			<!-- ===== 하단 버튼 (한 줄 정렬) ===== -->
			<div class="button_Side" style="margin-top: 40px;">
				<div class="button_Side_Group">
					<img src="/resources/img/back_btn01.gif" alt="back_btn01"
						onclick="submitBackForm()"> <img
						src="/resources/img/nyuryoku_btn01.gif" alt="nyuryoku_btn01"
						onclick="submitReapplyForm()">
					<c:if test="${jyohou.shinchokuKbn ne '4'}">
						<img src="/resources/img/shinsei_btn02.gif" alt="この申請を取消する"
							onclick="goToCancelPage()">
					</c:if>
				</div>
			</div>

		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>


	<form id="backForm" action="/shinsei/backFromConfirm" method="post">
		<input type="hidden" name="kigyoCd" value="${jyohou.kigyoCd}">
		<input type="hidden" name="shinseiNo" value="${jyohou.shinseiNo}">
	</form>

	<form id="reapplyForm" action="/shinsei/saishinsei" method="post">
		<input type="hidden" name="kigyoCd" value="${jyohou.kigyoCd}">
		<input type="hidden" name="shinseiNo" value="${jyohou.shinseiNo}">




		<!-- 申請理由 -->
		<input type="hidden" name="shinseiRiyu" id="shinseiRiyuHidden"
			value="">

		<!-- 郵便番号 -->
		<input type="hidden" name="newZipCd" id="newZipCdHidden" value="">

		<!-- 住所 - DB 스키마에 맞게 수정 -->
		<!-- NEW_ADDRESS_1: VARCHAR2(8) - 都道府県만 저장 -->
		<input type="hidden" name="newAddress1" id="newAddress1Hidden"
			value="">

		<!-- NEW_ADDRESS_2: VARCHAR2(200) - 市区町村+番地 -->
		<input type="hidden" name="newAddress2" id="newAddress2Hidden"
			value="">

		<!-- NEW_ADDRESS_3: VARCHAR2(200) - 建物名など -->
		<input type="hidden" name="newAddress3" id="newAddress3Hidden"
			value="">

		<!-- 実勤務日数 -->
		<input type="hidden" name="jitsuKinmuNissu" id="jitsuKinmuNissuHidden"
			value="">

		<!-- ★ 緯度経度 (DB: ADDRESS_IDO_KEIDO VARCHAR2(19)) -->
		<input type="hidden" name="addressIdoKeido" id="addressIdoKeidoHidden"
			value="">

		<!-- ★ 住所変更フラグ (DB: ADDRESS_CHG_KBN VARCHAR2(1)) -->
		<input type="hidden" name="addressChgKbn" id="addressChgKbnHidden"
			value="">

		<!-- ★ 修正前 緯度経度 (比較用, DBに送信しない) -->
		<input type="hidden" id="oldAddressIdoKeido"
			value="${jyohou.addressIdoKeido}">

		<!-- ★ 勤務地 緯度経度 (DB: KINMU_ADDRESS_IDO_KEIDO VARCHAR2(19)) -->
		<input type="hidden" name="kinmuAddressIdoKeido"
			id="kinmuAddressIdoKeidoHidden" value="">

		<!-- ★ 勤務地 住所変更フラグ (DB: KINMU_ADDRESS_CHG_KBN VARCHAR2(1)) -->
		<input type="hidden" name="kinmuAddressChgKbn"
			id="kinmuAddressChgKbnHidden" value="">

		<!-- ★ 修正前 勤務地 緯度経度 (비교용, DB에는 안 보냄) -->
		<input type="hidden" id="oldKinmuAddressIdoKeido"
			value="${jyohou.kinmuAddressIdoKeido}">

	</form>

	<script type="text/javascript">
		window.addEventListener('load', function() {
			if (typeof AjaxZip3 === 'undefined') {
				console.error('AjaxZip3가 로드되지 않았습니다.');
			} else {
				console.log('AjaxZip3 로드 성공');
			}

			if (typeof openAddressCheck === 'function') {
				console.log('openAddressCheck 함수가 정상적으로 정의되었습니다.');
			} else {
				console.error('openAddressCheck 함수를 찾을 수 없습니다.');
			}
		});
	</script>
</body>
</html>