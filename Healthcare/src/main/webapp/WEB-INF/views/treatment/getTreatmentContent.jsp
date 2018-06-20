<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#removeTreatmentBtn{ float: right; }
	#modifyTreatmentBtn{ float: right; }
	#containerTreatment{ width: 1000px; margin: auto; }
	#containerTreatment div{border: 1px solid #bcbcbc; text-align: left;}
	#treatmentContent{ height: 500px; }
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
					<h1>TreatmentContent</h1>
					<input id="removeTreatmentBtn" class="btn btn-default" type="button" value="삭제">
					<input id="modifyTreatmentBtn" class="btn btn-default" type="button" value="수정">
					<br><br>
					<div>${treatmentResponse.treatmentDepartment}</div>
					<div>${treatmentResponse.hospitalName}</div>
					<div>${treatmentResponse.doctorName}</div>
					<div>${treatmentResponse.hospitalAddress}</div>
					<div>${treatmentResponse.treatmentNo}</div>
					<div>${treatmentResponse.treatmentTitle}</div>
					<div id="treatmentContent">${treatmentResponse.treatmentContent}</div>
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
</body>
</html>