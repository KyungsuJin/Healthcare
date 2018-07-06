<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>칼로리 정보 리스트</h1>
				<table class="table table-hover">
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
			</div>
		</div>
	</div>
</body>
</html>