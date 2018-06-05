<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		addHealthScreenBtn{ float: right; }
		healthScreenContainer{ width: 800px; margin: auto; }
</style>
	<script>
	$(document).ready(function(){
		$("#addHealthScreenBtn").click(function(){
			location.href="${pageContext.request.contextPath}/addHealthScreen";
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthScreenContainer" align="center">
		<h1>HealthScreenList</h1>
		
		<input id="addHealthScreenBtn" class="btn btn-default" type="button" value="작성">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>건강검진 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "healthScreen" items = "${list}">
					<tr>
						<td><a href="${pageContext.servletContext.contextPath}/getHealthScreenResult?healthScreenNo=${healthScreen.healthScreenNo}">${sessionScope.memberSessionName}님의 ${healthScreen.healthScreenDate} 건강검진표</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<nav>
			<ul class="pagination">
				<c:choose>
					<c:when test="${beforePage eq 0}">
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${firstPage}" aria-label="First"> <span aria-hidden="true">&laquo;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${beforePage}" aria-label="Previous"> <span aria-hidden="true">&lt;</span></a></li>
					</c:otherwise>
				</c:choose>
				<c:set var="doneLoop" value="false"/>
				<c:forEach var="i" begin="${beforePage+1}" end="${afterPage-1}" step="1">
					<c:if test="${not doneLoop}"> 
						<c:choose>
							<c:when test="${i eq currentPage && (i eq lastPage || lastPage eq 0)}">
								<li class="active"><a>${i}</a></li>
								<c:set var="doneLoop" value="true"/>
							</c:when>
							<c:when test="${i eq currentPage}">
								<li class="active"><a>${i}</a></li>
							</c:when>
							<c:when test="${i eq lastPage}">
								<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${i}">${i}</a></li>
								<c:set var="doneLoop" value="true"/>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${lastPage < afterPage}">
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${afterPage}" aria-label="Next"> <span aria-hidden="true">&gt;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getHealthScreenList?currentPage=${lastPage}" aria-label="Last"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	
	
	</div>
</body>
</html>