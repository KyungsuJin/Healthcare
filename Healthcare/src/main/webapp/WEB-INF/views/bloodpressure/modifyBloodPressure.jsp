<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodPressure</title>
</head>
<body>
<h1>modifyBloodPressure</h1>
					아이디
					${bloodPressure.memberId }
	<form action="${pageContext.request.contextPath}/modifyBloodPressure" method="post">
		<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo}">
		<input type="text" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}">
		<input type="text" name="diastolicPressure" placeholder="${bloodPressure.diastolicPressure}">
		<input type="submit" value="수정하기">
	</form>

</body>
</html>