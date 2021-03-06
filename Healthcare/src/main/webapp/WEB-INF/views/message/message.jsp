<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#memberReceiveId").val(window.opener.document.all.memberReceiveIdChange.value);
			$("#memberReceiveId").focus();
			
			/*메시지 전송시 아이디존재유무 파악  */
			$("#memberReceiveId").blur(function(){
				$.ajax({
					type:"POST"
					,data : {"memberReceiveId":$("#memberReceiveId").val()}
					,url : "${pageContext.request.contextPath}/messageIdChk"
					,dataType : "json"
					,success:function(data){
						console.log(data);
						if(data.count==1){
							$("#idChk1").remove();
							$("#idChk").append('<span id="idChk1">전송가능한 아이디</span>');
						}else{
							$("#idChk1").remove();
							$("#idChk").append('<span id="idChk1">전송불가능한 아이디</span>');
						}
						$("input[name=memberReceiveNo]").val(data.memberReceiveNo);
					}
				});
				
			});
			/* 수신인이 존재하지않을시 경고창출력 */
			$("#messageSubmit").click(function(){
				console.log($("#idChk1").text());
				console.log($("#idChk2").text());
				
				if($("#memberReceiveId").val()==null || $("#idChk1").text()=="전송불가능한 아이디" ){
					alert('수신인을 적지않았거나 전송이 가능하지않은 아이디입니다.');
					
				}else{
					var messageForm = $("#messageForm").serialize();
					$.ajax({
						type :"POST"
						,url :"${pageContext.request.contextPath}/sendMessage"
						,data: messageForm
						,success:function(data){
							alert('메시지 전송완료!');
							window.close();
						}
					});
				}
				
			});
		});
	</script>
</head>
<body>
	 <div class="card">
		 <div class="card-header" data-background-color="purple">
		 	<h4 class="title">메시지 쓰기</h4>
		 </div>
		 <div class="card-content">
		 	<form method="post" id="messageForm" name="messageForm">
				<input type="hidden" name="memberSendNo" value="${sessionScope.memberSessionNo}">
				<input type="hidden" name="memberReceiveNo">
				<div class="row">
					<div class="col-xs-2">
					</div>
					<div class="col-xs-8">
						<div class="form-group">
						 	<label class="control-label">발송인</label>
						 	<input class="form-control" type="text"  name="sendMessageId" value="${sessionScope.memberSessionId}" readonly>
						</div>
						<div class="form-group" id="idChk">
						 	<label class="control-label">수신인</label>
						 	<input class="form-control" type="text" id="memberReceiveId" name="memberReceiveId">
						 	
						</div>
						<div class="form-group">
						 	<label class="control-label">제목 </label>
						 	<input class="form-control" type="text" id="messageTitle" name="messageTitle">
						</div>
						<div class="form-group">
							<label class="control-label">내용</label>
						 	<textarea  class="form-control"  rows="20" id="messageContent" name="messageContent"></textarea>
						</div>
						<button type="button" id="messageSubmit" class="btn btn-primary pull-right">전송</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>