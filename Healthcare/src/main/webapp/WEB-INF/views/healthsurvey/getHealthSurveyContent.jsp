<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		addHealthSurveyBtn{ float: right; }
		healthSurveyContentContainer{ width: 800px; margin: auto; }
</style>
	<script>
	$(document).ready(function(){
		$("#addHealthSurveyResult").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthSurveyQuestion?healthSurveyRegisterNo=${healthSurveyContent.healthSurveyRegisterNo}";
		});
		$("#removeHealthSurveyBtn").click(function(){
			location.href="${pageContext.request.contextPath}/removeHealthSurvey?healthSurveyRegisterNo=${healthSurveyContent.healthSurveyRegisterNo}";
		});
		$("#getHealthSurveyListBtn").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthSurveyList";
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
				<div id="healthSurveyContentContainer" align="center">
					<h1>HealthSurveyContent</h1>
					<input id="addHealthSurveyResult" class="btn btn-default" type="button" value="설문 시작하기">
					<input id="removeHealthSurveyBtn" class="btn btn-default" type="button" value="삭제">
					<table border="1" class="table">
						<tbody>
							<tr>
								<td>제목</td>
								<td>[${healthSurveyContent.diseaseName}] ${healthSurveyContent.healthSurveyRegisterTitle} </td>
							</tr>
							<tr>
								<td>내용</td>
								<td>${healthSurveyContent.healthSurveyRegisterContent}</td>
							</tr>
							<tr>
								<td>올린사람</td>
								<td>${healthSurveyContent.memberName}</td>
							</tr>
							<tr>
								<td>설문 평가 점수</td>
								<td>${healthSurveyContent.surveyGrade}</td>
							</tr>
							<tr>
								<td>설문 한 사람 숫자</td>
								<td>${healthSurveyContent.healthSurveyRegisterCount}</td>
							</tr>
							<tr>
								<td>차감포인트</td>
								<td>${healthSurveyContent.healthSurveyPoint}</td>
							</tr>
							<tr>
								<td>날짜</td>
								<td>${healthSurveyContent.healthSurveyRegisterDate}</td>
							</tr>
						</tbody>
					</table>
					<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
				</div>
			</div>
		</div>
	</div>
</body>
</html>