<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#cityName{ padding-left: 0px; padding-right: 0px; width:150px;}
	#districtName{ padding-left: 0px; padding-right: 0px; width:150px;}
	input[type=button]{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; }
	#medicalBtn{ margin-top:0px; margin-bottom:0px; }
	.form-group{ padding-bottom: 0px; margin: 0px 0 0 0; }
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=QISM4er6cEE21gYJHlUg&submodules=geocoder"></script>
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
		var scrollPosition = $("#map").offset().top;
		$(document).on('click', '#showGeo', function() {
			$(window).scrollTop($('#map').offset().top);
	        console.log($(this).closest('div').closest('div').siblings('#medicalAddress'));
	        searchAddressToCoordinate($(this).closest('div').closest('div').siblings('#medicalAddress').text());
	    });
		
		$("#cityName").change(function(){
			if($("#cityName").val() == "시도선택"){
				console.log("1");
				$("#districtName").text("");
				$("#districtName").append("<option>시/군/구 선택</option>");
			} else{
				getDistrictList();
			}
			
		});
		
		function getDistrictList(){
			$("#districtName").text("<option>시/군/구 선택</option>");
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
		}
		
		$("#medicalBtn").click(function(){ 
			$("#medicalList").text("");
			var addressCityName = $("#cityName")[0].value;
			var addressDistrictName = $("#districtName")[0].value;
			var medicalValue = $("#medicalName").val();
 			$.ajax({
		    	url : '${pageContext.request.contextPath}/getMedicalAddressList',
		        type : 'POST',
		        data : 	{ 
		        			cityName : addressCityName
		        			, districtName : addressDistrictName
			        		, medicalName : medicalValue
		        		},
		        dataType : 'json',
		        success : function(data) {
		        	var content;
		        	content = "<div class='col-xs-12'>";
		        	$.each(data.medicalList, function(idx, val) {
		        		content += "<div class='row' style='border-bottom:1px solid; border-bottom-color:#9c27b0;'><div class='col-xs-2'>" + val.medicalName + "</div>"
								 +"<div class='col-xs-5' id='medicalAddress'>" + val.medicalAddress + "</div>"
								 +"<div class='col-xs-1'><input type='button' id='showGeo' class='btn btn-primary' value='위치보기'></div></div>";
		        	});
 					content += "</div>";
 					content += "<div class='col-xs-3'></div>";
		        	if( data.currentPage > 10){
		        		console.log("currentPage"+data.currentPage);
		        		content += "<li><a href='#' class='addressPage' value='" + data.firstPage + "'> <span aria-hidden='true'>&laquo;</span></a></li>";
		        		content += "<li><a href='#' class='addressPage' value='" + data.beforePage + "'> <span aria-hidden='true'>&lt;</span></a></li>";
		        	}
		        	$.each(data.pageList, function(idx, val) {
		        		console.log("pageList"+val);
		        		if(val == data.currentPage){
		        			content += "<li class='active'><a>" + val + "</a></li>";
		        		} else{
		        			content += "<li><a href='#' class='addressPage' value='" + val + "'>" + val + "</a></li>";
		        		}
		        	});
		        	if(data.afterPage < data.lastPage){
		        		content += "<li><a href='#' class='addressPage' value='" + data.afterPage + "'> <span aria-hidden='true'>&gt;</span></a></li>";
		        		content += "<li><a href='#' class='addressPage' value='" + data.lastPage + "'> <span aria-hidden='true'>&raquo;</span></a></li>";
		        	}
		        	$("#medicalList").append(content);
		        },
		        error : function() { console.log('error');}
			});
		});	
		$(document).on("click",".addressPage",function(){
			$("#medicalList").text("");
			var addressCityName = $("#cityName")[0].value;
			var addressDistrictName = $("#districtName")[0].value;
			var medicalValue = $("#medicalName").val();
			var addressCurrentPage = $(this)[0].attributes[2].value;
 			$.ajax({
		    	url : '${pageContext.request.contextPath}/getMedicalAddressList',
		        type : 'POST',
		        data : 	{ 
		        			cityName : addressCityName
		        			, districtName : addressDistrictName
			        		, medicalName : medicalValue
			        		, currentPage : addressCurrentPage
		        		},
		        dataType : 'json',
		        success : function(data) {
		        	var content;
		        	content = "<div class='col-xs-12'>";
		        	$.each(data.medicalList, function(idx, val) {
		        		content += "<div class='row' style='border-bottom:1px solid; border-bottom-color:#9c27b0;'><div class='col-xs-2'>" + val.medicalName + "</div>"
								 +"<div class='col-xs-5' id='medicalAddress'>" + val.medicalAddress + "</div>"
								 +"<div class='col-xs-1'><input type='button' id='showGeo' class='btn btn-primary' value='위치보기'></div></div>";
		        	});
 					content += "</div>";
 					content += "<div class='col-xs-3'></div>";
		        	if( data.currentPage > 10){
		        		console.log("currentPage"+data.currentPage);
		        		content += "<li><a href='#' class='addressPage' value='" + data.firstPage + "'> <span aria-hidden='true'>&laquo;</span></a></li>";
		        		content += "<li><a href='#' class='addressPage' value='" + data.beforePage + "'> <span aria-hidden='true'>&lt;</span></a></li>";
		        	}
		        	$.each(data.pageList, function(idx, val) {
		        		console.log("pageList"+val);
		        		if(val == data.currentPage){
		        			content += "<li class='active'><a>" + val + "</a></li>";
		        		} else{
		        			content += "<li><a href='#' class='addressPage' value='" + val + "'>" + val + "</a></li>";
		        		}
		        	});
		        	if(data.afterPage < data.lastPage){
		        		content += "<li><a href='#' class='addressPage' value='" + data.afterPage + "'> <span aria-hidden='true'>&gt;</span></a></li>";
		        		content += "<li><a href='#' class='addressPage' value='" + data.lastPage + "'> <span aria-hidden='true'>&raquo;</span></a></li>";
		        	}
		        	$("#medicalList").append(content);
		        },
		        error : function() { console.log('error');}
			});
		});
		

	});
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="containerMedical" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2" style='padding-top: 15px; padding-bottom: 15px;'>
							<div class="card">
								<div class="card-header" data-background-color="purple"><h4 class="title">병원,약국 검색</h4></div>
								<div class="col-md-2 col-md-offset-2">
									<select id="cityName" name="cityName" class="form-control">
										<option>
											시도선택 
										</option>
										<c:forEach var = "city" items = "${cityList}">
											<option value="${city.cityName}">
												${city.cityName}
											</option>	
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2">
									<select id="districtName" name="districtName" class="form-control">
										<option>
											시/군/구 선택 
										</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" id="medicalName" class="form-control" name="medicalName" placeholder="병원 명 ex)푸른안과">
								</div>
								<div class="col-md-1">
									<input type="button" class="btn btn-primary" id="medicalBtn" name="medicalBtn" value="검색">
								</div>
								<div><nav><ul class="pagination" id="medicalList"></ul></nav></div>
								<div id="map" style="width:100%;height:400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>