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
			$("p").hide();
			if($('#medicationTitle').val().length < 1) {
                alert('title을 입력하세요');
            } else if($('#medicationContent').val().length < 1) {
                alert('content을 입력하세요');
            } else{
				$("#medicationForm").submit();
            }
		});
		$("#cancelBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getMedicationList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		$("#medicineNo").click(function(){
			window.name = "parentForm";
			window.open("${pageContext.request.contextPath}/getMedicineList?windowPop=1"
					,"medicalForm", "width=600, height=430, resizable=no, scrollbars=no");
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
				<div id="containerMedication" align="center">
					<h1>addMedication</h1>
					<form id="medicationForm" action="${pageContext.request.contextPath}/addMedication" method="post">
						<div>medicineNo : <input id="medicineNo" class="form-control" name="medicineNo" readonly></input></div>
						<div>medicationStartDate : <input id="medicationStartDate" class="form-control" type="date" name="medicationStartDate"></div>
						<div>medicationEndDate : <input id="medicationEndDate" class="form-control" type="date" name="medicationEndDate"></div>
						<div>dosage : <input id="dosage" class="form-control" type="number" name="dosage"></div>
						<div>totalDosage : <input id="totalDosage" class="form-control" type="text" name="totalDosage"></div>
						<div>medicationTitle : <input id="medicationTitle" class="form-control" name="medicationTitle"></input></div>
						<div>medicationContent : <textarea id="medicationContent" class="form-control" name="medicationContent"></textarea></div>
						<button id="medicationBtn" class="btn btn-default" type="button">저장</button>
						<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>