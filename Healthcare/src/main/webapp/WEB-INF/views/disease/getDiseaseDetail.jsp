<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('#addDiseaseSubCategory').click(function() {								
				location.href='addDiseaseSubCategory?diseaseNo=${diseaseNo}';
			});
		});
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>소분류 질병 리스트</h1>
				<table  class="table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>질병명</th>
							<th>질병소분류</th>
							<th>가족력</th>
							<th>등록일</th>
							<th>삭제하기</th>
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
								<td><a href="${pageContext.request.contextPath}/removeDiseaseSubCategory?diseaseSubCategoryNo=${diseaseSubCategory.diseaseSubCategoryNo}&diseaseNo=${diseaseSubCategory.diseaseNo}">삭제하기</a></td>
							</tr>	
						</c:forEach>		
					</tbody>
				</table>
				<button type="button" class="btn btn-primary pull-right" id="addDiseaseSubCategory">소분류질병등록</button>
			</div>
		</div>
	</div>
</body>
</html>