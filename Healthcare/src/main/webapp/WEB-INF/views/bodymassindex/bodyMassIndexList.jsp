<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<h1>체질량 관리</h1>
	<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록</a>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>키</th>
				<th>몸무게</th>
				<th>허리둘레</th>
				<th>BMI</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bodyMassIndexList}" var="bodyMassIndexList">
				<tr>
					<td>${bodyMassIndexList.bodyHeight}</td>
					<td>${bodyMassIndexList.bodyWeight}</td>
					<td>${bodyMassIndexList.bodyWaistSize}</td>
					<td>${bodyMassIndexList.bodyMassIndex}</td>
					<td>${bodyMassIndexList.bodyDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>