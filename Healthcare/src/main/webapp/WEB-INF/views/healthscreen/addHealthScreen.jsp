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
		<form id="healthScreenForm" method="POST" action="${pageContext.request.contextPath}/addHealthScreen">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			
			키 : <input type="number" id="bodyHeight" name="bodyHeight"><br>
			몸무게 : <input type="number" id="bodyWeight" name="bodyWeight"><br>
			허리둘레 : <input type="number" id="bodyWaistSize" name="bodyWaistSize"><br>
			BMI : <input type="number" id="bodyMassIndex" name="bodyMassIndex"><br>
			
			공복여부 : <input type="radio" name="fastingState" value="T"> <br>
			혈당 : <input type="number" id="fastingBloodSugar" name="fastingBloodSugar"><br>
			수축혈압 : <input type="number" id="systolicPressure" name="systolicPressure"><br>
			이완혈압 : <input type="number" id="diastolicPressure" name="diastolicPressure"><br>
			
			<input type="text" id="bloodSugarNo" name="bloodSugarNo"><br>
			<input type="text" id="bloodPressureNo" name="bloodPressureNo"><br>
			<input type="text" id="bodyMassIndexNo" name="bodyMassIndexNo"><br>
			
			
			
			
			
			
			총 콜레스테롤 : <input type="text" id="totalCholesterol" name="totalCholesterol"><br>
			ldl 콜레스테롤 : <input type="text" id="ldlCholesterol" name="ldlCholesterol"><br>
			중성지방 : <input type="text" id="neutralFat" name="neutralFat"><br>
			hdl 콜레스테롤 : <input type="text" id="hdlCholesterol" name="hdlCholesterol"><br>
			신장질환요단백 : <input type="text" id="proteinuria" name="proteinuria"><br>
			빈혈등_혈색소 : <input type="text" id="hemoglobin" name="hemoglobin"><br>
			만성질환_혈청크레아틴 : <input type="text" id="serumCreatinine" name="serumCreatinine"><br>
			신사구체여과율 : <input type="text" id="gfr" name="gfr"><br>
			<input type="button" id="healthScreenBtn" value="요청">
		</form>
		<input id="getHealthScreenListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>