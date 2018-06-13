<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#messageList").click(function(){
				window.open("${pageContext.request.contextPath}/messageList"
						,"messageList","width=700, height=700,resizable=no,scrollbars=yes");
			});
			$("#exercise").click(function(){
				$.ajax({
					type:"get"
					,url : "${pageContext.request.contextPath}/exerciseDepositChk"
					,data : {"memberNo" : $("#memberNo").val()}
					,dataType: "text"
					,success:function(data){
						if(data==0){
							alert('보증금등록을 하지않았습니다.');
							if(confirm('보증금등록을 하시겠습니까?')){
								window.open("${pageContext.request.contextPath}/exerciseDepositRegistration"
										,"Registration","width=450, height=300,resizable=no,scrollbars=yes");
							}else{
								return false;
							}
						}else{
							window.location.href="${pageContext.request.contextPath}/exerciseMatching";
						}
					}
				});
			});
		});
	</script>
</head>
<body>
	<h1>hello word</h1>
	<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
	<c:if test="${empty sessionScope.memberSessionId}">
		<a href="${pageContext.request.contextPath}/memberJoin">join</a>
		<a href="${pageContext.request.contextPath}/login">login</a>
		<a href="${pageContext.request.contextPath}/memberFindId">Find ID</a>
		<a href="${pageContext.request.contextPath}/memberFindPw">Find PW</a>
	</c:if>
	
	<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==1}">
		${sessionScope.memberSessionId}
		${sessionScope.memberSessionName}
		${sessionScope.memberSessionLevel}
		<a href="${pageContext.request.contextPath}/logout">logout</a>
		<a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a>
		<a href="${pageContext.request.contextPath}/memberLeave">회원탈퇴</a>
		<a href="${pageContext.request.contextPath}/memberApprovalList">회원승인대기리스트</a>
		<a href="${pageContext.request.contextPath}/exerciseMatching">운동매칭 관리</a>
		<a href="${pageContext.request.contextPath}/memberListChoice">회원리스트</a>
	</c:if>
	<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel!=1}">
		${sessionScope.memberSessionId}
		${sessionScope.memberSessionName}
		${sessionScope.memberSessionLevel}
		<a href="${pageContext.request.contextPath}/logout">logout</a>
		<a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a>
		<a href="#" id="messageList">메세지</a>
		<a href="#" id="exercise">운동 매칭</a>
		<a href="${pageContext.request.contextPath}/memberLeave">회원탈퇴</a>
	</c:if>
</body>
</html>