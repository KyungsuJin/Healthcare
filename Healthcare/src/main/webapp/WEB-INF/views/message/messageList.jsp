<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
			$("#messageWrite").click(function(){
					window.open("${pageContext.request.contextPath}/message"
							,"messageWrite","width=700, height=700,resizable=no,scrollbars=yes");
			});
			$("#messageReceive").click(function(){
				console.log($("#memberReceiveNo").val());
				 $.ajax({
					type:"POST"
					,url : "${pageContext.request.contextPath}/messageReceiveList"
					,data :{"memberReceiveNo" :$("#memberReceiveNo").val()}
					,dataType:"json"
					,success:function(data){
						console.log(data.list);
						$("#tb").empty();
						$("#tb").append('<tr><td>보낸사람</td><td>내용</td><td>날짜</td></tr>');
						$.each(data.list,function(key,val){
							$("#tb").append(
											'<tr><td>'+val.sendMessageId+'</td>'+
											'<td><a href="${pageContext.request.contextPath}/messageContext?messageNo='+val.sendMessageNo+'" class="messageContent">'+val.messageTitle+'</a></td>'+
											'<td>'+val.messageDate+'</td></tr>'
											);
						});
					}
				});
			});
			$(document).on("click",".messageContent",function(){
				console.log($(this).val());
			});
			
		});
	</script>
</head>
<body>
	<h1> 메시지함</h1>
	<input type="hidden" id="memberReceiveNo" name="memberReceiveNo" value="${sessionScope.memberSessionNo}">
	<button type="button" id="messageWrite">메시지 작성</button>
	<button type="button">보낸 메시지</button>
	<button type="button" id="messageReceive">받은 메시지</button>
	<table border="1" class="table" id="tb">
	</table>
</body>
</html>