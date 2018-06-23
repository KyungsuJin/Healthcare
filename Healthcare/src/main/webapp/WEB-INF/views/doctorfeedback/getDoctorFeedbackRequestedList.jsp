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
			</tr>
		</thead>
		<tbody>
			<c:forEach var="doctorFeedbackRequest" items="${list}" varStatus="status">
				<tr onclick="location.href='${pageContext.request.contextPath}/getDoctorFeedbackRequestedDetail?doctorFeedbackRequestNo=${doctorFeedbackRequest.doctorFeedbackRequestNo}'" style="cursor:pointer;">
					<td>${status.count}</td>
					<td>${doctorFeedbackRequest.doctorFeedbackRequestTitle}</td>
					<td>${doctorFeedbackRequest.doctorNo}</td>
					<td>${doctorFeedbackRequest.memberNo}</td>
					<td>${doctorFeedbackRequest.doctorFeedbackRequestDate}</td>
				</tr>				
			</c:forEach>
			
		</tbody>
	</table>
</body>
</html>