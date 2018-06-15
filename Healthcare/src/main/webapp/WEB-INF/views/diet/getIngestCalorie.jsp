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
	<title>get Ingest Calorie</title>
	<script>
		$(document).ready(function() {
			$('#datePicker').change(function() {
				$.ajax({
					type : 'POST'
					,url : "${pageContext.request.contextPath}/totalCalorie"
					,data : {"memberNo" :$('.memberNo').val(), "datePicker":$('#datePicker').val()}
					,dataType : "json"
					,success : function(result) {
						alert('성공');
						$('.divKcal').append(result.totalKcal);
						$('.divCarbohydrate').append(result.totalCarbohydrate);	
						$('.divProtein').append(result.totalProtein);	
						$('.divFat').append(result.totalFat);	
						$('.divSugar').append(result.totalSugar);	
						$('.divNatrium').append(result.totalNatrium);	
						$('.divCholesterol').append(result.totalCholesterol);	
						$('.divSfa').append(result.totalSfa);	
						
					}
	 				,error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})
			
			$(function() {
				$("#datePicker").datepicker({
					changeMonth: true,
					changeYear: true
				});
			});		
		})
	</script>
</head>
<body>
	<h1>get Ingest Calorie.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>음식명</th>
				<th>섭취량(100g)</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ingestCalorie" items="${list}" varStatus="status">
				<input type="hidden" class="memberNo" value="${ingestCalorie.memberNo}">
				<tr>
					<td>${status.count}</td>
					<td>${ingestCalorie.foodName}</td>
					<td>${ingestCalorie.ingestWeight}</td>
					<td>${ingestCalorie.ingestCalorieDate}</td>
					<td><a href="">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/removeIngestCalorie?ingestCalorieNo=${ingestCalorie.ingestCalorieNo}&memberNo=${ingestCalorie.memberNo}">삭제</a></td>
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
						<label class="col-sm-3 control-label">오늘총섭취칼로리</label>
						<div class="col-sm-9">
							<div style="margin-top: 4px">날짜선택 : <input type="text" id="datePicker"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">일일칼로리</label>
						<div class="col-sm-9">
							<div class="divKcal"></div>
						</div>
					</div>
					<div class="form-group" style="margin-top: 4px;">
						<div class="form-group">
							<label class="col-sm-3 control-label">탄수화물</label>
							<div class="col-sm-9">
								<div class="divCarbohydrate"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">단백질</label>
							<div class="col-sm-9">
								<div class="divProtein"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">지방</label>
							<div class="col-sm-9">
								<div class="divFat"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">당류</label>
							<div class="col-sm-9">
								<div class="divSugar"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">나트륨</label>
							<div class="col-sm-9">
								<div class="divNatrium"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">콜레스테롤</label>
							<div class="col-sm-9">
								<div class="divCholesterol"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">불포화지방산</label>
							<div class="col-sm-9">
								<div class="divSfa"></div>
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