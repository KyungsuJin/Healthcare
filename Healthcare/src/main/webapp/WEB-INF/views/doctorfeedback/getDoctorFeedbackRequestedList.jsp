<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">	
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<h1>getDoctorFeedBackRequestedList.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<td>No</td>
				<td>제목</td>
				<td>의사명</td>
				<td>회원명</td>
				<td>날짜</td>	
				<td>피드백완료여부</td>
				<c:if test="${memberSessionLevel == 1}">
					<td>삭제하기</td>
				</c:if>
				
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach var="doctorFeedbackRequest" items="${list}" varStatus="status">
			<input type="hidden" class="doctorFeedbackRequestNo" name="doctorFeedbackRequestNo" value="${doctorFeedbackRequest.doctorFeedbackRequestNo}">
				<tr>					
					
					<td>${status.count}</td>
					<td><a href="${pageContext.request.contextPath}/getDoctorFeedbackRequestedDetail?doctorFeedbackRequestNo=${doctorFeedbackRequest.doctorFeedbackRequestNo}">${doctorFeedbackRequest.doctorFeedbackRequestTitle}</a></td>
					<td>${doctorFeedbackRequest.doctorNo}</td>
					<td>${doctorFeedbackRequest.memberNo}</td>
					<td>${doctorFeedbackRequest.doctorFeedbackRequestDate}</td>
					<c:choose>
						<c:when test="${doctorFeedbackRequest.doctorFeedbackResult != null}">
							<td><a href="${pageContext.request.contextPath}/getDoctorFeedbackResult?doctorFeedbackRequestNo=${doctorFeedbackRequest.doctorFeedbackRequestNo}">피드백 완료[확인하기]</a></td>
						</c:when>
						<c:when test="${doctorFeedbackRequest.doctorFeedbackResult == null}">
							<td>피드백 요청중</td>
						</c:when>
					</c:choose>
					<c:if test="${memberSessionLevel == 1}">
						<td><a href="${pageContext.request.contextPath}/removeDoctorFeedbackRequest?doctorFeedbackRequestNo=${doctorFeedbackRequest.doctorFeedbackRequestNo}">삭제하기</a></td>
					</c:if>
				</tr>				
			</c:forEach>
		</tbody>
	</table>
</body>
</html>