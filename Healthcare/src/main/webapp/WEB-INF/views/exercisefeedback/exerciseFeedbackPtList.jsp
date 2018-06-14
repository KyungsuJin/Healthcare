<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackPtList</title>
</head>
<body>	
<h1>운동 피드백 요청 스텝1</h1>
		피드백을 요청할 강사를 선택해주세요
	<table>
		<thead>
			<tr>
				<th>강사명</th>
				<th>근무지</th>
				<th>총피드백수</th>
				<th>피드백동의수</th>
				<th>평가점수</th>
				<th>선택</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="teacher" items="${list}">
				<tr>
					<td>${teacher.memberName }</td>
					<td>${teacher.memberWorkSpace }</td>
					<td>${teacher.memberTotalFeedback }</td>
					<td>${teacher.memberAgreeFeedback }</td>
					<td>${teacher.evaluationAverageGrade }</td>
					<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackReqeust?memberNo=${teacher.memberNo}">선택하기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>