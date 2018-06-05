<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		addHealthScreenBtn{ float: right; }
		healthScreenResultContainer{ width: 800px; margin: auto; }
</style>
	<script>
	$(document).ready(function(){
		$("#removeHealthScreenBtn").click(function(){
			location.href="${pageContext.request.contextPath}/removeHealthScreen?healthScreenNo=${healthScreen.healthScreenNo}";
		});
		
		$("#modifyHealthScreenBtn").click(function(){
			location.href="${pageContext.request.contextPath}/modifyHealthScreen?healthScreenNo=${healthScreen.healthScreenNo}";
		});
		$("#getHealthScreenListBtn").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthScreenList";
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthScreenResultContainer" align="center">
		<h1>HealthScreenResult</h1>
		
		<input id="removeHealthScreenBtn" class="btn btn-default" type="button" value="삭제">
		<input id="modifyHealthScreenBtn" class="btn btn-default" type="button" value="수정">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>건강검진 날짜</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${healthScreen.healthScreenNo}</td>
					</tr>
					<tr>
						<td>${healthScreen.memberNo}</td>
					</tr>
					<tr>
						<td>${healthScreen.bloodSugarNo}</td>
					</tr>
					<tr>
						<td>${healthScreen.bloodPressureNo}</td>
					</tr>
					<tr>
						<td>${healthScreen.bodyMassIndexNo}</td>
					</tr>
					<tr>
						<td>${healthScreen.totalCholesterol}</td>
					</tr>
					<tr>
						<td>${healthScreen.ldlCholesterol}</td>
					</tr>
					<tr>
						<td>${healthScreen.neutralFat}</td>
					</tr>
					<tr>
						<td>${healthScreen.hdlCholesterol}</td>
					</tr>
					<tr>
						<td>${healthScreen.proteinuria}</td>
					</tr>
					<tr>
						<td>${healthScreen.hemoglobin}</td>
					</tr>
					<tr>
						<td>${healthScreen.serumCreatinine}</td>
					</tr>
					<tr>
						<td>${healthScreen.gfr}</td>
					</tr>
					<tr>
						<td>${healthScreen.healthScreenDate}</td>
					</tr>
			</tbody>
		</table>
		<input id="getHealthScreenListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>