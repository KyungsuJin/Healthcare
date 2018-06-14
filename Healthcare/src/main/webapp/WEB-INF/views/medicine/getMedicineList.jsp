<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#containerMedication{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
		
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedication" align="center">
		<form id="medicineForm" action="${pageContext.request.contextPath}/getMedicineList" method="post">
			약품명 : <input type="text" name="medicineName">
			<button id="medicineBtn" class="btn btn-default" type="button">저장</button>
		</form>
		<h1>MedicineList</h1>
		<c:forEach var = "medication" items = "${list}">
			<div>
				${medicine.medicineNo}
				${medicine.medicineName}
			</div>
		</c:forEach>
	</div>

</body>
</html>