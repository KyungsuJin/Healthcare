<!-- 피드백결과를 확인하는 view -->
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
</head>
<body>
	<h1>getDoctorFeedbackResultList</h1>
	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>피드백제목</th>
				<th>피드백내용</th>
				<th>추천운동</th>
				<th>피드백날짜</th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach var="doctorFeedbackResult" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${doctorFeedbackResult.doctorFeedbackResultTitle}</td>
					<td>${doctorFeedbackResult.doctorFeedbackResultContent}</td>
					<th>${doctorFeedbackResult.exerciseName}</th>
					<td>${doctorFeedbackResult.doctorFeedbackResultDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>