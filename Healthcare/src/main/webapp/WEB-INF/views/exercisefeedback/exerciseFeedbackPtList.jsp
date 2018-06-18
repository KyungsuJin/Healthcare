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
			<c:forEach var="teacher" items="${exercisePtlist}">
				<tr>
					<td>${teacher.memberName }</td>
					<td>${teacher.memberWorkSpace }</td>
					<td>${teacher.memberTotalFeedback }</td>
					<td>${teacher.memberAgreeFeedback }</td>
					<td>${teacher.evaluationAverageGrade }</td>
					<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequest?memberNo=${teacher.memberNo}">선택하기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackPtList?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackPtList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/exerciseFeedbackPtList?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackPtList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackPtList?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>
</body>
</html>