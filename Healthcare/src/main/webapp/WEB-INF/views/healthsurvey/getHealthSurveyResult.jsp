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
				location.href="${pageContext.request.contextPath}/getHealthSurveyResultList";
			});
			
			$("#evaluationBtn").click(function(){
				var param = "";
				param = "healthSurveyResultNo="+$("#healthSurveyResultNo").val();
				param = param + "&healthSurveyEvaluationAverageGrade="+$("#evaluationValue").val();
				param = param + "&healthSurveyRegisterNo="+$("#healthSurveyRegisterNo").val();
				console.log(param);
				$.ajax({
			    	url : '${pageContext.request.contextPath}/addHealthSurveyEvaluation',
			        type : 'post',
			        data : param,
			        dataType : 'text',
			        success : function(data) {
			        	$("#evaluationContainer").html("");
			        },
			        error : function() { console.log('error');}
				});
				
			});
			
			
		});	
	</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div class="healthSurveyResultContainer" align="center">
		<h1>getHealthSurveyResult</h1>
		<input type="hidden" id="healthSurveyResultNo" value="${healthSurveyResultResponse.healthSurveyResultNo}">
		<input type="hidden" id="healthSurveyRegisterNo" value="${healthSurveyResultResponse.healthSurveyRegisterNo}">
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
		<div id="evaluationContainer">
			<c:if test="${healthSurveyResultResponse.healthSurveyEvaluationDo eq 0}">
				당신의 평가 점수는?<br>
				<input type="text" id="evaluationValue"><br>
				<input type="button" id="evaluationBtn" value="평가하기"><br>
			</c:if>
		</div>
		<input id="getDoctorFeedbackList" class="btn btn-default" type="button" value="의사에게 피드백 요청하기">
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="나의 설문 리스트">
	</div>
</body>
</html>