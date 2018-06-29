<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	input{ text-align:center; }
	#medicationContent { height: 300px; }
</style>
<script>
	$(document).ready(function(){
		var medicineArray = $("#medicineNo").val().split("_");
		$("#medicineSeq").val(medicineArray[1]);
		console.log($("#medicineSeq").val());
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
		$(document).on("click", "#medicineInfo", function(){
			if($("#medicineSeq").val() > 1){
				var openNewWindow = window.open("about:blank");
				openNewWindow.location.href = "http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq="+$("#medicineSeq").val();
			}
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
					<form id="medicationForm" action="${pageContext.request.contextPath}/modifyMedication" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<div class="card">
									<div class="card-header" data-background-color="purple"><h4 class="title">복약 수정</h4></div>
									<div class="col-md-12">
										<input type="hidden" name="medicationNo" value="${medicationResponse.medicationNo}">
										<input type="hidden" name="currentPage" value="${currentPage}">
										<input type="hidden" name="pagePerRow" value="${pagePerRow}">
										<input type="hidden" id="medicineSeq" class="form-control" name="medicineSeq" readonly>
										<input type="hidden" id="medicineNo" class="form-control" name="medicineNo" value="${medicationResponse.medicineNo}" readonly>
										<div class="col-md-10">약 이름  <input id="medicineName" class="form-control" name="medicineName" value="${medicationResponse.medicineName}" readonly></input></div>
										<div class="col-md-2" style="margin-top: 30px;"><input type="button" id="medicineInfo" class="btn btn-default" value="자세히"></div>
									</div>
									<div class="col-md-12">
										<div class="col-md-5">시작  <input id="medicationStartDate" class="form-control" type="date" name="medicationStartDate" value="${medicationResponse.medicationStartDate}"></div>
										<div class="col-md-2" style="margin-top : 55px">~</div>
										<div class="col-md-5">끝  <input id="medicationEndDate" class="form-control" type="date" name="medicationEndDate" value="${medicationResponse.medicationEndDate}"></div>
									</div>
									<div class="col-md-12">
										<div class="col-md-5">일일 복용량  <input id="dosage" class="form-control" type="number" name="dosage" value="${medicationResponse.dosage}"></div>
										<div class="col-md-5 col-md-offset-2">총 복용량  <input id="totalDosage" class="form-control" type="text" name="totalDosage" value="${medicationResponse.totalDosage}"></div>
									</div>
									<div class="col-md-12">
										<div>복용 제목  <input id="medicationTitle" class="form-control" name="medicationTitle" value="${medicationResponse.medicationTitle}"></input></div>
										<div>복용 내용  <textarea id="medicationContent" class="form-control" name="medicationContent">${medicationResponse.medicationContent}</textarea></div>
										<button id="medicationBtn" class="btn btn-default" type="button">저장</button>
										<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>