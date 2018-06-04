<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>hello word</h1>
	<c:if test="${empty sessionScope.memberId}">
		<a href="${pageContext.request.contextPath}/memberJoin">join</a>
		<a href="${pageContext.request.contextPath}/login">login</a>
		<a href="${pageContext.request.contextPath}/memberFindId">Find ID</a>
		<a href="${pageContext.request.contextPath}/memberFindPw">Find PW</a>
	</c:if>
	
	<c:if test="${!empty sessionScope.memberId && sessionScope.memberLevel==1}">
		${sessionScope.memberId}
		${sessionScope.memberSessionName}
		${sessionScope.memberLevel}
		<a href="${pageContext.request.contextPath}/logout">logout</a>
		<a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a>
		<a href="${pageContext.request.contextPath}/memberLeave">회원탈퇴</a>
		<a href="${pageContext.request.contextPath}/memberApprovalList">회원승인대기리스트</a>
	</c:if>
	
	<c:if test="${!empty sessionScope.memberId && sessionScope.memberLevel!=1}">
		${sessionScope.memberId}
		${sessionScope.memberSessionName}
		${sessionScope.memberLevel}
		<a href="${pageContext.request.contextPath}/logout">logout</a>
		<a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a>
		<a href="${pageContext.request.contextPath}/memberLeave">회원탈퇴</a>
	</c:if>
</body>
</html>