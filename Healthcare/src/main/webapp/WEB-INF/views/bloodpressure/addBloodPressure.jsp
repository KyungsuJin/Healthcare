<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBloodPressure</title>
</head>
<body>
<h1>addBloodPressure</h1>
	<form action="${pageContext.request.contextPath}/addBloodPressure" method="post">
<!-- 		<input type="text" name="bloodPressureNo" placeholder=" BloodPressureId"> -->
		<input type="text" name="memberNo" value="${member.memberNo}" readonly>
		<input type="text" name="systolicPressure" placeholder="systolicPressure">
		<input type="text" name="diastolicPressure" placeholder="diastolicPressure">
		<input type="submit" value="등록하기">
	</form>
</body>
</html>