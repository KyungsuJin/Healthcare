<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#writeMedicationBtn{ float: right; }
	#containerMedication{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
		$("#writeMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/addMedication?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerMedication" align="center">
		<h1>MedicationList</h1>
		
		<input id="writeMedicationBtn" class="btn btn-default" type="button" value="글쓰기">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>MedicationNo</th>
					<th>MedicationTitle</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "medication" items = "${list}">
					<tr>
						<td>${medication.medicationNo}</td>
						<td><a href="${pageContext.request.contextPath}/getMedicationContent?medicationNo=${medication.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}">${medication.medicationTitle}</td>
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
						<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${firstPage}" aria-label="First"> <span aria-hidden="true">&laquo;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${beforePage}" aria-label="Previous"> <span aria-hidden="true">&lt;</span></a></li>
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
								<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${i}">${i}</a></li>
								<c:set var="doneLoop" value="true"/>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${lastPage < afterPage}">
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${afterPage}" aria-label="Next"> <span aria-hidden="true">&gt;</span></a></li>
						<li><a href="${pageContext.request.contextPath}/getMedicationList?currentPage=${lastPage}" aria-label="Last"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>

</body>
</html>