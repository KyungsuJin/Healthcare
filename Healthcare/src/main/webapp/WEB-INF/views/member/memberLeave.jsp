<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#ModifyCheckForm").keypress(function(e){
				if(e.which==13){
					$("#checkButton").click();
				}
			})
			$("#checkButton").click(function(){
				$.ajax({
					type:"POST",
					url : "${pageContext.request.contextPath}/memberModifyCheck",
					data : {"memberId" : $("#memberId").val()
							,"memberPw":$("#memberPw").val()},
					dataType :"json",
					success:function(data){
						if(data==1){
							if(confirm('정말로 회원 탈퇴 하시겠습니까?')){
								alert('회원 탈퇴가 정상적으로 되었습니다.');
								window.location.href='${pageContext.request.contextPath}/memberLeaveRequest?memberId='+$("#memberId").val()+'&memberLevel='+$("#memberLevel").val();
							}else{
								alert('취소되었습니다.');
								window.location.href='${pageContext.request.contextPath}/';
							}
							
						}else if(data==0){
							alert('패스워드가 맞지 않습니다.');
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
								 	<h4 class="title">회원 탈퇴</h4>
								 </div>
								 <div class="card-content">
									 <div class="row">
										<form action="${pageContext.request.contextPath}/memberModifyCheck" id="ModifyCheckForm" method="POST">
											<input type="hidden" id="memberId" value="${sessionScope.memberSessionId}">
											<input type="hidden" id="memberLevel" value="${sessionScope.memberSessionLevel}">
											 <div class="col-md-2"></div>
										 	<div class="col-md-8">
											 	<div class="form-group">
											 		<label class="control-label">비밀번호</label>
												 	<input class="form-control" type="password" id="memberPw">
											 	</div>
											 	<input type="button" id="checkButton" value="회원탈퇴" class="btn btn-primary pull-right">
										 	</div>
										 </form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>