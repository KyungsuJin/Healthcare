<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Insert title here</title>
	<script>
		$(document).ready(function(){
			$('#addDisease').click(function() {
				location.href='addDisease';
			}) 
		})
	</script>
</head>
<body>	
	<div align="center">
		<h1>DiseaseList</h1>
		<table border="1" class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>질병명</th>
					<th>상세정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="disease" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="${pageContext.request.contextPath}/getDiseaseDetail?diseaseNo=${disease.diseaseNo}">${disease.diseaseName}</a></td>
						<td><a href="${pageContext.request.contextPath}/getDiseaseDetail?diseaseNo=${disease.diseaseNo}">삭제하기</a></td>		
					</tr>
	
				</c:forEach>		
			</tbody>
		</table>
		<div>
			<input type="button" id="addDisease" value="질병등록">
		</div>
	</div>
</body>
</html>