<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>get Ingest Calorie</title>
</head>
<body>
	<h1>get Ingest Calorie.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>음식명</th>
				<th>섭취량</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ingestCalorie" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${ingestCalorie.foodName}</td>
					<td>${ingestCalorie.ingestWeight}</td>
					<td>${ingestCalorie.ingestDate}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	
	
	
	
	
	
</body>
</html>