<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					console.log(data);
					$("#tb").empty();
					$("#deletBtn").empty();
					$("#deletBtn").append('<button type="button" id="deleteMessageBtn">삭제</button>');
					$("#tb").append('<tr><td><input type="checkbox" id="allChk">보낸사람</td><td>내용</td><td>날짜</td></tr>');
					$.each(data.list,function(key,val){
						$("#tb").append(
										"<tr><td><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'>"+val.sendMessageId+"</td>"+
										"<td><a href='${pageContext.request.contextPath}/messageReceiveContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
										"<td>"+val.messageDate+"</td></tr>"
										);
					});
				}
			});
		});
		$("#sendMessage").click(function(){
			 $.ajax({
				type:"POST"
				,url : "${pageContext.request.contextPath}/sendMessageList"
				,data :{"sendMemberNo" :$("#memberReceiveNo").val()}
				,dataType:"json"
				,success:function(data){
					console.log(data);
					$("#tb").empty();
					$("#deletBtn").empty();
					$("#deletBtn").append('<button type="button" id="deleteSendMessageBtn">삭제</button>');
					$("#tb").append('<tr><td><input type="checkbox" id="allChk">내용</td><td>날짜</td></tr>');
					$.each(data.list,function(key,val){
						$("#tb").append(
										"<tr>"+
										"<td><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'><a href='${pageContext.request.contextPath}/messageSendContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"&memberReceiveId="+val.memberReceiveId+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
										"<td>"+val.messageDate+"</td></tr>"
										);
					});
				}
			});
			
		});
		$(document).on("click","#allChk",function(){
			if($("#allChk").prop("checked")){
				$("input[name=deletMessageChk]").prop("checked",true);
			}else{
				$("input[name=deletMessageChk]").prop("checked",false);
			}
		});
		$(document).on("click","#deleteMessageBtn",function(){
			var chkArr=[];
			$("input[name=deletMessageChk]:checked").each(function(i){
				chkArr.push($(this).val());
				console.log(chkArr);
			})
			$.ajax({
				type :"POST"
				,data :{"valueArrayTest":chkArr}
				,dataType:"text"
				,url : "${pageContext.request.contextPath}/deleteMessageList"
				,success:function(data){
					alert("받은메시지가 삭제되었습니다.");
					$("#messageReceive").click();
				}
			})
			
		});
		$(document).on("click","#deleteSendMessageBtn",function(){
			var chkArr=[];
			$("input[name=deletMessageChk]:checked").each(function(i){
				chkArr.push($(this).val());
				console.log(chkArr);
			})
			$.ajax({
				type :"POST"
				,data :{"valueArrayTest":chkArr}
				,dataType:"text"
				,url : "${pageContext.request.contextPath}/deleteSendMessageList"
				,success:function(data){
					alert("보낸메시지가 삭제되었습니다.");
					$("#sendMessage").click();
				}
			})
			
		});
		$("#deleteMessage").click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				$("#deleteForm").submit();
			}else{
				
			}
		});
	});
	</script>
</head>
<body>
	<h1> 메시지함</h1>
	<input type="hidden" id="memberReceiveNo" name="memberReceiveNo" value="${sessionScope.memberSessionNo}">
	<div id="deletBtn" style="margin-right:5px;float:left;"></div>
	<div style="float:left;">
		<button type="button" id="messageWrite">메시지 작성</button>
		<button type="button" id="sendMessage">보낸 메시지</button>
		<button type="button" id="messageReceive">받은 메시지</button>
	</div>
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>보낸사람</th>
				<th>${message.sendMessageId}</th>
			</tr>
			<tr>
				<th>받는사람</th>
				<th>${message.memberReceiveId}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">제목 : ${message.messageTitle}</td>
			</tr>
			<tr>
				<td colspan="2"> <textarea class="form-control" rows="20" readonly>${message.messageContent}</textarea></td>
			</tr>
		</tbody>
		<tr>
			<td colspan="2">
				<form id="deleteForm" action="${pageContext.request.contextPath}/SendMessageDelete" method="post">
					<input type="hidden" id="deleteMessageNo" name="deleteMessageNo" value="${message.sendMessageNo}">
					<button type=button id="deleteMessage">삭제</button>
				</form>
			</td>
		<tr>
	</table>
</body>
</html>