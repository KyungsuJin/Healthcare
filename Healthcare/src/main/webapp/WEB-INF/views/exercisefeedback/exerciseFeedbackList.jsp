<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackList</title>
</head>
<body>
<h1>내가한운동피드백요청리스트</h1>
	<table>
		<thead>
			<tr>
				<th>피드백번호</th>
				<th>강사명</th>
				<th>제목</th>
				<th>내용</th>
				<th>요청날짜</th>
				<th>승인결과</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exerciseFeedback" items="${list}">
			<tr>
				<td>${exerciseFeedback.exerciseFeedbackRequestNo }</td>
				<td>${exerciseFeedback.memberName }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestTitle }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestContent }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestDate }</td>
				<td>${exerciseFeedback.exerciseFeedbackResult }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>