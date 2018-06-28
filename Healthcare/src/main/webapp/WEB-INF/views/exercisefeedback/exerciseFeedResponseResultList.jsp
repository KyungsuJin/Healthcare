<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedResponseResultList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h1>exercuseFeedResponseResultList</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="exerciseFeedbackResult" items="${list}">
						<tr>
							<td>${exerciseFeedbackResult.exerciseFeedbackRequestNo }</td>
							<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedResponseResultDetail?exerciseFeedbackRequestNo=${exerciseFeedbackResult.exerciseFeedbackRequestNo }">${exerciseFeedbackResult.exerciseFeedbackTitle }</a></td>
							<td>${exerciseFeedbackResult.memberId }</td>
							<td>${exerciseFeedbackResult.exerciseFeedbackResultDate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<button class="btn btn-sm btn-default" onclick="requestListBtn()">요청리스트로 돌아가기</button>
					<button class="btn btn-sm btn-default" onclick="addRequestBtn()">운동피드백 요청하기</button>
				</div>
				<nav>
					<ul class="pagination pagination-sm">
						<c:if test="${currentPage > 10}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedResponseResultList?currentPage=1">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${firstBlockPage > 2}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedResponseResultLis?currentPage=${firstBlockPage-1}">&lsaquo;</a>
							</li>
						</c:if>
							<li>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<a href="${pageContext.request.contextPath}/exerciseFeedResponseResultLis?currentPage=${i}">${i}</a>				
							</c:forEach>		
							</li>
						<c:if test="${lastBlockPage < totalBlock}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedResponseResultLis?currentPage=${lastBlockPage+1}">&rsaquo;</a>
							</li>
						</c:if>
						<c:if test="${currentPage < lastPage}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedResponseResultLis?currentPage=${lastPage}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>
