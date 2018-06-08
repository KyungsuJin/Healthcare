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
		$("#addHealthSurveyResultBtn").click(function(){
			if($("input[id=healthSurveyRecordNo]:checked").length == $("#questionSize").val()){
				var param = "";
				var totalScore = 0;
				$(".healthSurveyResultContainer :checked").each(function() {
		        	if( param=="" ) param = "healthSurveyRegisterNo="+$("#healthSurveyRegisterNo").val();
					param = param + "&healthSurveySelectionNo="+$(this).val();
					totalScore = totalScore + Number($(this).closest("div").children("input[id=selectionScore]").val());
		     	});
				param = param + "&healthSurveyTotalGrade="+totalScore;
				console.log(param);
				console.log(totalScore);
 				$.ajax({
			    	url : '${pageContext.request.contextPath}/addHealthSurveyResult',
			        type : 'post',
			        data : param,
			        dataType : 'text',
			        success : function(data) {
			        	location.href="${pageContext.request.contextPath}/getHealthSurveyResult?healthSurveyResultNo="+data;
			        },
			        error : function() { console.log('error');}
				});
			      
			} else{
				
			}
		});
		
		$("#cancelBtn").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthSurveyContent?healthSurveyNo=${healthSurvey.healthSurveyNo}";
		});
	});	
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div class="healthSurveyResultContainer" align="center">
		<h1>addHealthSurveyResult</h1>
		<input type="hidden" id="healthSurveyRegisterNo" value="${question[0].healthSurveyRegisterNo}">
		<input type="hidden" id="questionSize" value="${questionSize}">
		<c:forEach var="i" begin="0" end="${questionSize}" step="1">
			${question[i].questionNo}
			${question[i].healthSurveyQuestion}<br>
			<c:set var="tempName">selection${i}</c:set>
			<c:forEach var = "healthSelection" items = "${question[i].healthSurveySelection}">
			<div>
				<input type="radio" id="healthSurveyRecordNo" name="${tempName}" value="${healthSelection.healthSurveySelectionNo}">
				<input type="hidden" id="selectionScore" value="${healthSelection.healthSurveySelectionScore}">
				${healthSelection.selectionNo}.
				${healthSelection.healthSurveySelection}<br>
			</div>
			</c:forEach>
			<br>
		</c:forEach>
		<input id="addHealthSurveyResultBtn" class="btn btn-default" type="button" value="제출">
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>