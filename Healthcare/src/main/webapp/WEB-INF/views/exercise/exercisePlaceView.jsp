<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=n_ZxRkO2ivuJYTV3q96V&submodules=geocoder"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>운동 장소 검색</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=n_ZxRkO2ivuJYTV3q96V"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		var map = new naver.maps.Map("map", { //new naver.maps.Map(mapDiv, mapOptions) 지도인스턴스 정의 옵션  mapDiv html 엘리먼트,mapOptions 지도의 옵션 객체
		    zoom: 10, //지도 줌 레벨
		    mapTypeControl: true//지도유형 컨트롤의 표시 여부
		});
		
		var infoWindow = new naver.maps.InfoWindow({//클래스는 지도 위에 올리는 정보 창을 정의합니다.
		    anchorSkew: true,//기본 말풍선 꼬리의 기울임(skew) 효과 사용 여부입니다.
		    backgroundColor: "#eee",
		    borderColor: "#2db400",
		    anchorColor: "#eee",
		});
		map.setCursor('pointer');
		// result by latlng coordinate
		function searchAddressToCoordinate(address) {//서버 API 호출시 전달하는 callback 함수의 첫 번째 매개변수로 Status 값이 전달
		    naver.maps.Service.geocode({
		        address: address
		    }, function(status, response) {
		       if (status === naver.maps.Service.Status.ERROR) {
		            return alert('잘못된 위치입니다');
		        } 

		        var item = response.result.items[0],
		            point = new naver.maps.Point(item.point.x, item.point.y);

		        infoWindow.setContent([
		                '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                '<h4 style="margin-top:5px;">예정 장소 : '+ response.result.userquery +'</h4><br />',
		                '</div>'
		            ].join('\n'));
		        map.setCenter(point);
		        infoWindow.open(map, point);
		    });
		}
		function initGeocoder() {
		    searchAddressToCoordinate($("#exercisePlaceView",opener.document).val());
		}
		naver.maps.onJSContentLoaded = initGeocoder;
		});
</script>
	
</head>
<body>
	<div id="map" style="width:100%;height:430px;"></div>
</body>
</html>