<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
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
							$("#idChk").append('<span id="idChk1">발송가능한 아이디</span>');
						}else{
							$("#idChk1").remove();
							$("#idChk").append('<span id="idChk1">불가능한 아이디</span>');
						}
						$("input[name=memberReceiveNo]").val(data.memberReceiveNo);
					}
				});
				
			});
			$("#messageSubmit").click(function(){
				console.log($("#idChk1").text());
				console.log($("#idChk2").text());
				
				if($("#memberReceiveId").val().length < 1 || $("#idChk1").text()=="불가능한 아이디" ){
					alert('수신인을 적지않았거나 전송이 가능하지않은 아이디입니다.');
					
				}else{
					$("#messageForm").submit();
					alert('메시지 전송완료!');
				}
				
			});
		});
	</script>

</head>
<body>
	<h1> 메시지 쓰기</h1>
	<div>
		<form action="${pageContext.request.contextPath}/sendMessage" method="post" id="messageForm">
			<input type="hidden" name="memberSendNo" value="${sessionScope.memberSessionNo}">
			<input type="hidden" name="memberReceiveNo">
			<div>발송인 : <input type="text"  name="sendMessageId" value="${sessionScope.memberSessionId}" readonly></div>
			<div id="idChk">수신인 : <input type="text" id="memberReceiveId" ></div>
			<div> 제목 : <input type="text" id="messageTitle" name="messageTitle"></div>
			<div><textarea cols="70" rows="20" id="messageContent" name="messageContent"></textarea></div>
			<div><button type="button" id="messageSubmit">전송</button></div>
		</form>
	</div>

</body>
</html>