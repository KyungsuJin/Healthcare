<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$('#btnSearch').click(function() {
				location.href="${pageContext.request.contextPath}/getCalorieBattleRankList?memberId="+$('#search').val();
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
				<h1>칼로리 배틀 랭크</h1>
				<table class="table table-hover">
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
				<div class="form-inline" style="text-align: center;">
					<input type="text" class="form-control" id="search" name="search" placeholder="아이디를 입려하세요">
					<button type="button" class="btn btn-primary" id="btnSearch">검색</button>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>