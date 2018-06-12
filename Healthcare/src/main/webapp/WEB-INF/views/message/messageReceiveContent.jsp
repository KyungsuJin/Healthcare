<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
	$(document).ready(function(){
		//메시지 쓰기 새창
		$("#writeMessage").click(function(){
				window.open("${pageContext.request.contextPath}/message"
						,"messageWrite","width=700, height=700,resizable=no,scrollbars=yes");
		});
		//메시지 받은 리스트
		$("#receiveMessage").click(function(){
			console.log($("#memberReceiveNo").val());
			 $.ajax({
				type:"POST"
				,url : "${pageContext.request.contextPath}/messageReceiveList"
				,data :{"memberReceiveNo" :$("#memberReceiveNo").val()
						,"currentPage" : $("#receiveCurrentPage").val()}
				,dataType:"json"
				,success:function(data){
					console.log(data);
					$("#tb").empty();
					$("#deletBtn").empty();
					$("#page").empty();
					$("#deletBtn").append('<button type="button" id="deleteMessageBtn">삭제</button>');
					$("#tb").append('<tr><td><input type="checkbox" id="allChk">보낸사람</td><td>내용</td><td>날짜</td></tr>');
					$.each(data.list,function(key,val){
						
						$("#tb").append(
										"<tr><td><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'>"+val.sendMessageId+"</td>"+
										"<td><a class='messageContent' href='${pageContext.request.contextPath}/messageReceiveContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
										"<td>"+val.messageDate+"</td></tr>"
										);
						if(val.readMessageChk==1){
							$(".messageContent").css('color','red');
						}
					});
					if(data.currentPage>1){
						$("#page").append("<a class='receiveMessagePageBack' href='javascript:void(0);'>이전</a>");
					}
					for(var i =data.startPage; i <=data.endPage ; i++){
						$("#page").append("<a class='receiveMessagePage' href='javascript:void(0);'>"+i+"</a>");
					}
					if(data.currentPage<data.lastPage){
						$("#page").append("<a class='receiveMessagePageNext' href='javascript:void(0);'>다음</a>");
					}
				}
			});
		});
		//페이징 클릭시  메시지받은함 다시실행
		$(document).on("click",".receiveMessagePage",function(){
			console.log($(this).text());
			$("#receiveCurrentPage").val($(this).text());
			$("#receiveMessage").click();
		});
		$(document).on("click",".receiveMessagePageBack",function(){
			$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())-1);
			$("#receiveMessage").click();
		});
		$(document).on("click",".receiveMessagePageNext",function(){
			$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())+1);
			$("#receiveMessage").click();
		});
		//메시지 보낸 리스트
		$("#sendMessage").click(function(){
			 $.ajax({
				type:"POST"
				,url : "${pageContext.request.contextPath}/sendMessageList"
				,data :{"sendMemberNo" :$("#memberReceiveNo").val(),
						"currentPage" : $("#sendCurrentPage").val()}
				,dataType:"json"
				,success:function(data){
					console.log(data);
					$("#tb").empty();
					$("#deletBtn").empty();
					$("#page").empty();
					$("#deletBtn").append('<button type="button" id="deleteSendMessageBtn">삭제</button>');
					$("#tb").append('<tr><td><input type="checkbox" id="allChk">내용</td><td>날짜</td><td>수신여부</td></tr>');
					$.each(data.list,function(key,val){
						var sendMessageChk;
						if(val.sendMessageChk==1){
							sendMessageChk="읽음";
						}else{
							sendMessageChk="읽지않음";
						}
						$("#tb").append(
										"<tr>"+
										"<td><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'><a href='${pageContext.request.contextPath}/messageSendContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"&memberReceiveId="+val.memberReceiveId+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
										"<td>"+val.messageDate+"</td>"+
										"<td>"+sendMessageChk+"</td></tr>"
										);
					});
					if(data.currentPage>1){
						$("#page").append("<a class='sendMessagePageBack' href='javascript:void(0);'>이전</a>");
					}
					for(var i =data.startPage; i <=data.endPage ; i++){
						$("#page").append("<a class='sendMessagePage' href='javascript:void(0);'>"+i+"</a>");
					}
					if(data.currentPage<data.lastPage){
						$("#page").append("<a class='sendMessagePageNext' href='javascript:void(0);'>다음</a>");
					}
				}
			});
			
		});
		//보낸 리스트 페이징 클릭시 메시지보낸리스트 호출
		$(document).on("click",".sendMessagePage",function(){
			$("#sendCurrentPage").val($(this).text());
			$("#sendMessage").click();
		});
		$(document).on("click",".sendMessagePageBack",function(){
			$("#sendCurrentPage").val(Number($("#sendCurrentPage").val())-1);
			$("#sendMessage").click();
		});
		$(document).on("click",".sendMessagePageNext",function(){
			$("#sendCurrentPage").val(Number($("#sendCurrentPage").val())+1);
			$("#sendMessage").click();
		});
		
		$(document).on("click","#allChk",function(){
			if($("#allChk").prop("checked")){
				$("input[name=deletMessageChk]").prop("checked",true);
			}else{
				$("input[name=deletMessageChk]").prop("checked",false);
			}
		});
		//메시지 삭제 버튼
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
		//메시지 삭제 체크로 다중 삭제 
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
			$("#reportMessage").click(function(){
				
			})
		});
	</script>
</head>
<body>
	<h1> 메시지함</h1>
	<input type="hidden" id="memberReceiveNo" name="memberReceiveNo" value="${sessionScope.memberSessionNo}">
	<input type="hidden" id="receiveCurrentPage">
	<input type="hidden" id="sendCurrentPage">
	<input type="hidden" id="sendMessageNo" name="sendMessageNo" value="${message.sendMessageNo}">
	<div id="deletBtn" style="margin-right:5px;float:left;"></div>
	<div style="float:left;">
		<button type="button" id="writeMessage">메시지 작성</button>
		<button type="button" id="sendMessage">보낸 메시지</button>
		<button type="button" id="receiveMessage">받은 메시지</button>
		<button type="button" id="reportMessage">메시지 신고</button>
	</div>
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>보낸사람</th>
				<th>${message.sendMessageId}</th>
			</tr>
			<tr>
				<th>받는사람</th>
				<th>${sessionScope.memberSessionId}</th>
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
				<form id="deleteForm"action="${pageContext.request.contextPath}/ReceiveMessageDelete" method="post">
					<input type="hidden" id="deleteMessageNo" name="deleteMessageNo" value="${message.sendMessageNo}">
					<button type=button id="deleteMessage">삭제</button>
				</form>
			</td>
		<tr>
	</table>
	<div id="page" style="text-align: center;"></div>
</body>
</html>