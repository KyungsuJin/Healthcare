<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>섭취 칼로리 리스트</h1>
				<table class="table table-hover">
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
			</div>
		</div>
	</div>
</body>
</html>

