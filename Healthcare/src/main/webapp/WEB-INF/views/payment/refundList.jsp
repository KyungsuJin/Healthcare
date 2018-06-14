<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>refundList</title>
</head>
<body>
<h1>환불 승인 대기 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>환불금액</th>
				<th>환불신청날짜</th>
				<th>환불제목</th>
				<th>환불사유</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="refund" items="${list}">
			<tr>
				<td>${refund.memberId }</td>
				<td>${refund.memberName }</td>
				<td>${refund.refundSum }</td>
				<td>${refund.refundDate }</td>
				<td>${refund.refundTitle }</td>
				<td>${refund.refundContent }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/acceptRefund?refundNo=${refund.refundNo}">승인</a></td>
				<td><a type="button" href="${pageContext.request.contextPath}/deniedRefund?refundNo=${refund.refundNo}">거절</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>