<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
	<h1>신고된 메시지 세부내용</h1>
	<table class="table" border="1">
		<thead>
			<tr>
				<th>신고자</th>
				<th>신고받은자</th>
				<th>메시지번호</th>
				<th>메시지 보낸 날짜 및 시간</th>
				<th>신고이유</th>
				<th>신고한 날짜 및 시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${messageComplain.memberReceiveNo}</td>
				<td>${messageComplain.memberSendNo}</td>
				<td>${messageComplain.sendMessageNo}</td>
				<td>${messageComplain.sendMessageDate}</td>
				<td>${messageComplain.complainReason}</td>
				<td>${messageComplain.complainDate}</td>
			</tr>
			<tr>
				<td colspan="6">제목 : ${messageComplain.messageTitle}</td>
			</tr>
			<tr>
				<td colspan="6"><textarea class="form-control" rows="20"  readonly>${messageComplain.messageContent}</textarea></td>
			</tr>
		
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath}/messageComplainList">목록으로</a>
</body>
</html>