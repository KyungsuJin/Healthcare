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
	getComplainList
	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>아이디</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="complain" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${complain.memberId}</td>
					<td>${complain.complainTitle}</td>
					<td>${complain.complainContent}</td>
					<td>${complain.complainDate}</td>
					<td>${complain.complainDate}</td>
					<td><a href="${pageContext.request.contextPath}/removeComplain?complainNo=${complain.complainNo}">삭제하기</a></td>
				</tr>
				<c:if test="${complain.complainAnswerCount > 0}">
					<tr>
						<td></td>
						<td colspan="4" style="color: #2593e5;">
							<a href="${pageContext.request.contextPath}/getComplainAnswer?complainNo=${complain.complainNo}">RE : ${complain.complainTitle}</a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>