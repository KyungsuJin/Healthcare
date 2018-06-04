<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#ModifyCheckForm").keypress(function(e){
				if(e.which==13){
					$("#checkButton").click();
				}
			})
			$("#checkButton").click(function(){
				$.ajax({
					type:'POST',
					url : "${pageContext.request.contextPath}/memberModifyCheck",
					data : {"memberId" : $("#memberId").val()
							,"memberPw":$("#memberPw").val()},
					dataType :"json",
					success:function(data){
						if(data==1){
							alert('회원정보 확인 완료');
							window.location.href='${pageContext.request.contextPath}/memberModify?memberId='+$("#memberId").val()+'&memberLevel='+$("#memberLevel").val();
						}else{
							alert('패스워드가 맞지 않습니다.');
							window.location.href='${pageContext.request.contextPath}/memberModifyCheck';
						}
						
					}
				})
			})
		})
	</script>
</head>
<body>
	<h1>회원 정보 수정</h1>
<%-- 	<form action="${pageContext.request.contextPath}/memberModifyCheck" id="ModifyCheckForm" method="post"> --%>
		<input type="hidden" id="memberId" value="${sessionScope.memberSessionId}">
		<input type="hidden" id="memberLevel" value="${sessionScope.memberSessionLevel}">
		<div>비밀번호 : <input type="text" id="memberPw"></div>
		<div><button type="button" id="checkButton">확인</button></div>
<!-- 	</form> -->

</body>
</html>