<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#medicalList{ overflow:scroll; width:800px; height:500px; }
	#containerMedical{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
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
			console.log($("#cityName").text());
			console.log($("#districtName")[0].value);
			console.log($("#medicalAddress").val());
/* 			$.ajax({
		    	url : '${pageContext.request.contextPath}/getAddressList',
		        type : 'POST',
		        data : { medicalAddress : addressValue },
		        dataType : 'json',
		        success : function(data) {
		        	$("#medicalList").append("<table>");
		        	$.each(data.districtList, function(idx, val) {
		        		$("#medicalList").append("<tr>");
		        		$("#medicalList").append("<td>");
		        		
		        		$("#medicalList").append("</td>");
		        		$("#medicalList").append("</tr>");
		        	});
		        	$("#medicalList").append("</table>");
		        },
		        error : function() { console.log('error');}
			}); */
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
					
					<input type="text" id="medicalAddress" name="medicalAddress">
					<input type="button" id="medicalBtn" name="medicalBtn">
				</td>
			</tr>
		</table>
		
		<div id="medicalList">
			
		</div>
		
	</div>

</body>
</html>