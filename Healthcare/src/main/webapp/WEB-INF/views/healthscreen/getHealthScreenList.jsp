<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		#addHealthScreenBtn{ float: right; }
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
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="healthScreenContainer" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
                           		<div class="card-header" data-background-color="purple"><h4 class="title">건강검진표 등록</h4></div>
								<input id="addHealthScreenBtn" class="btn btn-default" type="button" value="작성">
								<table class="table">
									<thead>
										<tr>
											<th>제목</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var = "healthScreen" items = "${list}">
											<tr>
												<td><a href="${pageContext.request.contextPath}/getHealthScreenResult?healthScreenNo=${healthScreen.healthScreenNo}">${sessionScope.memberSessionName}님의  건강검진표</a></td>
												<td>${healthScreen.healthScreenDate}</td>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>