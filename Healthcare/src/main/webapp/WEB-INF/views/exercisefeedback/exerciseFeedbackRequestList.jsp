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
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackRequestList?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackRequestList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>
</body>
</html>