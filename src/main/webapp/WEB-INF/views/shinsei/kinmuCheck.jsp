<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>勤務地確認</title>
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

	<h2>勤務地確認</h2>

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
		<button type="button" class="btn btn-primary" onclick="applyKinmu()">決定</button>
		<button type="button" class="btn" onclick="window.close()">キャンセル</button>
	</div>

	<script type="text/javascript">

	var urlParams = new URLSearchParams(window.location.search);
	var zip  = urlParams.get('zip')  || '';
	var pref = urlParams.get('pref') || '';
	var addr1 = urlParams.get('addr1') || '';
	var addr2 = urlParams.get('addr2') || '';


	document.getElementById('displayZip').textContent  = zip;
	document.getElementById('displayPref').textContent = pref;
	document.getElementById('displayAddr1').textContent = addr1;
	document.getElementById('displayAddr2').textContent = addr2;

	
	var fullAddress = [pref, addr1, addr2].filter(function(v){ return v && v.trim() !== ''; }).join(' ');

	console.log('受信した住所(勤務地):', fullAddress);   

	var map;
	var marker;
	var latitude = null;
	var longitude = null;

function initMap() {
    var defaultPosition = [35.6812, 139.7671];
    map = L.map('map').setView(defaultPosition, 15);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors'
    }).addTo(map);

    marker = L.marker(defaultPosition).addTo(map);
    geocodeAddress(fullAddress);
}

function geocodeAddress(address) {
    if (!address || address.trim() === '') {
        showError('住所が入力されていません。');
        document.getElementById('displayLatLng').textContent = '住所未入力';
        return;
    }

    console.log('ジオコーディング開始(勤務地):', address); 

    var apiUrl =
        'https://nominatim.openstreetmap.org/search?format=json&q=' +
        encodeURIComponent(address) +
        '&countrycodes=jp&limit=1';

    fetch(apiUrl)
        .then(function(resp) {
            if (!resp.ok) {
                throw new Error('API呼び出しに失敗しました');
            }
            return resp.json();
        })
        .then(function(data) {
            console.log('API応答(勤務地):', data);  

            if (data && data.length > 0) {
                latitude = parseFloat(data[0].lat);
                longitude = parseFloat(data[0].lon);
                var newPos = [latitude, longitude];

                map.setView(newPos, 16);
                marker.setLatLng(newPos);

                document.getElementById('displayLatLng').textContent =
                    latitude.toFixed(6) + ', ' + longitude.toFixed(6);
                document.getElementById('displayLatLng').style.color = '#4CAF50';

                showSuccess('緯度経度の取得に成功しました。');
            } else {
                showError('住所から緯度経度を取得できませんでした。');
                document.getElementById('displayLatLng').textContent = '取得失敗';
                document.getElementById('displayLatLng').style.color = 'red';
            }
        })
        .catch(function(error) {
            console.error('エラー(勤務地):', error);
            showError('エラー発生: ' + error.message);
            document.getElementById('displayLatLng').textContent = 'エラー';
            document.getElementById('displayLatLng').style.color = 'red';
        });
}



function showError(msg) {
    document.getElementById('errorMessage').textContent = msg;
    document.getElementById('errorMessage').style.display = 'block';
    document.getElementById('successMessage').style.display = 'none';
}

function showSuccess(msg) {
    document.getElementById('successMessage').textContent = msg;
    document.getElementById('successMessage').style.display = 'block';
    document.getElementById('errorMessage').style.display = 'none';
}


function applyKinmu() {
    if (latitude === null || longitude === null) {
        alert('緯度経度の取得に失敗しました。');
        return;
    }

    if (window.opener && !window.opener.closed) {
        try {
          
            window.opener.applyKinmuFromCheck(latitude, longitude);

            setTimeout(function() {
                window.close();
            }, 500);
        } catch (e) {
            alert('親画面への送信に失敗しました: ' + e.message);
        }
    } else {
        alert('親画面が見つかりません。');
    }
}

window.onload = function() {
    initMap();
};
</script>

</body>
</html>
