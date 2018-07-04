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
	<h1>getAllSanctionList.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<td>No</td>
				<td>아이디</td>
				<td>제목</td>
				<td>내용</td>
				<td>차감포인트</td>
				<td>시작</td>
				<td>종료</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="sanction" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${sanction.memberId}</td>
					<td>${sanction.sanctionTitle}</td>
					<td>${sanction.sanctionContent}</td>
					<td>${sanction.sanctionPoint}</td>
					<td>	
						<c:if test="${sanction.sanctionStartDate ne null}">
							${sanction.sanctionStartDate}
						</c:if>
					</td>
					<td>
						<c:if test="${sanction.sanctionEndDate ne null}">
							${sanction.sanctionEndDate}
						</c:if>
					</td>
					
					<td><a href="${pageContext.request.contextPath}/removeSanction?sanctionNo=${sanction.sanctionNo}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>