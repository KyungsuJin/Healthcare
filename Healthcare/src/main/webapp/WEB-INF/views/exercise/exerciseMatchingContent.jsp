<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$.ajax({
				type :"POST"
				,url : "${pageContext.request.contextPath}/exerciseSignUpSelect"
				,data : {"memberNo":$("#memberNo").val()
						,"exerciseMatchingNo":$("#exerciseMatchingNo").val()
						}
				,dataType : "text"
				,success:function(data){
					if(data==1){
						$("#exerciseDiv").empty();
						$("#exerciseDiv").append('<a href="#" id="exerciseCancel">참가신청 취소</a>')
					}
				}
			});		
			$(document).on("click","#exerciseCancel",function(){
				$.ajax({
					type :"POST"
					,url : "${pageContext.request.contextPath}/exerciseCancel"
					,data : {"memberNo":$("#memberNo").val()
							,"exerciseMatchingNo":$("#exerciseMatchingNo").val()
							}
					,dataType : "text"
					,success:function(data){
						alert('신청취소가 되었습니다.');
					}
				});		
			});
			$("#matchingPlace").click(function(){
				    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
				    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
			});
			$("#exerciseSignUp").click(function(){
				if(confirm('정말로 참가신청을 하시겠습니까? 신청뒤 취소하면 불이익이 있을수 있습니다.')){
					 $.ajax({
						type : "POST"
						,url : "${pageContext.request.contextPath}/exerciseSignUp"
						,data : {"memberNo":$("#memberNo").val()
								,"exerciseMatchingNo":$("#exerciseMatchingNo").val()
								}
						,dataType:"text"
						,success:function(data){
							if(data==0){
								alert('참가신청이 완료되었습니다.');
							}else{
								alert('참가신청을 실패했습니다.');
							}
						}
					});
				}else{
					alert('참가신청이 취소되었습니다.');
					return false;
				}
				
			});
		});
	
	</script>
</head>
<body>
	<h1> 운동매칭 </h1>
	<a href="${pageContext.request.contextPath}/addExerciseMatching">운동매칭 등록</a>
	<input type="hidden" name="exercisePlaceView"id="exercisePlaceView" value="${exercise.exerciseMatchingPlace}">
	<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.memberSessionNo}">
	<input type="hidden" name="exerciseMatchingNo"id="exerciseMatchingNo" value="${exercise.exerciseMatchingNo}">
	<table border="1" class="table" id="tb">
		<thead>
			<tr>
				<th>작성자</th>
				<th>종목</th>
				<th>장소</th>
				<th>모집인원</th>
				<th>일시</th>
			</tr>
		</thead>
			<tr>
				<td>${exercise.memberId}</td>
				<td>${exercise.exerciseNo}</td>
				<td><a href="#" id="matchingPlace">${exercise.exerciseMatchingPlace}</a></td>
				<td>${exercise.exerciseMatchingCount}</td>
				<td>${exercise.exerciseMatchingScheduleDate} / ${exercise.exerciseMatchingTime.replace(",","~")}</td>
			</tr>
			<tr>
				<td colspan="5">제목:${exercise.exerciseMatchingTitle}</td>
			</tr>
			<tr>
				<td colspan="5">
					<textarea class="form-control" rows="20" name="exerciseMatchingContent" readonly>${exercise.exerciseMatchingContent}</textarea>
				</td>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/exerciseMatching">목록으로</a>
		<c:if test="${exercise.memberId eq sessionScope.memberSessionId}">
			<a href="${pageContext.request.contextPath}/deleteExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}">삭제</a>
			<a href="${pageContext.request.contextPath}/modifyExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}">수정</a>
		</c:if>
		<div id="exerciseDiv">
			<c:if test="${exercise.memberId ne sessionScope.memberSessionId}">
				<a href="#" id="exerciseSignUp">참가신청</a>
			</c:if>
		</div>
	</div>
</body>
</html>