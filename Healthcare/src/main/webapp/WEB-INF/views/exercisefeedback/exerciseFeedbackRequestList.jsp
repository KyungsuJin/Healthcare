<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackRequestList</title>
</head>
<body>
<h1>운동피드백요청한회원리스트</h1>
	<table>
		<thead>
			<tr>
				<th>피드백번호</th>
				<th>제목</th>
				<th>요청자</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exerciseFeedback" items="${exercisefeedbacklist}">
			<tr>
				<td>${exerciseFeedback.exerciseFeedbackRequestNo }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${exerciseFeedback.exerciseFeedbackRequestNo }">${exerciseFeedback.exerciseFeedbackRequestTitle }</a></td>
				<td>${exerciseFeedback.memberName }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>