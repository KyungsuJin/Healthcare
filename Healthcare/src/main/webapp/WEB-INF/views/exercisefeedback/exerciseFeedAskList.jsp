<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedList</title>
</head>
<body>
<h1>exerciseFeedList</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹명</th>
				<th>그룹종류</th>
				<th>그룹상세</th>
				<th>날짜</th>
				<th>수정</th>
				<th>회원초대하기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exerciseFeed" items="${list}">
			<tr>
				<td>${groupTable.groupNo }</td>
				<td>${groupTable.groupName }</td>
				<td>${groupTable.groupKindName }</td>
				<td>${groupTable.groupInfo }</td>
				<td>${groupTable.groupCreateDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/modifyGroup?groupNo=${groupTable.groupNo}" id="buttonModify">수정</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/inviteMemberForm?groupNo=${groupTable.groupNo}" id="buttonModify">회원초대하기</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deleteGroup?groupNo=${groupTable.groupNo}" id="buttonDelete">삭제</a></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>