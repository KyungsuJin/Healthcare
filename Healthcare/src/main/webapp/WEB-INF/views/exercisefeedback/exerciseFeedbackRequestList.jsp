<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackList</title>
</head>
<body>
<h1>운동피드백요청한회원리스트</h1>
	<table>
		<thead>
			<tr>
				<th>피드백번호</th>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>제목</th>
				<th>내용</th>
				<th>등록날짜</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exerciseFeedback" items="${list}">
			<tr>
				<td>${exerciseFeedback.exerciseFeedbackRequestNo }</td>
				<td>${exerciseFeedback.memberId }</td>
				<td>${exerciseFeedback.memberName }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestTitle }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestContent }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/acceptExerciseFeedback?exerciseFeedbackRequestNo=${exerciseFeedback.exerciseFeedbackRequestNo}">승인</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deniedExerciseFeedback?exerciseFeedbackRequestNo=${exerciseFeedback.exerciseFeedbackRequestNo}">거절</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>