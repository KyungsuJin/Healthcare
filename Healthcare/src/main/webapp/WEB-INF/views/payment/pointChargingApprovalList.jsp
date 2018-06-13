<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pointChargingApprovalList</title>
</head>
<body>
<h1>결제 승인 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>포인트결제</th>
				<th>포인트결제날짜</th>
				<th>승인담당자번호</th>
				<th>승인날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pointChargingApproval" items="${list}">
			<tr>
				<td>${pointChargingApproval.memberId }</td>
				<td>${pointChargingApproval.memberName }</td>
				<td>${pointChargingApproval.pointChargingSum }</td>
				<td>${pointChargingApproval.pointChargingDate }</td>
				<td>${pointChargingApproval.pointChargingDirectorNo }</td>
				<td>${pointChargingApproval.pointChargingApprovalDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>