<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$(".approvalBtn").click(function(){
				if(confirm('회원가입을 승인하시겠습니까?')){
					
				}else{
					return false;
				}
			})
		})
	</script>
</head>
<body>
	<h1>회원 승인 대기리스트</h1>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>상세보기</th>
				<th>승인</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${member}" var="member">
			<tr>
				<td>${member.memberNo}</td>
				<td>${member.memberId}</td>
				<td>${member.memberName}</td>
				<td>${member.memberGender}</td>
				<td>${member.memberBirth}</td>
				<td><a href="${pageContext.request.contextPath}/memberApprovalContent?memberNo=${member.memberNo}&memberLevel=${member.memberLevel}">상세보기</a></td>
				<td>
					<a id="approvalBtn" class="approvalBtn" href="${pageContext.request.contextPath}/approval?memberNo=${member.memberNo}&memberLevel=${member.memberLevel}">승인</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="pageDiv">
		<c:if test="${currentPage>1}">
			<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=1"></a>
			<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${currentPage-1}">이전</a>
		</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
				<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${i}">${i}</a>
			</c:forEach>
		<c:if test="${lastPage>currentPage}">
			<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${lastPage}"></a>
		</c:if>
	</div>
</body>
</html>