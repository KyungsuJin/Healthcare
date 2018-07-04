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
	<script>
		$(document).ready(function() {
			$('.btnSearch').click(function() {
				console.log("야임마")
				location.href="${pageContext.request.contextPath}/getCalorieBattleRankList?memberId="+$('#search').val();
			})
		})
	</script>
</head>
<body>
	<h1>getCalorieBattleRankList</h1>
	<div>
		<table class="table">
			<thead>
				<tr>
					<td>랭킹</td>
					<td>회원ID</td>
					<td>키</td>
					<td>체중</td>
					<td>허리둘레</td>
					<td>BMI</td>
					<td>측정날짜</td>
					<td>소모, 섭취칼로리보기</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bodyMassIndexResponse" items="${list}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${bodyMassIndexResponse.memberId}</td>
						<td>${bodyMassIndexResponse.bodyHeight}</td>
						<td>${bodyMassIndexResponse.bodyWeight}</td>
						<td>${bodyMassIndexResponse.bodyWaistSize}</td>
						<td>${bodyMassIndexResponse.bodyMassIndex}</td>	
						<td>${bodyMassIndexResponse.bodyDate}</td>	
						<td><a href="${pageContext.request.contextPath}/getCalorieInfo?memberNo=${bodyMassIndexResponse.memberNo}">칼로리 확인</a></td>
					</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
	<div style="text-align: center;">
		<input type="text" id="search" name="search">
		<button type="button" class="btnSearch">검색</button>
	</div>

</body>
</html>