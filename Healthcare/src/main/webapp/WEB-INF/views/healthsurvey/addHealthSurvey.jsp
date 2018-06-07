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
		<form id="healthSurveyForm" method="POST" action="${pageContext.request.contextPath}/addHealthSurvey">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			<input type="text" name="diseaseNo"><br>
			<input type="text" name="healthSurveyRegisterTitle"><br>
			<input type="text" name="healthSurveyRegisterContent"><br>
			<input type="text" name="healthSurveyPoint"><br>
			<input type="text" name="healthSurveyRegisterNormal"><br>
			<input type="text" name="healthSurveyRegisterWarning"><br>
			<input type="text" name="healthSurveyRegisterDanger"><br>
			<input type="text" name="healthSurveyRegisterTotal"><br>
			
			
			//질문하나
			질문 번호 : <input type="text" name="questionNoList"><br>
			질문 내용 : <input type="text" name="healthSurveyQuestionList"><br>
			//선택지1
			선택지 번호 : <input type="text" name="selectionNoList"><br>
			선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
			선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
			//선택지2
			선택지 번호 : <input type="text" name="selectionNoList"><br>
			선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
			선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
			//선택지3
			선택지 번호 : <input type="text" name="selectionNoList"><br>
			선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
			선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
			
			
			
			
			//질문 둘
			질문 번호 : <input type="text" name="questionNoList"><br>
			질문 내용 : <input type="text" name="healthSurveyQuestionList"><br>
			//선택지1
			선택지 번호 : <input type="text" name="selectionNoList"><br>
			선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
			선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
			//선택지2
			선택지 번호 : <input type="text" name="selectionNoList"><br>
			선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
			선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
			
			
			
			<input type="button" id="healthSurveyBtn" value="요청">
		</form>
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>