<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteGroupList</title>
<script type="text/javascript">

</script>
</head>
<body>
<h1>나를 초대한 그룹 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>그룹명</th>
				<th>그룹종류</th>
				<th>그룹소개말</th>
				<th>그룹초대메세지</th>
				<th>초대한날짜</th>
				<th>수락</th>
				<th>거절</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="groupInvite" items="${list}">
			<tr>
				<td>${groupInvite.groupName }</td>
				<td>${groupInvite.groupKindName }</td>
				<td>${groupInvite.groupInfo }</td>
				<td>${groupInvite.groupInviteMessage }</td>
				<td>${groupInvite.groupInviteDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/trueGroup?groupNo=${groupInvite.groupName}" id="trueGroup">수락하기</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/falseGroup?groupNo=${groupInvite.groupName}" id="falseGroup">거절하기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>