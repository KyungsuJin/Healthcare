<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pointChargingList</title>
</head>
<body>
<h1>결제 승인 대기 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>포인트결제</th>
				<th>포인트결제날짜</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pointCharging" items="${list}">
			<tr>
				<td>${pointCharging.memberId }</td>
				<td>${pointCharging.memberName }</td>
				<td>${pointCharging.pointChargingSum }</td>
				<td>${pointCharging.pointChargingDate }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/acceptCharging?pointChargingNo=${pointCharging.pointChargingNo}">승인</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deniedCharging?pointChargingNo=${pointCharging.pointChargingNo}">거절</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>