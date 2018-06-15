<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#containerMedication{ width: 1000px; margin: auto; }
	#medicationContent { height: 300px; }
</style>
<script>
	$(document).ready(function(){
		
		$("#medicationBtn").click(function(){
			if($('#medicationTitle').val().length < 1) {
                alert('title을 입력하세요');
            } else if($('#medicationContent').val().length < 1) {
                alert('content을 입력하세요');
            } else{
	            $("#medicationForm").submit();
            }
		});
		
		$("#cancelBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getMedicationContent?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
	});
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedication" align="center">
		<h1>addMedication</h1>
		<form id="medicationForm" action="${pageContext.request.contextPath}/modifyMedication" method="post" enctype="multipart/form-data">
			<input type="hidden" name="medicationNo" value="${medicationResponse.medicationNo}">
			<input type="hidden" name="currentPage" value="${currentPage}">
			<input type="hidden" name="pagePerRow" value="${pagePerRow}">			
			<div>medicineNo : <input id="medicineNo" class="form-control" name="medicineNo" value="${medicationResponse.medicineNo}"></input></div>
			<div>medicationStartDate : <input id="medicationStartDate" class="form-control" type="date" name="medicationStartDate" value="${medicationResponse.medicationStartDate}" readonly></div>
			<div>medicationEndDate : <input id="medicationEndDate" class="form-control" type="date" name="medicationEndDate" value="${medicationResponse.medicationEndDate}"></div>
			<div>dosage : <input id="dosage" class="form-control" type="number" name="dosage" value="${medicationResponse.dosage}"></div>
			<div>totalDosage : <input id="totalDosage" class="form-control" type="text" name="totalDosage" value="${medicationResponse.totalDosage}"></div>
			<div>medicationTitle : <input id="medicationTitle" class="form-control" name="medicationTitle" value="${medicationResponse.medicationTitle}"></input></div>
			<div>medicationContent : <textarea id="medicationContent" class="form-control" name="medicationContent">${medicationResponse.medicationContent}</textarea></div>
			<button id="medicationBtn" class="btn btn-default" type="button">저장</button>
			<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
		</form>
		
	</div>
</body>
</html>