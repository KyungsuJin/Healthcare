<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<h1>신고된 메시지 리스트</h1>
	<table class="table" border="1">
		<thead>
			<tr>
				<th>처리상태</th>
				<th>신고번호</th>
				<th>메시지번호</th>
				<th>메시지제목</th>
				<th>신고이유</th>
				<th>신고한 날짜 및 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messageComplainList}" var="messageComplainList">
				<tr>
					<c:choose>
						<c:when test="${messageComplainList.processingProgress eq 0}">
							<td>처리중</td>
						</c:when>
						<c:when test="${messageComplainList.processingProgress eq 1}">
							<td>처리완료</td>
						</c:when>
					</c:choose>
					<td>${messageComplainList.complainNo}</td>
					<td>${messageComplainList.sendMessageNo}</td>
					<td><a href="${pageContext.request.contextPath}/messageComplainContent?sendMessageNo=${messageComplainList.sendMessageNo}">${messageComplainList.messageTitle}</a></td>
					<td>${messageComplainList.complainReason}</td>
					<td>${messageComplainList.complainDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>