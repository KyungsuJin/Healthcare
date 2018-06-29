<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	input{ text-align:center; }
	#removeTreatmentBtn{ float: right; }
	#modifyTreatmentBtn{ float: right; }
	#treatmentContent{ height: 300px; }
</style>
<script>
	$(document).ready(function(){
		$("#treatmentListBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getTreatmentList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#removeTreatmentBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/removeTreatment?treatmentNo=${treatmentResponse.treatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#modifyTreatmentBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/modifyTreatment?treatmentNo=${treatmentResponse.treatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
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
				<div id="containerTreatment" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
                           		<div class="card-header" data-background-color="purple"><h4 class="title">진료기록</h4></div>
								<input id="removeTreatmentBtn" class="btn btn-default" type="button" value="삭제">
								<input id="modifyTreatmentBtn" class="btn btn-default" type="button" value="수정">
								<br><br><br><br>
								<div class="col-md-4">병원 명 : <input id="hospitalName" class="form-control" type="text" name="hospitalName" value="${treatmentResponse.hospitalName}" readonly></div>
								<div class="col-md-4">진료 과 : <input id="treatmentDepartment" class="form-control" type="text" name="treatmentDepartment" value="${treatmentResponse.treatmentDepartment}" readonly></div>
								<div class="col-md-4">의사 명 : <input id="doctorName" class="form-control" type="text" name="doctorName" value="${treatmentResponse.doctorName}" readonly></div>
								<div>병원 주소 : <input id="hospitalAddress" class="form-control" type="text" name="hospitalAddress" value="${treatmentResponse.hospitalAddress}" readonly></div>
									
								<div>진료 제목 : <input id="treatmentTitle" class="form-control" type="text" name="treatmentTitle" value="${treatmentResponse.treatmentTitle}" readonly></div>
								<div>진료 내용 : <textarea id="treatmentContent" class="form-control" name="treatmentContent" readonly>${treatmentResponse.treatmentContent}</textarea></div>
								
								<c:if test="${!empty upTreatmentNo}">
									<div><a href="${pageContext.request.contextPath}/getTreatmentContent?treatmentNo=${upTreatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}">윗글</a></div>
								</c:if>
								<c:if test="${!empty downTreatmentNo}">
									<div><a href="${pageContext.request.contextPath}/getTreatmentContent?treatmentNo=${downTreatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}">아랫글</a></div>
								</c:if>
								<c:forEach var = "treatmentFile" items = "${treatmentResponse.treatmentFile}">
									<div>
										<a href="${pageContext.request.contextPath}/upload/${treatmentFile.treatmentFileName}.${treatmentFile.treatmentFileExt}" download="${treatmentFile.treatmentFileRealName}">${treatmentFile.treatmentFileRealName}(${treatmentFile.treatmentFileSize}byte)</a>
									</div>
								</c:forEach>
								<input id="treatmentListBtn" class="btn btn-default" type="button" value="목록">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>