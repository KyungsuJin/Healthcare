<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteMemberList</title>
</head>
<body>
<h1>inviteMemberList</h1>
		<c:forEach var="groupInvite" items="${list}">
			<table>
				<thead>
					<tr>
						<th>아이디</th>					
						<th>이름</th>
						<th>초대</th>
						<th>그룹명</th>
						<th>개인정보</th>
						<th>초대승인여부</th>
						<th>초대날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>${groupInvite.memberId }</th>					
						<th>${groupInvite.memberName }</th>
						<th>${groupInvite.groupName}</th>
						<th>${groupInvite.personalInformationApproval }</th>
						<th>${groupInvite.groupInviteApproval }</th>
						<th>${groupInvite.groupInviteDate }</th>
					</tr>
				</tbody>
			</table>
		</c:forEach>
</body>
</html>