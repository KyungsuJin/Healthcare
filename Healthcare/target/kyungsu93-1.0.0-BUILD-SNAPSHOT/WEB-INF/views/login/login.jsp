<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#loginForm").keypress(function(e){
			if(e.which==13){
				$("#signButton").click();
			}
		})
		$("#signButton").click(function(){

			if($("#memberId").val().length < 4 ){
				alert('아이디를 입력 해주세요.');
				$("#memberId").focus();
				return;
			}else if($("#memberPw").val().length < 4 ){
				alert('패스워드를 입력 해주세요');
				$("#memberPw").focus();
				return;
			}else{
				console.log($("#loginForm").serialize());
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath}/login",
					data :$("#loginForm").serialize(),
					dataType :"json",
					success :function(data){
						console.log(data);
						if(data==1){
							alert('로그인 성공');
							window.location.href = '${pageContext.request.contextPath}/';
						}else if(data==3){
							alert('승인 대기중입니다.');
						}else{
							alert('회원가입을 하지않았거나 아이디 또는 비밀번호가 맞지않습니다.');
						}
					}
					
					
				})
			}
		})
	})
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST">
	<div>id : <input type="text" name="memberId" id="memberId"></div>
	<div>pw : <input type="passWord" name="memberPw" id="memberPw"></div>
	<div><button type="button" id="signButton">sign in</button></div>
	
</form>
</body>
</html>