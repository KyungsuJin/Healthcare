<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#removeMedicationBtn{ float: right; }
	#modifyMedicationBtn{ float: right; }
	#medicationContent{ height: 300px; }
</style>
<script>
	$(document).ready(function(){
		var medicineSeq = $("#medicineNo").val().split("_")[1];
		$("#medicationListBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getMedicationList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#removeMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/removeMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#modifyMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/modifyMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		$('#calendar').fullCalendar({
			editable: false
		});
		$(document).on("click", "#medicineInfo", function(){
			var openNewWindow = window.open("about:blank");
			openNewWindow.location.href = "http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq="+medicineSeq;
		});
	});
</script>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar-scheduler/1.9.4/scheduler.css">
<script type="text/javascript" src="https://fullcalendar.io/releases/fullcalendar-scheduler/1.9.4/scheduler.min.js"></script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="containerMedication" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<input id="removeMedicationBtn" class="btn btn-default" type="button" value="삭제">
							<input id="modifyMedicationBtn" class="btn btn-default" type="button" value="수정">
							<input type="hidden" id="medicineSeq" class="form-control" name="medicineSeq" readonly>
							<input type="hidden" id="medicineNo" class="form-control" name="medicineNo" value="${medicationResponse.medicineNo}" readonly>
							<div class="col-md-10">약 이름  <input id="medicineName" class="form-control" name="medicineName" value="${medicationResponse.medicineName}" readonly></input></div>
							<div class="col-md-2"><input type="button" id="medicineInfo" class="btn btn-default" value="자세히"></div>
						</div>
						<div class="col-md-8 col-md-offset-2">
							<div class="col-md-5">시작  <input id="medicationStartDate" class="form-control" type="date" name="medicationStartDate" value="${medicationResponse.medicationStartDate}" readonly></div>
							<div class="col-md-2" style="margin-top : 30px">~</div>
							<div class="col-md-5">끝  <input id="medicationEndDate" class="form-control" type="date" name="medicationEndDate" value="${medicationResponse.medicationEndDate}" readonly></div>
						</div>
						<div class="col-md-8 col-md-offset-2">
							<div class="col-md-5">일일 복용량  <input id="dosage" class="form-control" type="number" name="dosage" value="${medicationResponse.dosage}" readonly></div>
							<div class="col-md-5 col-md-offset-2">총 복용량  <input id="totalDosage" class="form-control" type="text" name="totalDosage" value="${medicationResponse.totalDosage}" readonly></div>
						</div>
						<div id='calendar' class="col-md-8 col-md-offset-2"></div>
						<div class="col-md-8 col-md-offset-2">
							<div>복용 제목  <input id="medicationTitle" class="form-control" name="medicationTitle" value="${medicationResponse.medicationTitle}" readonly></input></div>
							<div>복용 내용  <textarea id="medicationContent" class="form-control" name="medicationContent" readonly>${medicationResponse.medicationContent}</textarea></div>
							<input id="medicationListBtn" class="btn btn-default" type="button" value="목록">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>