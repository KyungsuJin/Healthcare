<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>신고된 메시지 리스트</h1>
				<table class="table" border="1">
					<thead>
						<tr>
							<th>처리상태</th>
							<th>신고번호</th>
							<th>메시지번호</th>
							<th>메시지제목</th>
							<th>신고이유</th>
							<th>신고한 날짜 및 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageComplainList}" var="messageComplainList">
							<tr>
								<c:choose>
									<c:when test="${messageComplainList.processingProgress eq 0}">
										<td>처리중</td>
									</c:when>
									<c:when test="${messageComplainList.processingProgress eq 1}">
										<td>처리완료</td>
									</c:when>
								</c:choose>
								<td>${messageComplainList.complainNo}</td>
								<td>${messageComplainList.sendMessageNo}</td>
								<td><a href="${pageContext.request.contextPath}/messageComplainContent?sendMessageNo=${messageComplainList.sendMessageNo}">${messageComplainList.messageTitle}</a></td>
								<td>${messageComplainList.complainReason}</td>
								<td>${messageComplainList.complainDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
						<div id="pageDiv" style="text-align:center;">
			  				<ul class="pagination pagination-sm">
			  					<li>
									<c:if test="${currentPage>1}">
										<a href="${pageContext.request.contextPath}/messageComplainList?currentPage=1"><span aria-hidden="true">&laquo;</span></a>
										<a href="${pageContext.request.contextPath}/messageComplainListcurrentPage=${currentPage-1}">이전</a>
									</c:if>
								</li>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									
										<li <c:out value="${currentPage eq i ? 'class=active': ''}"/>><a class="" href="${pageContext.request.contextPath}/messageComplainList?currentPage=${i}">${i}</a></li>
									
								</c:forEach>
								<li>
									<c:if test="${lastPage>currentPage}">
										<a href="${pageContext.request.contextPath}/messageComplainList?currentPage=${currentPage+1}">다음</a>
										<a href="${pageContext.request.contextPath}/messageComplainList?currentPage=${lastPage}"><span aria-hidden="true">&raquo;</span></a>
									</c:if>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
</body>
</html>