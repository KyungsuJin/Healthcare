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
			$('#addDiseaseSubCategory').click(function() {								
				location.href='addDiseaseSubCategory?diseaseNo=${diseaseNo}';
			});
		});
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
					<th>질병소분류</th>
					<th>가족력</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="diseaseSubCategory" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${diseaseSubCategory.diseaseNo}</td>
						<td>${diseaseSubCategory.diseaseSubCategoryName}</td>
						<td>${diseaseSubCategory.familyHistory}</td>
						<td>${diseaseSubCategory.diseaseSubCategoryDate}</td>
					</tr>	
				</c:forEach>		
			</tbody>
		</table>
		<div>
			<input type="button" id="addDiseaseSubCategory" value="소분류질병등록">
		</div>
	</div>
</body>
</html>