<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
			$.ajax({
				type: "POST"
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
					$("#tbody").append('<tr><td>'+val.exerciseMatchingNo.substring(18,20)+'</td>'+
										'<td><a href="${pageContext.request.contextPath}/exerciseMatchingContent?exerciseMatchingNo='+val.exerciseMatchingNo+'">'+val.exerciseMatchingTitle+'</a></td>'+
										'<td>'+val.exerciseNo+'</td>'+
										'<td><a href="#" class="matchingPlace">'+val.exerciseMatchingPlace+'</a></td>'+
										'<td>'+val.exerciseMatchingCount+'</td>'+
										'<td>'+val.exerciseMatchingScheduleDate+'/'+val.exerciseMatchingTime.replace(",","~")+'</td>'+
										'<td>'+val.memberId+'</td><input type="hidden" value="'+val.exerciseMatchingNo+'"></tr>'
										);
				});
			}
			/* function exerciseMatchingContent(exerciseMatchingNo){
				$.ajax({
					type:"POST"
					,url : "${pageContext.request.contextPath}/exerciseMatchingContent"
					,data : {"exerciseMatchingNo" :exerciseMatchingNo}
					,dataType:"json"
					,success:function(data){
						console.log(data.exerciseContent);
						$("#tb").empty();
						$("#tb").append('<thead><tr><th>작성자</th><th>종목</th><th>장소</th><th>모집인원</th><th>일시</th></tr></thead>'+
										'<tbody><tr><td>'+data.exerciseContent.memberId+'</td>'+
										'<td>'+data.exerciseContent.exerciseNo+'</td>'+
										'<td>'+data.exerciseContent.exerciseMatchingPlace+'</td>'+
										'<td>'+data.exerciseContent.exerciseMatchingCount+'</td>'+
										'<td>'+data.exerciseContent.exerciseMatchingDate+'</td></tr>'+
										'<tr><td colspan="5">제목:'+data.exerciseContent.exerciseMatchingTitle+'</td></tr>'+
										'<tr><td colspan="5"><textarea class="form-control" rows="20" name="exerciseMatchingContent" readonly>'+data.exerciseContent.exerciseMatchingContent+'</textarea></td></td>');
										
						$("#tb").after('<a href="${pageContext.request.contextPath}/exerciseMatching">목록으로</a>');
						if(data.exerciseContent.memberId ==$("#sessionId").val()){
							$("#tb").after('<a href="${pageContext.request.contextPath}/deleteExerciseMatching">삭제</a>');
						}
					}
				});
			} */
			$(document).on("click",".matchingPlace",function(){
				$("#exercisePlaceView").val($(this).text());
				console.log($("#exercisePlaceView").val());
				    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
				    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
			});
			/* $(document).on("click",".matchingNo",function(){
				console.log($(this).closest("td").siblings("input").val());
				exerciseMatchingContent($(this).closest("td").siblings("input").val());
			}); */
		});
	</script>
</head>
<body>
	<h1> 운동매칭 </h1>
	<a href="${pageContext.request.contextPath}/addExercise">운동매칭 등록</a>
	<input type="hidden" name="sessionId"id="sessionId" value="${sessionScope.memberSessionId}">
	<input type="hidden" name="exercisePlaceView"id="exercisePlaceView">
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>종목</th>
				<th>장소</th>
				<th>인원</th>
				<th>일시</th>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	

</body>
</html>