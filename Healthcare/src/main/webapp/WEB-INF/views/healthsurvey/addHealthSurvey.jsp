<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#healthSurveyBtn").click(function(){
				$("#healthSurveyForm").submit();
			});
			$("#getHealthSurveyListBtn").click(function(){
				location.href="${pageContext.request.contextPath}/getHealthSurveyList";
			});
		});
		
	
	</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthSurveyContainer" align="center">
		<form id="healthSurveyForm" method="POST" action="${pageContext.servletContext.contextPath}/addHealthSurvey">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			<input type="text" name="questionNo">
			<input type="text" name="questionNo">
			<input type="text" name="questionNo">
			<input type="button" id="healthSurveyBtn" value="요청">
		</form>
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>