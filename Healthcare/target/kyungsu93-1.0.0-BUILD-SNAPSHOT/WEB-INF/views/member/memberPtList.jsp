<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h1>PT회원 리스트</h1>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>PT 면허 번호</th>
				<th>근무지</th>
				<th>성별</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>포인트</th>
				<th>가입날짜</th>
				<th>개인정보동의여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="member">
			<tr>
				<td>${member.memberNo}</td>
				<td>${member.memberId}</td>
				<td>${member.memberName}</td>
				<td>${member.doctorRegisterNo}</td>
				<td>${member.memberWorkSpace}</td>
				<td>${member.memberGender}</td>
				<td>${member.memberAddress}</td>
				<td>${member.memberTel}</td>
				<td>${member.memberEmail}</td>
				<td>${member.memberBirth}</td>
				<td>${member.memberPoint}</td>
				<td>${member.memberJoinDate}</td>
				<td>${member.memberAgree}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="pageDiv">
		<c:if test="${currentPage>1}">
			<a href="${pageContext.request.contextPath}/memberList?currentPage=1&memberLevel=4"></a>
			<a href="${pageContext.request.contextPath}/memberList?currentPage=${currentPage-1}&memberLevel=4">이전</a>
		</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
				<a href="${pageContext.request.contextPath}/memberList?currentPage=${i}&memberLevel=4">${i}</a>
			</c:forEach>
		<c:if test="${lastPage>currentPage}">
			<a href="${pageContext.request.contextPath}/memberList?currentPage=${currentPage+1}&memberLevel=4">다음</a>
			<a href="${pageContext.request.contextPath}/memberList?currentPage=${lastPage}&memberLevel=4"></a>
		</c:if>
	</div>
</body>
</html>