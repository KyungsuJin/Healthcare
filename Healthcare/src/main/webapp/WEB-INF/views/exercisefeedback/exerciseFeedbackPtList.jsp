<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<c:forEach var="memberTeacher" items="${list}">
			<tr>
				<td>${memberTeacher.memberName }</td>
				<td>${memberTeacher.WorkSpace }</td>
				<td>${memberTeacher.memberTotalFeedback }</td>
				<td>${memberTeacher.memberAgreeFeedback }</td>
				<td>${memberTeacher.evaluationAverageGrade }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackReqeust?memberNo=${memberTeacher.memberNo}">선택하기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>