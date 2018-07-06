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
				<h1>대분류 질병 리스트</h1>
				<table class="table table-hover">
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
								<td><a href="${pageContext.request.contextPath}/removeDisease?diseaseNo=${disease.diseaseNo}">삭제하기</a></td>		
							</tr>
						</c:forEach>			
					</tbody>
				</table>
				<div class="form-group">
					<button type="button" class="btn btn-primary pull-right" id="addDisease">질병등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>