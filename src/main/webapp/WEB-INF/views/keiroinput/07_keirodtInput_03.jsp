<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>

<style>

.flow-wrapper {
	display: flex;
	gap: 16px;
	justify-content: center;
	align-items: center;
}

.flow-current {
	position: relative;
	flex: 1 1 0;
	min-width: 0;
	width: 100%;
	height: 100px;
	background-image: url('<c:url value="/resources/img/bg_flow_01.gif"/>');
	background-size: auto;
	background-position: center;
	background-repeat: no-repeat;
}

.flow-other {
	position: relative;
	flex: 1 1 0;
	min-width: 0;
	width: 100%;
	height: 100px;
	background-image: url('<c:url value="/resources/img/bg_flow_02.gif"/>');
	background-size: auto;
	background-position: center;
	background-repeat: no-repeat;
}

.flow-currenttext {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: clamp(12px, 2vw, 7px);
	font-weight: 700;
	text-align: center;
}

.flow-othertext {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #808080;
	font-size: clamp(12px, 2vw, 7px);
	font-weight: 700;
	text-align: center;
}

.station-background {
	position : relative;
	width : 40%;
	height : 200px;
	background-color: #cecece;
	background-size : auto;
	backgorund-position : left;
	background-repeat: no-repeat;
}

p　{
	text-align: center;
}



.form_Text1 {
	display: grid;
	grid-template-columns: 1fr 5fr;
	
}

.form_Normal {
	border-right: solid 1px #a0a0a0;
	border-bottom: solid 1px #a0a0a0;
}


.form_Column1 {
	background-color: #dddddd;
	text-align: center;
	border: 1px solid #FFFFFF;
	
}

.form_Column1 p {
	background-color: #dddddd;
	text-align: center;
	
}

.form_Column2 {
	background-color: #dddddd;
	text-align: center;
	border: 1px solid #FFFFFF;
}


.form_Column2 p {
	background-color: #dddddd;
	text-align: left;
	
}


#content1 {
	font-size: 13px;
	display: flex;
	flex-direction: column;
	align-items: center; /* 전체를 가운데 정렬 */
	gap: 15px;
	margin-top: 30px;
}

#content1>div {
	display: flex;
	align-items: center;
	
}

#content1>div>div:first-child {
	
}


#content1>div>div:last-child {
	flex: 1;
}

#content1 img {
	cursor: pointer;
	display: block;
}

#content2 {
	font-size: 13px;
	
	flex-direction: column;
	align-items: left; 
	gap: 15px;
	margin-top: 5px;
}

#content2>div {
	display: flex;
	align-items: center;
	
}

#content2>div>div:first-child {
	
}


#content2>div>div:last-child {
	flex: 1;
}

#content2 img {
	cursor: pointer;
	/* display: block; */
}

.transport-wrapper {
	display: flex;
	justify-content: center; align-items : center;
	width: 100%;
	min-width: 500px;
	align-items: center;
}

.transport {
	padding: 0.3rem;
	padding-left: 10px; 
	margin: 1rem;
	text-align: left;
	font-weight: bold;
	border-left: 4px solid #666;
	border-bottom: 1px dotted #999;
	padding-bottom: 4px;
	color: #333;
	width: 90%;
}

.text {
	font-size: 13px;
}

.table {
	border: 1px solid;
	
}


.result-box {
	width: 1000px;
	margin: auto;
	border: 1px solid #ccc;
	display: flex;
	flex-direction: column;
	background-color: #fff;
}

.result-box>div:first-child {
	width: 100%; background-color : #595860; color : #fff; font-weight :
	bold; display : flex; align-items : center; padding : 8px 12px;
	font-size : 14px; height : 31px;
	box-sizing: border-box;
	height: 31px;
	font-size: 14px;
	padding: 8px 12px;
	align-items: center;
	display: flex;
	font-weight: bold;
	color: #fff;
	background-color: #595860;
}

.result-box>div:first-child input[type="radio"] {
	margin-right: 6px;
}

.result-box>div:last-child {
	width: 100%; height : 275px;
	overflow: hidden;
	height: 275px;
}

.result-box>div>img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 비율 맞추며 꽉 채움 */
	display: block;
}
</style>

<body>
	<div class="layout">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="main">
			<div class="main_Content">
				<!-- 진척도 예제 -->
				<div class = "flow">
					<div class = "flow_others">勤務地入力</div>
					<div class = "flow_others">住所入力</div>
					<div class = "flow_current">経路入力</div>
					<div class = "flow_others">付随書類入力</div>
					<div class = "flow_others">確認</div>
					<div class = "flow_others">完了</div>
				</div>
				
				<div class="subtitle">【経路③】　経路詳細　入力</div>
				
				<div class="transport-wrapper">
					<div class="transport">手段：自動車</div>
				</div>
				
				<div class="text">
					<div>自動車の場合、1ヶ月通勤費支給額の上限は</div>
					<div>社宅を利用されている方		・・・		13.300円／月</div>
					<div>社宅を利用されていない方		・・・		39.700円／月</div>
					<div>です。ご注意ください</div>
				</div>
				
				<div class="table">
					<div class="form_Text1">
						<div class="form_Column1"><p>住所</p></div>
						<div class="form_Normal"><p>${addr.newAddress1}${addr.newAddress2}${addr.newAddress3}</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>勤務地</p></div>
						<div class="form_Normal"><p>${kinmuAddr.newKinmuAddress1}${kinmuAddr.newKinmuAddress2}${kinmuAddr.newKinmuAddress3}</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>経由地</p></div>
						<div style="padding:1rem;">
							<input id="viaPlace1Input" style="width:100%;" type="text" />
						</div>
					</div>
				</div>
				
				

				<div class="content1" id="content1">
					<div>
						<div>上記の住所から勤務地までを検索します。</div>
						<div><img src="/resources/img/tn/search_btn01.gif" alt=search_btn01></div>				
					</div>
					
				</div>
				
				
				
				<div class="text">一般経路で距離：　22km</div>
				
				
				<div class="result-box">
				<div>
					<input type="radio" name="result1" value="1" />検索結果 1
				</div>
				<div class="text">有料道路を利用しないルート</div>
				<div>
					<img src="/resources/img/tn/image_map_02.jpg">
				</div>
				</div>
				<div class="result-box">
				<div>
					<input type="radio" name="result1" value="1" />検索結果 2
				</div>
				<div class="text">有料道路を利用するルート</div>
				<div>
					<img src="/resources/img/tn/image_map_02.jpg">
				</div>
			</div>
			</div>
				<!--　検索結果１ -->
				<!-- 検索結果のimg1 -->
				<!--　検索結果2 -->
				<!-- 検索結果のimg2 -->
				
				<div class="table">
					<div class="form_Text1">
						<div class="form_Column1"><p>距離</p></div>
						<div class="form_Normal"><p>30km</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路</p></div>
						<div class="form_Normal"><p>利用する</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路無料</p><p>片道／往復</p></div>
						<div>
							<input type="radio">片道利用　 <input type="radio">往復利用 
						</div>
					</div>
				</div>
				
				<div class="table">
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路IC 乗り口</p></div>
						<div class="form_Normal"><p>下作延IC</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路IC  降り口</p></div>
						<div class="form_Normal"><p>用賀IC</p></div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路    片道料金</p></div>
						<div><p>600円</p></div>
					</div>
				</div>
				
				
				<div class="table">
					<div class="form_Text1">
						<div class="form_Column1"><p>有料道路利用理由</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:100%;" type>
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column1"><p>経由地入力理由</p></div>
						<div style="padding:1rem;">
							<input style="width:100%;" type>
						</div>
					</div>
					
				</div>
				
				<div class="text">
				<div>原則、当画面で検索された推奨ルートで申請してください。</div>
				<div>ただし、理由があって別ルートで申請した場合、このwebサイトで検索し、</div>
				<div>検索結果画面のアップロード、および必要事項を入力してください。</div>
				<br>
				<div>別ルート検索はこちらから　〈外部サイトが開きます〉　<a href=http://www.navitime.co.jp/>http://www.navitime.co.jp</a></div>
				</div>
				<br>
				
				<div id="content2">
					<img src="/resources/img/root_btn01.gif" alt=root_btn01>
				</div>
				
				
				
				<div class="table">
					<div class="form_Text1">
						<div class="form_Column2"><p>検索結果画面</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:25%;" type> &nbsp;<button>参照</button>&nbsp;<button>アップロード</button>
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>距離</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:20%;" type> km
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>有料道路IC　乗り口</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:50%;" type>
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>有料道路IC　降り口</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:50%;" type>
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>有料道路片道料金</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:20%;" type> 円
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>別ルート　理由</p></div>
						<div class="form_Normal" style="padding:1rem;">
							<input style="width:100%;" type>
						</div>
					</div>
					<div class="form_Text1">
						<div class="form_Column2"><p>有料道路無料</p><p>片道／往復</p></div>
						<div>
							<input type="radio">片道利用　 <input type="radio">往復利用 
						</div>
					</div>
				</div>
				
				
				
				<div id="content2">
					<img src="/resources/img/back_btn01.gif" alt=back_btn01 id="btnBack">
					<img src="/resources/img/keiro_btn02.gif" alt=keiro_btn02>
					<img src="/resources/img/hozon_btn01.gif" alt=hozon_btn01>
				</div>
			</div>
			
			
			
			
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	
	
	<script>

    (function () {
        var backBtn = document.getElementById('btnBack');
        if (!backBtn) {
            return;
        }

        backBtn.addEventListener('click', function () {
            if (document.referrer) {
                location.href = document.referrer;
                return;
            }
            if (history.length > 1) {
                history.go(-1);
                return;
            }
            location.href = '/';
        });
    })();



    
	</script>
	
	<script>
  window.addEventListener('DOMContentLoaded', function () {
    var input = document.getElementById('viaPlace1Input');
    if (!input) {
      console.log('viaPlace1Input not found');
      return;
    }

    input.addEventListener('change', function () {
      var value = input.value;
      console.log('sending viaPlace1:', value);

      fetch('${ctx}/keiroinput/saveViaPlace1', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body: 'viaPlace1=' + encodeURIComponent(value)
      })
      .then(function (res) {
        return res.text();
      })
      .then(function (text) {
        console.log('server response:', text);
      })
      .catch(function (e) {
        console.error('fetch error', e);
      });
    });
  });
</script>

</body>

</html>