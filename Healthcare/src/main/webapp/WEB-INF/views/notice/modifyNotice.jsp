<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<td>bloodsugarno</td>
	<td>memberno</td>
	<td>fastingbloodsugar</td>
	<td>fastingstate</td>
	<td>bloodsugardate</td>
</tr>
				 ${bloodsugar.memberno} 
	<tr>
	<form action="${pageContext.request.contextPath}/modifyBloodsugar" method="POST">
		<td><input type="hidden" name="bloodsugarno" value="${bloodsugar.bloodsugarno}"></td>
		<td><input type="text" name="memberno" value="${bloodsugar.memberno}"></td>
		<td><input type="text" name="fastingbloodsugar" value="${bloodsugar.fastingbloodsugar}"></td>
		<td><input type="text" name="fastingstate" value="${bloodsugar.fastingstate}"></td>
		<td><input type="text" name="bloodsugardate" value="${bloodsugar.bloodsugardate}"></td>
		<td><input type="submit" value="수정하기">
	</form>
	</tr>
	</thead>
</table>
</body>
</html>  --%>