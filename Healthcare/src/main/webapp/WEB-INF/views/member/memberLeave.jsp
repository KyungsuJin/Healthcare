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
						if(data==1 && confirm('정말로 회원 탈퇴 하시겠습니까?')){
							alert('회원 탈퇴가 정상적으로 되었습니다.');
							window.location.href='${pageContext.request.contextPath}/memberLeaveRequest?memberId='+$("#memberId").val()+'&memberLevel='+$("#memberLevel").val();
						}else if(data==0){
							alert('취소 되었습니다.');
							window.location.href='${pageContext.request.contextPath}/memberLeave'
						}else{
							
						}
						
					}
				})
			})
		})
	</script>
</head>
<body>
	<h1>회원 탈퇴</h1>
	<form action="${pageContext.request.contextPath}/memberModifyCheck" id="ModifyCheckForm" method="POST">
		<input type="hidden" id="memberId" value="${sessionScope.memberId}">
		<input type="hidden" id="memberLevel" value="${sessionScope.memberLevel}">
		<div>비밀번호 : <input type="text" id="memberPw"></div>
		<div><button type="button" id="checkButton">회원탈퇴</button></div>
	</form>

</body>
</html>