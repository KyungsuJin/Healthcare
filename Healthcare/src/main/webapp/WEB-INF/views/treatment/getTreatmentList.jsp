<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#writeTreatmentBtn{ float: right; }s
	#containerTreatment{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
		$("#writeTreatmentBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/addTreatment?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerTreatment" align="center">
		<h1>TreatmentList</h1>
		
		<input id="writeTreatmentBtn" class="btn btn-default" type="button" value="글쓰기">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>TreatmentNo</th>
					<th>TreatmentTitle</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "treatment" items = "${list}">
					<tr>
						<td>${treatment.treatmentNo}</td>
						<td><a href="${pageContext.request.contextPath}/getTreatmentContent?treatmentNo=${treatment.treatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}">${treatment.treatmentTitle}</td>
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
						<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${firstPage}" aria-label="First"> <span aria-hidden="true">&laquo;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${beforePage}" aria-label="Previous"> <span aria-hidden="true">&lt;</span></a></li>
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
								<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${i}">${i}</a></li>
								<c:set var="doneLoop" value="true"/>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${lastPage < afterPage}">
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${afterPage}" aria-label="Next"> <span aria-hidden="true">&gt;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getTreatmentList?currentPage=${lastPage}" aria-label="Last"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>

</body>
</html>