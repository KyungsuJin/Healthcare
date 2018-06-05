<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#healthScreenBtn").click(function(){
				$("#healthScreenForm").submit();
			});
			$("#getHealthScreenListBtn").click(function(){
				location.href="${pageContext.request.contextPath}/getHealthScreenList";
			});
		});
		
	
	</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthScreenContainer" align="center">
		<form id="healthScreenForm" method="POST" action="${pageContext.servletContext.contextPath}/addHealthScreen">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			<input type="text" id="bloodSugarNo" name="bloodSugarNo"><br>
			<input type="text" id="bloodPressureNo" name="bloodPressureNo"><br>
			<input type="text" id="bodyMassIndexNo" name="bodyMassIndexNo"><br>
			<input type="text" id="totalCholesterol" name="totalCholesterol"><br>
			<input type="text" id="ldlCholesterol" name="ldlCholesterol"><br>
			<input type="text" id="neutralFat" name="neutralFat"><br>
			<input type="text" id="hdlCholesterol" name="hdlCholesterol"><br>
			<input type="text" id="proteinuria" name="proteinuria"><br>
			<input type="text" id="hemoglobin" name="hemoglobin"><br>
			<input type="text" id="serumCreatinine" name="serumCreatinine"><br>
			<input type="text" id="gfr" name="gfr"><br>
			<input type="button" id="healthScreenBtn" value="요청">
		</form>
		<input id="getHealthScreenListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>