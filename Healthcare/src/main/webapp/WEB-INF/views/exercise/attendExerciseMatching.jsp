<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$(".matchingPlace").click(function(){
				$("#exercisePlaceView").val($(this).text());
		    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
		    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
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
				<h1> 운동매칭 참가 리스트 </h1>
				<c:set var="now" value="<%=new java.util.Date()%>"/>
				<input type="hidden" name="exercisePlaceView"id="exercisePlaceView">
				<input type="hidden" id="currentDate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="currentDate"/>">
				<input type="hidden" id="currentTime" value="<fmt:formatDate value="${now}" pattern="k:mm"/>">
				<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.memberSessionNo}">
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>참가신청 날짜</th>
							<th>종목</th>
							<th>제목</th>
							<th>장소</th>
							<th>일시</th>
							<th>취소/완료</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${attendExerciseMatchingList}" var="attendExerciseMatchingList">
							<input type="hidden" name="exerciseMatchingNo" class="exerciseMatchingNo" value="${attendExerciseMatchingList.exerciseMatchingNo}">
							<tr>
								<td>${attendExerciseMatchingList.exerciseMatchingJoinDate}</td>
								<td>${attendExerciseMatchingList.exerciseNo}</td>
								<td><a href="${pageContext.request.contextPath}/exerciseMatchingContent?exerciseMatchingNo=${attendExerciseMatchingList.exerciseMatchingNo}">${attendExerciseMatchingList.exerciseMatchingTitle}</a></td>
								<td><a href="#" class="matchingPlace">${attendExerciseMatchingList.exerciseMatchingPlace}</a></td>
								<td>${attendExerciseMatchingList.exerciseMatchingScheduleDate} 일 ${attendExerciseMatchingList.exerciseMatchingTime.replace(",","~")} 까지</td>
									<c:choose>
										<c:when test="${attendExerciseMatchingList.exerciseMatchingResult eq 1}">
											<td>운동완료</td>
										</c:when>
										<c:when test="${attendExerciseMatchingList.exerciseMatchingScheduleDate < currentDate}">
											<td><a href="${pageContext.request.contextPath}/exerciseComplete?memberNo=${sessionScope.memberSessionNo}&exerciseMatchingNo=${attendExerciseMatchingList.exerciseMatchingNo}" >완료하기</a></td>
										</c:when>
										<c:when test="${attendExerciseMatchingList.exerciseMatchingScheduleDate <= currentDate}">
											<td>진행중</td>
										</c:when>
										<c:otherwise>
											<td><a href="${pageContext.request.contextPath}/exerciseMatchingCancel?memberNo=${sessionScope.memberSessionNo}&exerciseMatchingNo=${attendExerciseMatchingList.exerciseMatchingNo}" >참가취소</a></td>
										</c:otherwise>
									</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>