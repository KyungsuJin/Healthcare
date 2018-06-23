<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#memberPw").keypress(function(e){
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
								 	<h4 class="title">회원 정보 수정</h4>
								 </div>
								 <div class="card-content">
									 <div class="row">
									 	<input type="hidden" id="memberId" value="${sessionScope.memberSessionId}">
										<input type="hidden" id="memberLevel" value="${sessionScope.memberSessionLevel}">
										 <div class="col-md-2"></div>
										 <div class="col-md-8">
										 	<div class="form-group">
										 		<label class="control-label">비밀번호</label>
											 	<input class="form-control" type="password" id="memberPw">
										 	</div>
										 	<button type="button" id="checkButton"  class="btn btn-primary pull-right">확인</button>
										 </div>
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