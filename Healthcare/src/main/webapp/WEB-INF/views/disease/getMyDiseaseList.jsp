<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('#addDisease').click(function() {
				location.href='addDisease';
			}) 
		})
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>나의 질병 리스트</h1>
				<table  class="table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>질병명</th>
							<th>질병하위분류</th>
							<th>가족력유무</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="myDiseaseDetail" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${myDiseaseDetail.diseaseName}</td>
								<td>${myDiseaseDetail.diseaseSubCategoryName}</td>
								<td>${myDiseaseDetail.familyHistory}</td>
								<td><a href="${pageContext.request.contextPath}/removeMyDieseaseDetail?myDiseaseDetailNo=${myDiseaseDetail.myDiseaseDetailNo}&memberNo=${memberSessionNo}">삭제하기</a></td>
							</tr>
						</c:forEach>		
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>