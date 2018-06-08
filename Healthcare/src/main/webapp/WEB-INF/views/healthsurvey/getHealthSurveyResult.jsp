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
		$("#getDoctorFeedbackList").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});
		
		$("#getHealthSurveyListBtn").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthSurveyList";
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div class="healthSurveyResultContainer" align="center">
		<h1>getHealthSurveyResult</h1>
		${healthSurveyResultResponse.healthSurveyResultNo}<br>
		${healthSurveyResultResponse.healthSurveyRegisterNo}<br>
		${healthSurveyResultResponse.healthSurveyResultDate}<br>
		${healthSurveyResultResponse.healthSurveyTotalGrade}<br>
		${healthSurveyResultResponse.memberName}<br>
		${healthSurveyResultResponse.diseaseName}<br>
		${healthSurveyResultResponse.healthSurveyRegisterTitle}<br>
		${healthSurveyResultResponse.healthSurveyRegisterContent}<br>
		${healthSurveyResultResponse.healthSurveyRegisterNormal}<br>
		${healthSurveyResultResponse.healthSurveyRegisterWarning}<br>
		${healthSurveyResultResponse.healthSurveyRegisterDanger}<br>
		${healthSurveyResultResponse.healthSurveyRegisterTotal}<br>
		${healthSurveyResultResponse.healthSurveyRegisterDate}<br>
		<input id="getDoctorFeedbackList" class="btn btn-default" type="button" value="의사에게 피드백 요청하기">
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>