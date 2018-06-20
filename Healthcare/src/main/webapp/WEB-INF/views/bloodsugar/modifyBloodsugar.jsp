<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodsugar</title>
</head>
<body>
<h1>modifyBloodsugar</h1>

<table border="1">
<thead>
<tr>
	<td>bloodSugarNo</td>
	<td>memberNo</td>
	<td>fastingBloodsugar</td>
	<td>fastingState</td>
	<td>bloodSugardate</td>
</tr>
				<%--  ${bloodsugar.memberno}  --%>
	<tr>
	<form action="${pageContext.request.contextPath}/modifyBloodsugar" method="POST">
		<td><input type="hidden" name="bloodSugarNo" value="${bloodSugar.bloodSugarNo}"></td>
		<td><input type="text" name="memberNo" value="${bloodSugar.memberNo}"></td>
		<td><input type="text" name="fastingBloodSugar" value="${bloodSugar.fastingBloodSugar}"></td>

		<td><input type="text" name="bloodSugarDate" value="${bloodSugar.bloodSugarDate}"></td>
		<td><input type="submit" value="수정하기">
		<form>
			<input type="radio" name ="fastingState"  checked="checked" value="F" id="fastingState"/>F
			<input type="radio" name="fastingState" value="T">T 	
		</form>
		
	</form>
	</tr>
	</thead>
</table>
</body>
</html>