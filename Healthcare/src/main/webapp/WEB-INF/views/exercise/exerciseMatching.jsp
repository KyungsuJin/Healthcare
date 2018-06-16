<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
			$.ajax({
				type: "POST"
				,data :{"currentPage" :$("#currentPage").val()}
				,url : "${pageContext.request.contextPath}/exerciseMatchingList"
				,dateType: "json"
				,success:function(data){
					console.log(data.exerciseMatchingList);
					exerciseMatchingList(data);
				}
			});
			function exerciseMatchingList(data){
				console.log(data);
				$.each(data.exerciseMatchingList,function(key,val){
					console.log("현재날짜:"+$("#currentDate").val());
					console.log("게임날짜:"+val.exerciseMatchingScheduleDate);
					console.log("현재시간 :"+$("#currentTime").val());
					console.log("게임시간 :"+val.exerciseMatchingTime.substring("0","5"));
					
					$("#tbody").append('<tr><td class="asd'+key+'"></td>'+
										'<td><a href="${pageContext.request.contextPath}/exerciseMatchingContent?exerciseMatchingNo='+val.exerciseMatchingNo+'">'+val.exerciseMatchingTitle+'</a></td>'+
										'<td>'+val.exerciseNo+'</td>'+
										'<td><a href="#" class="matchingPlace">'+val.exerciseMatchingPlace+'</a></td>'+
										'<td>'+val.exerciseMatchingAttendCount+'/'+val.exerciseMatchingCount+'</td>'+
										'<td>'+val.exerciseMatchingScheduleDate+'/'+val.exerciseMatchingTime.replace(",","~")+'</td>'+
										'<td>'+val.memberId+'</td><input type="hidden" value="'+val.exerciseMatchingNo+'"></tr>'
										);
					if(val.exerciseMatchingAttendCount < val.exerciseMatchingCount){
						$(".asd"+key).text('모집중');
					}else if(val.exerciseMatchingAttendCount=== val.exerciseMatchingCount){
						$(".asd"+key).text('모집마감');
					}
				});
				if(data.currentPage>1){
					$("#page").append('<a href="${pageContext.request.contextPath}/exerciseMatchingList?currentPage='+(data.currentPage-1)+'">이전 </a>');
				}
				for(var i =data.startPage; i <=data.endPage ; i++){
					$("#page").append('<a href="${pageContext.request.contextPath}/exerciseMatchingList?currentPage='+i+'">'+i+'</a>');
				}
				if(data.currentPage<data.lastPage){
					$("#page").append('<a href="${pageContext.request.contextPath}/exerciseMatchingList?currentPage='+(data.currentPage+1)+'">다음</a>');
				}
			}
			$(document).on("click",".matchingPlace",function(){
				$("#exercisePlaceView").val($(this).text());
				console.log($("#exercisePlaceView").val());
				    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
				    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
			});
		});
	</script>
</head>
<body>
	<h1> 운동매칭 </h1>

	<a href="${pageContext.request.contextPath}/addExerciseMatching">운동매칭 등록</a>
	<a href="${pageContext.request.contextPath}/attendExerciseMatching?memberNo=${sessionScope.memberSessionNo}">자신의 운동참가 리스트</a>
	<input type="hidden" name="sessionId"id="sessionId" value="${sessionScope.memberSessionId}">
	<input type="hidden" name="exercisePlaceView"id="exercisePlaceView">
	<input type="hidden" name="currnetPage" id="currentPage"  value="${currentPage}">
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>현재상태</th>
				<th>제목</th>
				<th>종목</th>
				<th>장소</th>
				<th>참가/모집(인원)</th>
				<th>일시</th>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	<div id="page"></div>
</body>
</html>