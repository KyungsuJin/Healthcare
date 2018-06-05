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
		});
		
	
	</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthScreenContainer" align="center">
		<form id="healthScreenForm" method="POST" action="${pageContext.servletContext.contextPath}/modifyHealthScreen">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			<input type="text" id="bloodSugarNo" name="bloodSugarNo" value="${healthScreen.bloodSugarNo}" readonly><br>
			<input type="text" id="bloodPressureNo" name="bloodPressureNo" value="${healthScreen.bloodPressureNo}" readonly><br>
			<input type="text" id="bodyMassIndexNo" name="bodyMassIndexNo" value="${healthScreen.bodyMassIndexNo}" readonly><br>
			<input type="text" id="totalCholesterol" name="totalCholesterol" value="${healthScreen.totalCholesterol}"><br>
			<input type="text" id="ldlCholesterol" name="ldlCholesterol" value="${healthScreen.ldlCholesterol}"><br>
			<input type="text" id="neutralFat" name="neutralFat" value="${healthScreen.neutralFat}"><br>
			<input type="text" id="hdlCholesterol" name="hdlCholesterol" value="${healthScreen.hdlCholesterol}"><br>
			<input type="text" id="proteinuria" name="proteinuria" value="${healthScreen.proteinuria}"><br>
			<input type="text" id="hemoglobin" name="hemoglobin" value="${healthScreen.hemoglobin}"><br>
			<input type="text" id="serumCreatinine" name="serumCreatinine" value="${healthScreen.serumCreatinine}"><br>
			<input type="text" id="gfr" name="gfr" value="${healthScreen.gfr}"><br>
			<input type="button" id="healthScreenBtn" value="수정">
		</form>
	
	</div>
</body>
</html>