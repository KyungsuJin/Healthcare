<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	div{ padding-left: 0px; padding-right: 0px; }
	input[type=button]{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; }
	.form-group{ padding-bottom: 0px; margin: 0px 0 0 0; }
	#medicalBtn{ margin-top:0px; padding-left:0px; width: 60px; height: 40px; }
</style>
<script>
	$(document).ready(function(){
		function removeWindow(){
			if(opener != null){
				opener.medicalForm = null
				self.close();
			}
		}
		
		$(document).on('click', '#showGeo', function() {
	        console.log($(this).closest('div').closest('div').siblings('#medicalAddress'));//getPopMedicalMap
	        $("#medicalMapName").val($(this).closest('div').closest('div').siblings('#medicalAjaxName').text());
	        $("#medicalMapType").val($(this).closest('div').closest('div').siblings('#medicalType').val());
	        $("#medicalMapTel").val($(this).closest('div').closest('div').siblings('#medicalTel').val());
	        $("#medicalMapAddress").val($(this).closest('div').closest('div').siblings('#medicalAddress').text());
	        console.log($("#medicalMapName").val());
	        console.log($("#medicalMapType").val());
	        console.log($("#medicalMapTel").val());
	        console.log($("#medicalMapAddress").val());
	        window.name = "parentForm";
			window.open("${pageContext.request.contextPath}/getPopMedicalMap"
					,"medicalForm", "width=750, height=700, resizable=no, scrollbars=no");
			
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
		        		content += "<div class='row' style='border-bottom:1px solid; border-bottom-color:#9c27b0;'><div class='col-xs-2' id='medicalAjaxName'>" + val.medicalName + "</div>"
								 +"<div class='col-xs-6' id='medicalAddress'>" + val.medicalAddress + "</div>"
								 +"<input type='hidden' id='medicalTel' value='" + val.medicalTel + "'>"
								 +"<input type='hidden' id='medicalType' value='" + val.medicalType + "'>"
								 +"<div class='col-xs-2'><input type='button' id='showGeo' class='btn btn-primary' value='위치보기'></div>"
								 +"<div class='col-xs-2'><input type='button' class='medicalReturn btn btn-primary' value='선택'></div></div>";
		        	});
 					content += "</div>";
 					content += "<div class='col-xs-2'></div>";
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
		        		content += "<div class='row' style='border-bottom:1px solid; border-bottom-color:#9c27b0;'><div class='col-xs-2' id='medicalAjaxName'>" + val.medicalName + "</div>"
								 +"<div class='col-xs-6' id='medicalAddress'>" + val.medicalAddress + "</div>"
								 +"<input type='hidden' id='medicalTel' value='" + val.medicalTel + "'>"
								 +"<input type='hidden' id='medicalType' value='" + val.medicalType + "'>"
								 +"<div class='col-xs-2'><input type='button' id='showGeo' class='btn btn-primary' value='위치보기'></div>"
								 +"<div class='col-xs-2'><input type='button' class='medicalReturn btn btn-primary' value='선택'></div></div>";
		        	});
 					content += "</div>";
 					content += "<div class='col-xs-2'></div>";
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
		$(document).on("click",".medicalReturn",function(){
			console.log($(this).closest("div").closest("div").siblings("#medicalAddress"));
			console.log($(this).closest("div").closest("div").siblings("#medicalAddress").text());
			opener.document.treatmentForm.hospitalAddress.value = $(this).closest("div").closest("div").siblings("#medicalAddress").text();
			opener.document.treatmentForm.hospitalName.value = $(this).closest("div").closest("div").siblings("#medicalAjaxName").text();
			removeWindow();
		});
	});
</script>
</head>
<body>
	<div id="containerMedical" align="center">
	<form name="medicalMapForm">
		<input type="hidden" id="medicalMapName" name="medicalMapName">
		<input type="hidden" id="medicalMapType" name="medicalMapType">
		<input type="hidden" id="medicalMapTel" name="medicalMapTels">
		<input type="hidden" id="medicalMapAddress" name="medicalMapAddress">
	</form>
		<div class="row">
			<div class="col-xs-12">
				<div class="col-xs-3">
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
				<div class="col-xs-3">
					<select id="districtName" name="districtName" class="form-control">
						<option>
							시/군/구 선택 
						</option>
					</select>
				</div>
				<div class="col-xs-4">
					<input type="text" id="medicalName" class="form-control" name="medicalName" placeholder="병원 명 ex)푸른안과">
				</div>
				<div class="col-xs-1">
					<input type="button" class="btn btn-primary" id="medicalBtn" name="medicalBtn" value="검색">
				</div>
				<div><nav><ul class="pagination" id="medicalList"></ul></nav></div>
			</div>
		</div>
	</div>
</body>
</html>