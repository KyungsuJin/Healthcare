<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#deleteMessageAll").click(function(){
				if(confirm('사용자의 보낸메시지,받은메시지가 삭제됩니다 진행하시겠습니까?')){
					window.location.href="${pageContext.request.contextPath}/deleteMessageAll?sendMessageNo=${messageComplain.sendMessageNo}"
				}else{
					alert('취소되었습니다');
					return false;
				}
			});
		});
	
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
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
				<a href="${pageContext.request.contextPath}/messageComplainList" class="btn btn-primary">목록으로</a>
				<a id="deleteMessageAll" href="#" class="btn btn-primary">메시지 삭제</a>
			</div>
		</div>
	</div>
</body>
</html>