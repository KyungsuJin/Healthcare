<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteGroupList</title>
</head>
<body>
<h1>그룹삭제유예기간리스트</h1>
	<table>
		<thead>
			<tr>
				<th>그룹명</th>
				<th>그룹종류</th>
				<th>그룹상세</th>
				<th>날짜</th>
				<th>삭제예정날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="deleteGroup" items="${list}">
			<tr>
				<td>${deleteGroup.groupName }</td>
				<td>${deleteGroup.groupInfo }</td>
				<td>${deleteGroup.groupKindName }</td>
				<td>${deleteGroup.groupCreateDate }</td>
				<td>${deleteGroup.groupExpiredDate }</td>		
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath}/groupList">그룹리스트로 돌아가기</a>
	
</body>
</html>