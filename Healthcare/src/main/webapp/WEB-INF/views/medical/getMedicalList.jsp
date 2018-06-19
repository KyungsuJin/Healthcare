<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#cityName{ width : 100px; }
	#districtName{ width : 100px; }
	#medicalList{ overflow:scroll; width:800px; height:500px; }
	#containerMedical{ width: 1000px; margin: auto; }
</style>
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=QISM4er6cEE21gYJHlUg&submodules=geocoder"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=n_ZxRkO2ivuJYTV3q96V&submodules=geocoder"></script>
<script>
	$(document).ready(function(){
		
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
		
		$(document).on('click', '#showGeo', function() {
	        console.log($(this).closest('td').siblings('#medicalAddress'));
	        searchAddressToCoordinate($(this).closest('td').siblings('#medicalAddress').text());
	    });
		
		$("#cityName").change(function(){
			$("#districtName").text("");
			console.log($("#cityName"));
			var addressValue = $("#cityName")[0].value;
			$.ajax({
		    	url : '${pageContext.request.contextPath}/getDistrictList',
		        type : 'POST',
		        data : { cityName : addressValue },
		        dataType : 'json',
		        success : function(data) {
		        	$.each(data.districtList, function(idx, val) {
		        		$("#districtName").append("<option value=" + val.districtName + ">" + val.districtName + "</option>");
		        	});
		        },
		        error : function() { console.log('error');}
			});
		});
		
		$("#medicalBtn").click(function(){ 
			$("#medicalList").text("");
			var addressValue = $("#cityName")[0].value + " " + $("#districtName")[0].value;
			var medicalValue = $("#medicalName").val();
 			$.ajax({
		    	url : '${pageContext.request.contextPath}/getMedicalAddressList',
		        type : 'POST',
		        data : 	{ 
			        		medicalAddress : addressValue 
			        		,medicalName : medicalValue
		        		},
		        dataType : 'json',
		        success : function(data) {
		        	$.each(data.medicalList, function(idx, val) {
		        		$("#medicalList").append("<tr><td>" + val.medicalName + "</td>"
													+"<td>" + val.medicalType + "</td>"
													+"<td id='medicalAddress'>" + val.medicalAddress + "</td>"
													+"<td>" + val.medicalTel + "</td>"
													+"<td><input type='button' id='showGeo' value='위치보기'></td></tr>");
		        	});
		        	
		        },
		        error : function() { console.log('error');}
			});
		});		

	});
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedical" align="center">
		<h1>MedicalList</h1>
		
		<table>
			<tr>
				<td>
					시
					<select id="cityName" name="cityName">
						<c:forEach var = "city" items = "${cityList}">
							<option value="${city.cityName}">
								${city.cityName}
							</option>	
						</c:forEach>
					</select>
				</td>
				<td>	
					<select id="districtName" name="districtName"></select>
					
					병원 명 : <input type="text" id="medicalName" name="medicalName">
					<input type="button" id="medicalBtn" name="medicalBtn" value="검색">
				</td>
			</tr>
		</table>
		<div id="map" style="width:100%;height:400px;"></div>
		<div id="medicalList"></div>
		
	</div>

</body>
</html>