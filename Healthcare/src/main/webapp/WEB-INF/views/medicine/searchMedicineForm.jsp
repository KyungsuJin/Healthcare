<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#containerMedicine{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
		$(document).on("click", "#medicineBtn", function(){
			window.open("${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}"
					,"getMedicineList","width=500, height=300,resizable=no,scrollbars=yes");
		});
	});
		
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedicine" align="center">
		<h1>addMedicine</h1>
		약품명 : <input type="text" id="medicineName" name="medicineName">
		<button id="medicineBtn" class="btn btn-default" type="button">저장</button>
	</div>
</body>
</html>