<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackList</title>
</head>
<body>
<h1>운동피드백요청리스트</h1>
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
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackList?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>
</body>
</html>