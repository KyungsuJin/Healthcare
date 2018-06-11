<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<h1> 운동매칭 </h1>
	<a href="${pageContext.request.contextPath}/addExercise">운동매칭 등록</a>
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>작성자</th>
				<th>종목</th>
				<th>장소</th>
				<th>모집인원</th>
				<th>일시</th>
			</tr>
		</thead>
			<tr>
				<td>${exercise.memberId}</td>
				<td>${exercise.exerciseNo}</td>
				<td>${exercise.exerciseMatchingPlace}</td>
				<td>${exercise.exerciseMatchingCount}</td>
				<td>${exercise.exerciseMatchingScheduleDate} / ${exercise.exerciseMatchingTime.replace(",","~")}</td>
			</tr>
			<tr>
				<td colspan="5">제목:${exercise.exerciseMatchingTitle}</td>
			</tr>
			<tr>
				<td colspan="5">
					<textarea class="form-control" rows="20" name="exerciseMatchingContent" readonly>${exercise.exerciseMatchingContent}</textarea>
				</td>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/exerciseMatching">목록으로</a>
		<c:if test="${exercise.memberId eq sessionScope.memberSessionId}">
			<a href="${pageContext.request.contextPath}/deleteExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}">삭제</a>
			<a href="${pageContext.request.contextPath}/modifyExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}">수정</a>
		</c:if>
		
	</div>
</body>
</html>