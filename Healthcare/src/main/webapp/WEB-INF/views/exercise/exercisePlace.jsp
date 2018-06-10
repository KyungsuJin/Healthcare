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
		  /*   center: new naver.maps.LatLng(37.3595316, 127.1052133), */// center (지도의 중심좌표): 위도 경도를 나타냄 LatLng(lat 위도,lan 경도)
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

		// search by tm128 coordinate
		function searchCoordinateToAddress(latlng) {
		    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);//객체는 여러 가지의 좌표 체계 사이의 변환을 수행하는 메서드   fromLatLngToTM128(latlng): 지정한 위/경도 좌표에 해당하는 TM128 좌표를 반환합니다.
		    console.log(tm128);

		    infoWindow.close(); //사용자 정보창 닫음

		    naver.maps.Service.reverseGeocode({//주소->좌표 검색 (geocode), 좌표->주소 검색 (reversegeocode) API를 호출
		        location: tm128,//location 파라미터는 검색할 좌표
		        coordType: naver.maps.Service.CoordType.TM128
		    }, function(status, response) {// 첫번째 매개변수  ServiceOptions 객체에 location 파라미터를 추가한 options를 전달
		        if (status === naver.maps.Service.Status.ERROR) {//두 번째 매개변수는 요청의 결과를 처리할 callback 함수
		            return alert('주소를 정확히 입력해주세요!');
		        }

		        var items = response.result.items,
		            htmlAddresses = [];
					/* console.log(items[0].address); */

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
		        }
		       $("#htmlAddressesChk").val(items[0].address);
		       console.log(  " click val() = "+$("#htmlAddressesChk").val());

		        infoWindow.setContent([
		                '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                	htmlAddresses.join('<br />'),
		                '</div>'
		            ].join('\n'));

		        infoWindow.open(map, latlng);
		    });
		}
		
		// result by latlng coordinate
		function searchAddressToCoordinate(address) {//서버 API 호출시 전달하는 callback 함수의 첫 번째 매개변수로 Status 값이 전달
		    naver.maps.Service.geocode({
		        address: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('주소를 정확히 입력해주세요!');
		        }

		        var item = response.result.items[0],
		            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
		            point = new naver.maps.Point(item.point.x, item.point.y);
		            
		           /*  console.log(item.address); */
		            $("#htmlAddressesChk").val(item.address);
				       console.log(  "val() = "+$("#htmlAddressesChk").val());

		        infoWindow.setContent([
		                '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
		                addrType +' '+ item.address +'<br />',
		                '</div>'
		            ].join('\n'));


		        map.setCenter(point);
		        infoWindow.open(map, point);
		        console.log("point : "+point)
		    });
		}

		function initGeocoder() {
		    map.addListener('click', function(e) {
		        searchCoordinateToAddress(e.coord);
		    });

		    $('#address').on('keydown', function(e) {
		        var keyCode = e.which;
		        if (keyCode === 13) { // Enter Key
		            searchAddressToCoordinate($('#address').val());
		        }
		    });
		    $('#submit').on('click', function(e) {
		        e.preventDefault();
		        searchAddressToCoordinate($('#address').val());
		    });
		    searchAddressToCoordinate('전북 전주시 덕진구 기린대로 446');
		}
		naver.maps.onJSContentLoaded = initGeocoder;
		$("#chk").click(function(){
			window.opener.document.addExerciseForm.exercisePlace.value=$("#htmlAddressesChk").val();
			window.close();
		});
		});
</script>
	
</head>
<body>
	<div id="map" style="width:100%;height:400px;"></div>
	<input type="hidden" id="htmlAddressesChk">
	<input id="address" type="text" placeholder="운동 장소 검색" value="">
	<input id="submit" type="button" value="위치 검색">
	<button type="button" id="chk">위치 확정</button>
</body>
</html>