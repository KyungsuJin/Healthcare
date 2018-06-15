<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<!-- 달력 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title>Insert title here</title>
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
						$('.divConsumeCalorie').append(result.totalExerciseCalorie);
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
	<h1>getConsumeCalorie.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>운동명</th>
				<th>운동시간(1시간 기준)</th>
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
	<button type="button" class="btnA">ssibal</button>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="panel panel-defult" >
					<div class="pd panel-body form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label">오늘총소모칼로리</label>
							<div class="col-sm-9">
								<div style="margin-top: 4px">날짜선택 : <input type="text" id="datePicker"></div>
							</div>
						</div>
						<div class="form-group" style="margin-top: 4px;">
							<div class="form-group">
								<label class="col-sm-3 control-label">오늘 총소모칼로리</label>
								<div class="col-sm-9">
									<div class="divConsumeCalorie"></div>
								</div>
							</div>			
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>	
		</div>
</body>
</html>