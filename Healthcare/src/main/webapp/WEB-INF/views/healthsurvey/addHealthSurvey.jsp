<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#healthSurveyBtn").click(function(){
				var questionList = $('[name=healthSurveyQuestionList]');
				var selectionList = $('[name=healthSurveySelectionList]');
				var scoreList = $('[name=healthSurveySelectionScoreList]');
				var questionCheck = 0;
				var selectionCheck = 0;
				var scoreCheck = 0;
				console.log("test 시작");
				for(var i = 0 ; i < questionList.length ; i++){
					console.log(questionList[i].val().length);
					if(questionList[i].length < 1){
						questionCheck = i;
						break;
					}
				}
				for(var i = 0 ; i < selectionList.length ; i++){
					if(selectionList[i].length < 1){
						selectionCheck = i;
						break;
					}
				}
				for(var i = 0 ; i < scoreList.length ; i++){
					if(scoreList[i].length < 1){
						scoreCheck = i;
						break;
					}
				}
				
				/* $("#healthSurveyForm").submit(); */
			});
			$("#getHealthSurveyListBtn").click(function(){
				location.href="${pageContext.request.contextPath}/getHealthSurveyList";
			});
			$("#addQuestion").click(function(){
				var clone = $('[id=questionClone]:last');
				var questionNo = Number($(clone).children('#questionNoList').val())+1;
				$('[id=questionClone]:last').after("<div id='questionClone'><br> 질문 번호 : <input type='text' id='questionNoList' name='questionNoList' value='" + questionNo + "' readonly><br> 질문 내용 : <input type='text' name='healthSurveyQuestionList'><br> <input type='button' id='addSelection' value='선택지 추가'><br> <div id='selectionClone'>	선택지 번호 : <input type='text' id='selectionNoList' name='selectionNoList' value='1' readonly><br>	선택지 내용 : <input type='text' name='healthSurveySelectionList'><br> 선택지 점수 : <input type='text' name='healthSurveySelectionScoreList'><br></div></div>");
			});
			$(document).on("click","#addSelection",function(){
				var cloneList = $(this).siblings("div");
				var selectionNo = cloneList.length+1;
				var lastClone = $(cloneList)[selectionNo-2];
				$(lastClone).after("<div id='selectionClone'> 선택지 번호 : <input type='text' id='selectionNoList' name='selectionNoList' value='" + selectionNo + "' readonly><br>	선택지 내용 : <input type='text' name='healthSurveySelectionList'><br> 선택지 점수 : <input type='text' name='healthSurveySelectionScoreList'><br></div>");
			});
			
			
			
			
		});
		
	
	</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="healthSurveyContainer" align="center">
		<form id="healthSurveyForm" method="POST" action="${pageContext.request.contextPath}/addHealthSurvey">
			<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
			<div>
				질병선택
				<select name="diseaseNo" class="selectBoxDisease">
					<c:forEach var="disease" items="${list}">
						 <option value="${disease.diseaseNo}">${disease.diseaseName}</option>
					</c:forEach>
				</select>
			</div>
			<input type="text" name="healthSurveyRegisterTitle"><br>
			<input type="text" name="healthSurveyRegisterContent"><br>
			<input type="text" name="healthSurveyPoint"><br>
			<input type="button" id="addQuestion" value="질문 추가"><br>
			<div id="questionClone">
				//질문
				질문 번호 : <input type="text" id="questionNoList" name="questionNoList" value="1" readonly><br>
				질문 내용 : <input type="text" name="healthSurveyQuestionList"><br>
				//선택지
				<input type="button" id="addSelection" value="선택지 추가"><br>
				<div id="selectionClone">
					선택지 번호 : <input type="text" id="selectionNoList" name="selectionNoList" value="1" readonly><br>
					선택지 내용 : <input type="text" name="healthSurveySelectionList"><br>
					선택지 점수 : <input type="text" name="healthSurveySelectionScoreList"><br>
				</div>
			</div>
			
			
			정상 : <input type="text" name="healthSurveyRegisterNormal"><br>
			경고 : <input type="text" name="healthSurveyRegisterWarning"><br>
			위험 : <input type="text" name="healthSurveyRegisterDanger"><br>
			총점 : <input type="text" name="healthSurveyRegisterTotal"><br>
			
			<input type="button" id="healthSurveyBtn" value="요청">
		</form>
		<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
	</div>
</body>
</html>