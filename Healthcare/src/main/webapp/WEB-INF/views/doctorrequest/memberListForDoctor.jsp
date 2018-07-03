<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodSugarList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<table><!-- 회원이 의사가 요청한 건강정보 요청을 받는곳 -->
		<thead>
			<tr>
				<th>회원코드</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.memberNo }</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<td><a href="${pageContext.request.contextPath}/memberListForDoctor?memberNo=${member.memberNo}" id="memberListForDoctor">회원보기</a></td>
	<td><a href="${pageContext.request.contextPath}/addrequestDoctor?memberNo=${member.memberNo}" id="addrequestDoctor">정보요청하기</a></td>
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/memberListForDoctor?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/memberListForDoctor?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/memberListForDoctor?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/memberListForDoctor?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
				<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/memberListForDoctor?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>

</body>
</html>