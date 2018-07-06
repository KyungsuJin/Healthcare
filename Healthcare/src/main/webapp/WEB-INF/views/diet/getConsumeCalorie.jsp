<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 달력 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$(function() {
				$("#datePicker").datepicker({
					changeMonth: true,
					changeYear: true
				});
			});	
			$('#datePicker').change(function() {
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/totalConsume"
					,data : {"memberNo":$('.memberNo').val(), "datePicker":$('#datePicker').val()}
					,dataType : "json"
					,success : function(result) {
						alert('성공');
						console.log(result.totalExerciseCalorie);
						$('#divConsumeCalorie').append(result.totalExerciseCalorie);
					}
					,error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})
		})
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>소모 칼로리 리스트</h1>
				<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>NO</th>
								<th>운동명</th>
								<th>운동시간(시간)</th>
								<th>등록일</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="consumeCalorie" items="${list}" varStatus="status">
								<input type="hidden" class="memberNo" value="${consumeCalorie.memberNo}">
								<tr>
									<td>${status.count}</td>
									<td>${consumeCalorie.exerciseName}</td>
									<td>${consumeCalorie.consumeTime}</td>
									<td>${consumeCalorie.consumeCalorieDate}</td>
									<td><a href="">수정</a></td>
									<td><a href="${pageContext.request.contextPath}/removeConsumeCalorie?consumeCalorieNo=${consumeCalorie.consumeCalorieNo}&memberNo=${consumeCalorie.memberNo}">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="form-group">
						<label class="control-label">날짜선택</label>
						<input type="text" id="datePicker">
					</div>
					<div id="divConsumeCalorie" class="form-control"></div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>