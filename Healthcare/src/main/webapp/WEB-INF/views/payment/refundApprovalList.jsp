<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>refundApprovalList</title>
</head>
<body>
<h1>환불 승인 리스트</h1>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>환불금액</th>
				<th>환불책임자번호</th>
				<th>환불승인날짜</th>
				<th>환불지급완료</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="refund" items="${list}">
				<tr>
					<td>${refund.memberId }</td>
					<td>${refund.memberName }</td>
					<td>${refund.refundSum }</td>
					<td>${refund.refundDate }</td>
					<td>${refund.refundDirectorNo }</td>
					<td>${refund.refundApprovalDate }</td>
					<td><a type="button" href="${pageContext.request.contextPath}/completeRefund?refundNo=${refund.refundNo}">승인</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>