<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#searchDiv").hide();
			//메시지 쓰기 새창
			$("#messageWrite").click(function(){
					window.open("${pageContext.request.contextPath}/message"
							,"messageWrite","width=850, height=700,resizable=no,scrollbars=yes");
			});
			//메시지 받은 리스트
			$("#messageReceive").click(function(){
				$("#searchDiv").show();
				console.log($("#memberReceiveNo").val());
				 $.ajax({
					type:"POST"
					,url : "${pageContext.request.contextPath}/messageReceiveList"
					,data :{"memberReceiveNo" :$("#memberReceiveNo").val()
							,"currentPage" : $("#receiveCurrentPage").val()
							,"searchMessageSelect" :$("#searchMessageSelect").val()
							,"searchMessageText" :$("#searchMessageText").val()}
					,dataType:"json"
					,success:function(data){
						console.log(data.endPage);
						$("#tb").empty();
						$("#deletBtn").empty();
						$("#pageUl").empty();
						$("#pageUl").append("<input type='hidden' id='endPage' value='"+data.endPage+"'>");
						$("#deletBtn").append('<button type="button" id="deleteMessageBtn" class="btn btn-primary">메시지 삭제</button>');
						$("#tb").append('<tr><td><input type="checkbox" id="allChk">보낸사람</td><td>제목</td><td>날짜</td></tr>');
						$.each(data.list,function(key,val){
							$("#tb").append(
											"<tr><td><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'>"+val.sendMessageId+"</td>"+
											"<td><a class='messageContent"+key+"' href='${pageContext.request.contextPath}/messageReceiveContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
											"<td>"+val.messageDate+"</td></tr>"
											);	

							if(val.readMessageChk==1){
								$(".messageContent"+key).css('color','black');
								
							}
						});
						if(data.currentPage>1){
							$("#pageUl").append("<li><a class='receiveMessagePageStart' href='javascript:void(0);'><span aria-hidden='true'>&laquo;</span></a></li>");
							$("#pageUl").append("<li><a class='receiveMessagePageBack' href='javascript:void(0);'>이전</a></li>");
						}
						for(var i =data.startPage; i <=data.endPage ; i++){
							$("#pageUl").append("<li><a class='receiveMessagePage' href='javascript:void(0);'>"+i+"</a></li>");
						}
						if(data.currentPage<data.lastPage){
							$("#pageUl").append("<li><a class='receiveMessagePageNext' href='javascript:void(0);'>다음</a></li>");
							$("#pageUl").append("<li><a class='receiveMessagePageEnd' href='javascript:void(0);'><span aria-hidden='true'>&raquo;</span></a></li>");
						}
						$('li').find('a').each(function(){//li의 자식 a인것을 다찾는다
							if($(this).text() == data.currentPage){//만약 text 값이 현재페이지값과 같다면
								$(this).closest('li').addClass('active');//closest 를이용해 가장 가까운 li 를 찾아 class =active 를 추가해준다.
							}
						});
						
					}
				});
			});
			//페이징 클릭시  메시지받은함 다시실행
			$(document).on("click",".receiveMessagePage",function(){
				console.log($(this).text());
				$("#receiveCurrentPage").val($(this).text());
				$("#messageReceive").click();
			});
			$(document).on("click",".receiveMessagePageBack",function(){
				$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())-1);
				$("#messageReceive").click();
			});
			$(document).on("click",".receiveMessagePageNext",function(){
				$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())+1);
				$("#messageReceive").click();
			});
			$(document).on("click",".receiveMessagePageStart",function(){
				$("#receiveCurrentPage").val(1);
				$("#messageReceive").click();
			});
			$(document).on("click",".receiveMessagePageEnd",function(){
				$("#receiveCurrentPage").val(Number($("#endPage").val()));
				$("#messageReceive").click();
			});
			//메시지 보낸 리스트
			$("#sendMessage").click(function(){
				$("#searchDiv").hide();
				 $.ajax({
					type:"POST"
					,url : "${pageContext.request.contextPath}/sendMessageList"
					,data :{"sendMemberNo" :$("#memberReceiveNo").val(),
							"currentPage" : $("#sendCurrentPage").val()
							
							}
					,dataType:"json"
					,success:function(data){
						console.log(data);
						$("#tb").empty();
						$("#deletBtn").empty();
						$("#pageUl").empty();
						$("#pageUl").append("<input type='hidden' id='endPage' value='"+data.endPage+"'>");
						$("#deletBtn").append('<button type="button" id="deleteSendMessageBtn" class="btn btn-primary">메시지 삭제</button>');
						$("#tb").append('<tr><td><label><input type="checkbox" id="allChk">내용</td><td>날짜</td><td>수신여부</td></tr></label>');
						$.each(data.list,function(key,val){
							var sendMessageChk;
							if(val.sendMessageChk==1){
								sendMessageChk="읽음";
							}else{
								sendMessageChk="읽지않음";
							}
							$("#tb").append(
											"<tr>"+
											"<td><label><input type='checkbox' name='deletMessageChk' value='"+val.sendMessageNo+"'></label><a href='${pageContext.request.contextPath}/messageSendContent?sendMessageNo="+val.sendMessageNo+"&sendMessageId="+val.sendMessageId+"&messageTitle="+val.messageTitle+"&messageContent="+val.messageContent+"&messageDate="+val.messageDate+"&memberReceiveId="+val.memberReceiveId+"' class='messageContent'>"+val.messageTitle+"</a></td>"+
											"<td>"+val.messageDate+"</td>"+
											"<td>"+sendMessageChk+"</td></tr>"
											);
						});
						if(data.currentPage>1){
							$("#pageUl").append("<li><a class='sendMessagePageStart' href='javascript:void(0);'><span aria-hidden='true'>&laquo;</span></a></li>");
							$("#pageUl").append("<li><a class='sendMessagePageBack' href='javascript:void(0);'>이전</a></li>");
						}
						for(var i =data.startPage; i <=data.endPage ; i++){
							$("#pageUl").append("<li><a class='sendMessagePage' href='javascript:void(0);'>"+i+"</a></li>");
						}
						if(data.currentPage<data.lastPage){
							$("#pageUl").append("<li><a class='sendMessagePageNext' href='javascript:void(0);'>다음</a></li>");
							$("#pageUl").append("<li><a class='sendMessagePageEnd' href='javascript:void(0);'><span aria-hidden='true'>&raquo;</span></a></li>");
						}
						$('li').find('a').each(function(){//li의 자식 a인것을 다찾는다
							if($(this).text() == data.currentPage){//만약 text 값이 현재페이지값과 같다면
								$(this).closest('li').addClass('active');//closest 를이용해 가장 가까운 li 를 찾아 class =active 를 추가해준다.
							}
						});
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
			$(document).on("click",".sendMessagePageStart",function(){
				$("#sendCurrentPage").val(1);
				$("#sendMessage").click();
			});
			$(document).on("click",".sendMessagePageEnd",function(){
				$("#sendCurrentPage").val(Number($("#endPage").val()));
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
			$("#messageSearch").click(function(){
				$.ajax({
					type:"GET"
						,url : "${pageContext.request.contextPath}/messageSearchList"
						,data :{"searchMessageSelect" :$("#searchMessageSelect").val()
								,"searchMessageText" : $("#searchMessageText").val()
								,"memberReceiveNo" :$("#memberReceiveNo").val()
								}
						,dataType:"json"
						,success:function(data){
							console.log(data.searchMessageText);
							$("#searchDiv").append("<input type='hidden' id='searchMessageSelect' value='"+data.searchMessageSelect+"'>");
							$("#searchDiv").append("<input type='hidden' id='searchMessageText' value='"+data.searchMessageText+"'>");
							$("#messageReceive").click();
						}
				});
			});
		});
	</script>
</head>
<body>
	<div class="card">
		 <div class="card-header" data-background-color="purple">
		 	<h4 class="title">메시지</h4>
		 </div>
		 <div class="card-content">
			 <div class="row">
				 <div class="col-md-3"></div>
				 <div class="col-md-8">
					<input type="hidden" id="memberReceiveNo" name="memberReceiveNo" value="${sessionScope.memberSessionNo}">
					<input type="hidden" id="receiveCurrentPage">
					<input type="hidden" id="sendCurrentPage">
					<div id="deletBtn" style="margin-right:5px;float:left;"></div>
					<div>
						<button type="button" id="messageWrite" class="btn btn-primary">메시지 작성</button>
						<button type="button" id="sendMessage" class="btn btn-primary" >보낸 메시지</button>
						<button type="button" id="messageReceive" class="btn btn-primary">받은 메시지</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<table border="1" class="table" id="tb">
		</table>
		</div>
		<div id="page"	style="text-align:center">
			<ul class="pagination pagination-sm" id="pageUl">
			</ul>
		</div>
		<div class="navbar-form navbar-left">
		<div class="form-group">
			<div id="searchDiv">
				<select class="form-control" id ="searchMessageSelect">
					<option value="rs.send_member_id">보낸사람</option>
					<option value="rs.message_title">제목</option>
				</select>
				<input class="form-control" type="text" id="searchMessageText" >
				<button class="btn btn-white btn-round btn-just-icon" type="button"  id="messageSearch"><i class="material-icons">search</i></button>
			</div>
		</div>
	</div>
</body>
</html>