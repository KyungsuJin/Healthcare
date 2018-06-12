<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteMemberList</title>
</head>
<body>
<h1>내가 초대한 회원 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>아이디</th>					
				<th>이름</th>
				<th>초대</th>
				<th>초대한그룹명</th>
				<th>초대승인여부</th>
				<th>초대날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="groupInvite" items="${list}">
				<tr>
					<th>${groupInvite.memberId }</th>					
					<th>${groupInvite.memberName }</th>
					<th>${groupInvite.groupName}</th>
					<th>${groupInvite.groupInviteApproval }</th>
					<th>${groupInvite.groupInviteDate }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/bloodPressure?currentPage=${i}">${i}</a>	
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>	
</body>
</html>