<!-- 윤종운 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content_Form2" id="menkyoshoSection">
	<div class="form_Title2">
		<div>免許証</div>
		<div class="toggle-link" style="display: flex; gap: 5px; cursor: pointer;" onclick="toggleInput('menkyoshoInputArea')">
			<img src="/resources/img/pencil_icon.gif" alt="bg_subtitle">
			<div>変更する</div> </div>
	</div>
	
	<div class="form_Text1" id="menkyoshoDisplayArea">
		<div class="form_Column">免許証コピー</div>
		<div class="form_Normal">表示</div> <div class="form_Normal">
			 現在データ: ${formData.currentMenkyoData}
		</div>
	</div>

	<div id="menkyoshoInputArea" style="display: none;"> <div class="form_Text1">
			<div class="form_Column">免許証コピー</div>
			<div class="form_Normal">
				<input type="text" name="menkyoCopyFileUid">
				<input type="button" value="参照">
				<input type="button" value="アップロード">
			</div>
			</div>
	</div>
</div>