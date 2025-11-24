<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住所確認</title>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<style>
body {
	font-family: "メイリオ", Meiryo, sans-serif;
	font-size: 13px;
	padding: 20px;
	background-color: #f5f5f5;
}

h2 {
	color: #333;
	border-bottom: 2px solid #4CAF50;
	padding-bottom: 10px;
}

.address-info {
	border: 1px solid #ccc;
	padding: 15px;
	margin-bottom: 20px;
	background-color: #fff;
	border-radius: 5px;
}

.info-row {
	display: flex;
	margin-bottom: 10px;
	padding: 5px 0;
}

.info-label {
	width: 120px;
	font-weight: bold;
	color: #333;
}

.info-value {
	flex: 1;
	color: #666;
}

#map {
	width: 100%;
	height: 400px;
	border: 2px solid #4CAF50;
	margin-bottom: 20px;
	border-radius: 5px;
}

.button-area {
	text-align: center;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.btn {
	padding: 10px 40px;
	margin: 0 10px;
	font-size: 14px;
	cursor: pointer;
	border: 1px solid #ccc;
	background: #f3f3f3;
	border-radius: 3px;
}

.btn:hover {
	background: #e0e0e0;
}

.btn-primary {
	background: #4CAF50;
	color: white;
	border: none;
	font-weight: bold;
}

.btn-primary:hover {
	background: #45a049;
}

.error-message {
	color: red;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #ffe6e6;
	border: 1px solid red;
	border-radius: 3px;
	display: none;
}

.success-message {
	color: green;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #e6ffe6;
	border: 1px solid green;
	border-radius: 3px;
	display: none;
}
</style>
</head>
<body>
	<h2 id="pageTitle">住所確認</h2>

	<div id="errorMessage" class="error-message"></div>
	<div id="successMessage" class="success-message"></div>

	<div class="address-info">
		<div class="info-row">
			<div class="info-label">郵便番号:</div>
			<div class="info-value" id="displayZip"></div>
		</div>
		<div class="info-row">
			<div class="info-label">都道府県:</div>
			<div class="info-value" id="displayPref"></div>
		</div>
		<div class="info-row">
			<div class="info-label">住所1:</div>
			<div class="info-value" id="displayAddr1"></div>
		</div>
		<div class="info-row">
			<div class="info-label">住所2:</div>
			<div class="info-value" id="displayAddr2"></div>
		</div>
		<div class="info-row">
			<div class="info-label">緯度経度:</div>
			<div class="info-value" id="displayLatLng"
				style="font-weight: bold; color: #4CAF50;">取得中...</div>
		</div>
	</div>

	<div id="map"></div>

	<div class="button-area">
		<button type="button" class="btn btn-primary" onclick="applyAddress()">決定</button>
		<button type="button" class="btn" onclick="window.close()">キャンセル</button>
	</div>

	<script type="text/javascript">
        //<![CDATA[
        var map;
        var marker;
        var latitude = null;
        var longitude = null;

      
        var urlParams = new URLSearchParams(window.location.search);
        var zip = urlParams.get('zip') || '';
        var pref = urlParams.get('pref') || '';
        var addr1 = urlParams.get('addr1') || '';
        var addr2 = urlParams.get('addr2') || '';
       
        var mode = urlParams.get('mode') || '';
     
        var pageTitleElem = document.getElementById('pageTitle');
        if (mode === 'kinmu') {
         
            document.title = '勤務地確認';
            if (pageTitleElem) {
                pageTitleElem.textContent = '勤務地確認';
            }
        } else {
    
            document.title = '住所確認';
            if (pageTitleElem) {
                pageTitleElem.textContent = '住所確認';
            }
        }
     
        document.getElementById('displayZip').textContent = zip;
        document.getElementById('displayPref').textContent = pref;
        document.getElementById('displayAddr1').textContent = addr1;
        document.getElementById('displayAddr2').textContent = addr2;

        // 完全な住所文字列
        var fullAddress = pref + addr1 + addr2;

        console.log('受信した住所:', fullAddress);
        console.log('mode =', mode);

        // OpenStreetMap 초기화
        function initMap() {
            // デフォルト位置（東京駅）
            var defaultPosition = [35.6812, 139.7671];

            map = L.map('map').setView(defaultPosition, 15);

            L.tileLayer(
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }
            ).addTo(map);

            marker = L.marker(defaultPosition).addTo(map);

            // 住所から緯度経度取得
            geocodeAddress(fullAddress);
        }

        // ジオコーディング実行
        function geocodeAddress(address) {
            if (!address || address.trim() === '') {
                showError('住所が入力されていません。');
                document.getElementById('displayLatLng').textContent = '住所未入力';
                return;
            }

            console.log('ジオコーディング開始:', address);

            // Nominatim API 호출
            var apiUrl = 'https://nominatim.openstreetmap.org/search?format=json&q='
                    + encodeURIComponent(address) + '&countrycodes=jp&limit=1';

            fetch(apiUrl)
                .then(function(response) {
                    if (!response.ok) {
                        throw new Error('API呼び出しに失敗しました');
                    }
                    return response.json();
                })
                .then(function(data) {
                    console.log('API応答:', data);

                    if (data && data.length > 0) {
                        latitude = parseFloat(data[0].lat);
                        longitude = parseFloat(data[0].lon);

                        console.log('取得した緯度経度: lat=' + latitude + ', lng=' + longitude);

                        // 地図更新
                        var newPosition = [latitude, longitude];
                        map.setView(newPosition, 16);
                        marker.setLatLng(newPosition);

                        // 緯度経度表示
                        var latLngText = latitude.toFixed(6) + ', ' + longitude.toFixed(6);
                        document.getElementById('displayLatLng').textContent = latLngText;
                        document.getElementById('displayLatLng').style.color = '#4CAF50';

                        showSuccess('緯度経度の取得に成功しました。');

                    } else {
                        showError('住所から緯度経度を取得できませんでした。住所を確認してください。');
                        document.getElementById('displayLatLng').textContent = '取得失敗';
                        document.getElementById('displayLatLng').style.color = 'red';
                    }
                })
                .catch(function(error) {
                    console.error('エラー:', error);
                    showError('エラーが発生しました: ' + error.message);
                    document.getElementById('displayLatLng').textContent = 'エラー';
                    document.getElementById('displayLatLng').style.color = 'red';
                });
        }

        // エラーメッセージ表示
        function showError(message) {
            var errorDiv = document.getElementById('errorMessage');
            errorDiv.textContent = message;
            errorDiv.style.display = 'block';

            var successDiv = document.getElementById('successMessage');
            successDiv.style.display = 'none';
        }

        // 成功メッセージ表示
        function showSuccess(message) {
            var successDiv = document.getElementById('successMessage');
            successDiv.textContent = message;
            successDiv.style.display = 'block';

            var errorDiv = document.getElementById('errorMessage');
            errorDiv.style.display = 'none';
        }

        // ★ 부모창 콜백 공통 처리
        function applyToParent(pref, addr1, addr2, lat, lng) {
            console.log('applyToParent called. mode = ' + mode);

            if (!window.opener || window.opener.closed) {
                alert('親画面が見つかりません。\nこのウィンドウを閉じて、もう一度お試しください。');
                return false;
            }

            try {
                // 勤務地モード일 때
                if (mode === 'kinmu' &&
                    typeof window.opener.applyKinmuAddressFromCheck === 'function') {

                    window.opener.applyKinmuAddressFromCheck(pref, addr1, addr2, lat, lng);
                }
                // 기본(住所용) 모드
                else if (typeof window.opener.applyAddressFromCheck === 'function') {

                    window.opener.applyAddressFromCheck(pref, addr1, addr2, lat, lng);
                }
                else {
                    alert('親画面にコールバック関数が見つかりません。');
                    return false;
                }

                return true;

            } catch (e) {
                console.error('親画面への送信エラー:', e);
                alert('親画面への送信に失敗しました。\nエラー: ' + e.message);
                return false;
            }
        }

        // 決定ボタン押下時
        function applyAddress() {
            console.log('決定ボタンクリック');

            if (latitude === null || longitude === null) {
                alert('緯度経度の取得に失敗しました。\n住所を確認して、もう一度お試しください。');
                return;
            }

            console.log('親画面に送信する値:');
            console.log('  都道府県: ' + pref);
            console.log('  住所1: ' + addr1);
            console.log('  住所2: ' + addr2);
            console.log('  緯度: ' + latitude);
            console.log('  経度: ' + longitude);

            var success = applyToParent(pref, addr1, addr2, latitude, longitude);

            if (success) {
                // 成功したら少し待ってから閉じる
                setTimeout(function() {
                    window.close();
                }, 500);
            }
        }

        // ページロード時に地図初期化
        window.onload = function() {
            console.log('ページロード完了');
            initMap();
        };
        //]]>
    </script>
</body>
</html>
