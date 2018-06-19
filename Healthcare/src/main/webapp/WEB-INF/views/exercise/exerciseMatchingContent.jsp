<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			/*내용보기를 눌렀을때 참가신청이 되어있는지와 운완료를 했는지 여부를 파악해 1이넘어오면 운동신청 2가넘어오면 운동완료를 눌름 */
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
						$("#exerciseDiv").append('<a href="#" id="exerciseCancel" class="btn btn-primary">참가신청 취소</a>')
					}else{
						$("#exerciseDiv").empty();
					}
				}
			});
			/*운동매칭 취소  */
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
						location.reload();
					}
				});		
			});
			/* 운동매칭 장소 새창 형태로 제공 */
			$("#matchingPlace").click(function(){
				    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
				    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
			});
			/* 운동매칭 참가 신청*/
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
								location.reload();
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
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1> 운동매칭 </h1>
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
					<tbody>
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
						</tr>
				</tbody>
				</table>
				<div>
					<a href="${pageContext.request.contextPath}/exerciseMatching" class="btn btn-primary">목록으로</a>
					<c:if test="${exercise.memberId eq sessionScope.memberSessionId or sessionScope.memberSessionLevel==1}">
						<a href="${pageContext.request.contextPath}/modifyExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}" class="btn btn-primary">수정</a>
						<a href="${pageContext.request.contextPath}/deleteExerciseMatching?exerciseMatchingNo=${exercise.exerciseMatchingNo}" class="btn btn-primary">삭제</a>
					</c:if>
					<div id="exerciseDiv">
						<c:if test="${exercise.exerciseMatchingCount > exercise.exerciseMatchingAttendCount}">
							<a href="#" id="exerciseSignUp" class="btn btn-primary">참가신청</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>