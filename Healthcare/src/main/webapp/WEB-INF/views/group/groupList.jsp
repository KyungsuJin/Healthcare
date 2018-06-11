<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>groupList</title>
</head>
<body>
<h1>groupList</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹명</th>
				<th>그룹종류</th>
				<th>그룹상세</th>
				<th>날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="groupTable" items="${list}">
			<tr>
				<td>${groupTable.groupNo }</td>
				<td>${groupTable.groupName }</td>
				<td>${groupTable.groupInfo }</td>
				<td>${groupTable.groupKindName }</td>
				<td>${groupTable.groupCreateDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/modifyGroup?groupNo=${groupTable.groupNo}" id="buttonModify">수정</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deleteGroup?groupNo=${groupTable.groupNo}" id="buttonDelete">삭제</a></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
		<a href="${pageContext.request.contextPath}/addGroup">그룹생성하기</a>
		<a href="${pageContext.request.contextPath}/searchInviteMemberForm">회원초대하기</a>
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