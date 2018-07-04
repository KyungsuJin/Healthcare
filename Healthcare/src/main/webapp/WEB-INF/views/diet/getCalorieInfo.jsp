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
</head>
<body>
	<h1>getCalorieInfo.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				<td>ID</td>
				<td>소모칼로리</td>
				<td>섭취칼로리</td>
				<td>오늘하루칼로리</td>
				<td>탄수화물</td>
				<td>단백질</td>
				<td>지방</td>
				<td>당류</td>
				<td>나트륨</td>
				<td>콜레스테롤</td>
				<td>불포화지방산</td>
				<td>입력날짜</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${calorieBattle.memberId}</td>
				<td>${calorieBattle.consumeCalorie}</td>
				<td>${calorieBattle.ingestCalorie}</td>
				<td>${calorieBattle.oneDayCalorie}</td>
				<td>${calorieBattle.carbohydrate}</td>
				<td>${calorieBattle.protein}</td>
				<td>${calorieBattle.fat}</td>
				<td>${calorieBattle.sugar}</td>
				<td>${calorieBattle.natrium}</td>
				<td>${calorieBattle.cholesterol}</td>
				<td>${calorieBattle.sfa}</td>
				<td>${calorieBattle.calorieBattleDate}</td>					
			</tr>
		</tbody>
	</table>
</body>
</html>