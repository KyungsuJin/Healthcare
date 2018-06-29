<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.form-group{ padding-bottom: 0px; margin: 0px 0 0 0 !important; }
		.div{ padding-left: 0px; padding-right: 0px; }
	</style>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=QISM4er6cEE21gYJHlUg&submodules=geocoder"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#removeBtn").click(function(){
				if(opener != null){
					opener.medicalForm = null
					self.close();
				}
				
			});
			
			//naver 지도 api
			var map = new naver.maps.Map("map", {
			    center: new naver.maps.LatLng(35.853386500000,127.122277500000),
			    zoom: 10,
			    mapTypeControl: true
			});
			
			var marker;
			
			map.setCursor('pointer');

			// result by latlng coordinate
			function searchAddressToCoordinate(address) {
			    naver.maps.Service.geocode({
			        address: address
			    }, function(status, response) {
			        if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }
			        var item = response.result.items[0],
			            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
			            point = new naver.maps.Point(item.point.x, item.point.y);
		            console.log("x : " + item.point.x);
		            console.log("y : " + item.point.y);
		            if(marker == null){
		            	marker = new naver.maps.Marker({
			                position: new naver.maps.LatLng(item.point.y, item.point.x),
			                map: map
			            });
		            } else{
		            	marker.setPosition(new naver.maps.LatLng(item.point.y, item.point.x));
		            }
		            
		            marker.setMap(map);
			        map.setCenter(point);
			    });
			}

			function initGeocoder() { }
			naver.maps.onJSContentLoaded = initGeocoder;
			setTimeout(function() {
				$('#medicalMapName').val(opener.document.medicalMapForm.medicalMapName.value);
				$('#medicalMapType').val(opener.document.medicalMapForm.medicalMapType.value);
				$('#medicalMapTel').val(opener.document.medicalMapForm.medicalMapTel.value);
				$('#medicalMapAddress').val(opener.document.medicalMapForm.medicalMapAddress.value);
				searchAddressToCoordinate(opener.document.medicalMapForm.medicalMapAddress.value);
			}, 500);
		});
	</script>	
</head>
<body>
	<div id="map" style="width:100%;height:400px;"></div>
	<div class='row'>
		<div class='col-xs-12'>
			<div class='col-xs-12'>
				<div class='col-xs-2'>
					이름
				</div>
				<div class='col-xs-4'>
					<input type='text' id='medicalMapName' class='form-control' readonly>
				</div>
				<div class='col-xs-2'>
					종류
				</div>
				<div class='col-xs-4'>
					<input type='text' id='medicalMapType' class='form-control' readonly>
				</div>
			</div>
			<div class='col-xs-12'>
				<div class='col-xs-2'>
					전화번호
				</div>
				<div class='col-xs-5'>
					<input type='text' id='medicalMapTel' class='form-control' readonly>
				</div>
			</div>
			<div class='col-xs-12'>
				<div class='col-xs-2'>
					주소
				</div>
				<div class='col-xs-10'>
					<input type='text' id='medicalMapAddress' class='form-control' readonly>
				</div>
			</div>
			<div class='col-xs-1 col-xs-offset-5'>
				<input type="button" id="removeBtn" class="btn btn-primary" value="닫기">
			</div>
		</div>
	</div>
	
</body>
</html>