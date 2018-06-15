<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#removeMedicationBtn{ float: right; }
	#modifyMedicationBtn{ float: right; }
	#containerMedication{ width: 1000px; margin: auto; }
	#containerMedication div{border: 1px solid #bcbcbc; text-align: left;}
	#medicationContent{ height: 500px; }
</style>
<script>
	$(document).ready(function(){
		$("#medicationListBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getMedicationList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#removeMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/removeMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#modifyMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/modifyMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
	});
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedication" align="center">
		<h1>MedicationContent</h1>
		<input id="removeMedicationBtn" class="btn btn-default" type="button" value="삭제">
		<input id="modifyMedicationBtn" class="btn btn-default" type="button" value="수정">
		<br><br>
		<div>${medicationResponse.medicationNo}</div>
		<div>${medicationResponse.medicineNo}</div>
		<div>${medicationResponse.medicineName}</div>
		<div>${medicationResponse.memberName}</div>
		<%-- <div>
			<c:forEach var="i" begin="${medicationResponse.medicationStartDate}" end="${medicationResponse.medicationEndDate}" step="1">
				<div>i</div>
			</c:forEach>
		</div> --%>
		<div>${medicationResponse.medicationStartDate}</div>
		<div>${medicationResponse.medicationEndDate}</div>
		<div>${medicationResponse.dosage}</div>
		<div>${medicationResponse.totalDosage}</div>
		<div>${medicationResponse.medicationTitle}</div>
		<div>${medicationResponse.medicationContent}</div>
		<div>${medicationResponse.medicationDate}</div>
		<input id="medicationListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>