<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
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
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" data-background-color="purple">
								<h4 class="title">로그인</h4>
                             </div>
                             <div class="card-content">
                             	<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">아이디</label>
												<input class="form-control" type="text" name="memberId" id="memberId">
											</div>
											<div class="form-group">
												<label class="control-label">패스워드</label>
												<input class="form-control" type="passWord" name="memberPw" id="memberPw">
											</div>
											<button type="button" id="signButton" class="btn btn-primary pull-right">로그인</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>