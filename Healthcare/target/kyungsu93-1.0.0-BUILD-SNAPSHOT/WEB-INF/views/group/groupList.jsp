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
				<th>회원명</th>
				<th>회원아이디</th>
				<th>그룹종류</th>
				<th>생성날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="group" items="${list}">
			<tr>
				<td>${group.groupNo }</td>
				<td>${group.groupName }</td>
				<td>${group.memberName }</td>
				<td>${group.memberId }</td>
				<td>${group.groupKindName }</td>
				<td>${group.groupCreateDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/modifyGroup?groupeNo=${group.groupNo}" id="buttonModify">수정</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deleteGroup?groupeNo=${group.groupNo}" id="buttonDelete">삭제</a></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>