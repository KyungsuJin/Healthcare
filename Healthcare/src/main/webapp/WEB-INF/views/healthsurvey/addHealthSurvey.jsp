<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		#healthSurveyRegisterContent{ width:100%; height:300px;}
		#healthSurveyQuestionList{ width:100%; }
		div{ padding-left: 0px !important; padding-right: 0px !important;}  
		#healthSurveySelectionList{ width:100%; }
		#healthSurveySelectionScoreList{ width:100%; }
		.selectBoxDisease{ width:100px; }
		#healthSurveyRegisterTitle{ width:100%; }
		#sidebox { background-color:#F0F0F0; position:absolute; float:right; width:120px; top:433px; left:90%; padding: 3px 10px }
		#addSelection{ float:right; width:80px; height:30px; padding-left: 0px !important; padding-right: 0px !important; padding-top: 0px !important; padding-bottom: 0px !important;}
		#removeQuestion{ float:right; width:80px; height:30px; padding-left: 0px !important; padding-right: 0px !important; padding-top: 0px !important; padding-bottom: 0px !important;}
		.form-group { padding-bottom: 10px; margin: 0px 0 0 0 !important; }
		#questionClone{ height: auto; margin-top:30px;}
		input[type=number]{ text-align: center; }
		#healthSurveyPoint{ width:100px; }
	</style>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			healthSurveySelectionScoreCheck();
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$("#sidebox").stop().animate({
					"top":position+currentPosition+"px"
				},1000);
			});

			$("#healthSurveyBtn").click(function(){
				var questionList = $('[name=healthSurveyQuestionList]');
				var selectionList = $('[name=healthSurveySelectionList]');
				var scoreList = $('[name=healthSurveySelectionScoreList]');
				var questionCheck = -1;
				var selectionCheck = -1;
				var scoreCheck = -1;
				for(var i = 0 ; i < questionList.length ; i++){
					if(questionList[i].value.length < 1){
						questionCheck = i;
						break;
					}
				}
				for(var i = 0 ; i < selectionList.length ; i++){
					if(selectionList[i].value.length < 1){
						selectionCheck = i;
						break;
					}
				}
				for(var i = 0 ; i < scoreList.length ; i++){
					if(scoreList[i].value.length < 1){
						scoreCheck = i;
						break;
					}
				}
				if(0 == $('#healthSurveyRegisterTitle').val().length){
					$('#healthSurveyRegisterTitle').focus();
				} else if(0 == $('#healthSurveyRegisterContent').val().length){
					$('#healthSurveyRegisterContent').focus();
				} else if(0 == $('#healthSurveyPoint').val().length){
					$('#healthSurveyPoint').focus();
				} else if(-1 < questionCheck){
					questionList[questionCheck].focus();
				} else if(-1 < selectionCheck){
					selectionList[selectionCheck].focus();
				} else if(-1 <  scoreCheck){
					scoreList[scoreCheck].focus();
				} else if(0 == $('#healthSurveyRegisterNormal').val().length){
					$('#healthSurveyRegisterNormal').focus();
				} else if(0 == $('#healthSurveyRegisterWarning').val().length){
					$('#healthSurveyRegisterWarning').focus();
				} else if(0 == $('#healthSurveyRegisterDanger').val().length){
					$('#healthSurveyRegisterDanger').focus();
				} else{
					$("#healthSurveyForm").submit();
				}
				
				
			});
			$("#getHealthSurveyListBtn").click(function(){
				location.href="${pageContext.request.contextPath}/getHealthSurveyList";
			});
			$(document).on("click","#addQuestion",function(){
				var clone = $('[id=questionClone]:last');
				var questionNo = Number($(clone).find('#questionNoList').val())+1;
				$('[id=questionClone]:last').after("<div id='questionClone' class='col-md-8 col-md-offset-2'><div><input class='col-md-12 btn btn-default' type='button' id='removeQuestion' value='질문 삭제'></div><div class='form-group col-md-12'><div class='col-md-1'><input type='hidden'  id='questionNoList' name='questionNoList' value='" + questionNo + "'>" + questionNo + "</div><div class='col-md-11'><input type='text' class='form-control' id='healthSurveyQuestionList' name='healthSurveyQuestionList'><br></div></div><input type='button' class='btn btn-default' id='addSelection' value='선택지 추가'><br><div class='col-md-12' id='selectionClone'><div id='selectionNoDiv' class='col-md-1 col-md-offset-1'><input type='hidden' id='selectionNoList' name='selectionNoList' value='1'>1.</div><div class='col-md-8'><input type='text' class='form-control' id='healthSurveySelectionList' name='healthSurveySelectionList'></div><div class='col-md-1'><input type='number' class='form-control' id='healthSurveySelectionScoreList' name='healthSurveySelectionScoreList' value='1'></div></div></div>");
				healthSurveySelectionScoreCheck();
			});
			$(document).on("click","#addSelection",function(){
				var cloneList = $(this).siblings("div");
				if($(this).siblings("div").find("#removeQuestion").val()){
					var selectionNo = cloneList.length;
					var lastClone = $(cloneList)[selectionNo-1];
					selectionNo = selectionNo -1;
				} else{
					var selectionNo = cloneList.length;
					var lastClone = $(cloneList)[selectionNo-1];
				}
				$(lastClone).after("<div class='col-md-12' id='selectionClone'><div class='col-md-1 col-md-offset-1'><input type='hidden' id='selectionNoList' name='selectionNoList' value='" + selectionNo + "'>" + selectionNo + "</div><div class='col-md-8'><input type='text' class='form-control' id='healthSurveySelectionList' name='healthSurveySelectionList'></div><div class='col-md-1'><input type='number' class='form-control' id='healthSurveySelectionScoreList' name='healthSurveySelectionScoreList' value='1'></div><div class='col-md-1'><span id='removeBtn' class='glyphicon glyphicon-remove' aria-hidden='true'></span></div></div>");
				healthSurveySelectionScoreCheck();
			});
			$(document).on("keyup","#healthSurveySelectionScoreList", function(){
				healthSurveySelectionScoreCheck();
			});
			
			function healthSurveySelectionScoreCheck(){
				var totalScore = 0;
				$("[id=questionClone]").each(function(){
					var questionScore = 0;
					$(this).children("#selectionClone").each(function(){
						$(this).find("#healthSurveySelectionScoreList").each(function(){
							if($(this).val() && questionScore < $(this).val()){
								questionScore = Number($(this).val());
							}
						});
					});
					totalScore = totalScore + questionScore;
				});
				$("#healthSurveyRegisterTotal").val(totalScore);
			}
			$(document).on("click","#removeQuestion",function(){
				$(this).parent("div").closest("#questionClone").remove();
				healthSurveySelectionScoreCheck();
			});
			$(document).on("click","#removeBtn",function(){
				if($(this).closest("div").siblings("div").find("#selectionNoList").val() == ($(this).closest("div").closest("#selectionClone").siblings("#selectionClone").length+1)){
					$(this).parent("div").closest("#selectionClone").remove();
					healthSurveySelectionScoreCheck();
				}
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
				<div id="sidebox">
					<input type="button" class="btn btn-default" id="addQuestion" value="질문 추가"><br>
				</div>
				<div id="healthSurveyContainer" align="center">
					<form id="healthSurveyForm" method="POST" action="${pageContext.request.contextPath}/addHealthSurvey">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<div class="card">
	                            	<div class="card-header" data-background-color="purple"><h4 class="title">건강설문 작성</h4></div>
				                    <div class="card-content">
										<div class="col-md-8 col-md-offset-2">
											<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"><br>
											<div class="col-md-2">
												<select class='form-control' name="diseaseNo" class="selectBoxDisease">
													<c:forEach var="disease" items="${list}">
														 <option value="${disease.diseaseNo}">${disease.diseaseName}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-2 col-md-offset-1" style="padding-top: 10px;">
												설문 포인트 : 
											</div>
											<div class="col-md-2">
												<input type="number" class='form-control' id="healthSurveyPoint" name="healthSurveyPoint" value="1000">
											</div>
										</div>
										<div class="col-md-8 col-md-offset-2">
											설문 명 : <input type="text" class='form-control' id="healthSurveyRegisterTitle" name="healthSurveyRegisterTitle"><br>
										</div>
										<div class="col-md-8 col-md-offset-2">
											설문 내용 : <textarea class='form-control' id="healthSurveyRegisterContent" name="healthSurveyRegisterContent"></textarea><br>
										</div>
										<div id="questionClone" class="col-md-8 col-md-offset-2">
											<div class="col-md-12">
												<div class="col-md-1">
													<input type="hidden"  id="questionNoList" name="questionNoList" value="1">
													1.
												</div>
												<div class="col-md-11">
													<input type="text" class='form-control' id="healthSurveyQuestionList" name="healthSurveyQuestionList"><br>
												</div>
											</div>
											<input type="button" class="btn btn-default" id="addSelection" value="선택지 추가"><br>
											<div class="col-md-12" id="selectionClone">
												<div id="selectionNoDiv" class="col-md-1 col-md-offset-1">
													<input type="hidden" id="selectionNoList" name="selectionNoList" value="1">
													1.
												</div>
												<div class="col-md-8">
													<input type="text" class='form-control' id="healthSurveySelectionList" name="healthSurveySelectionList">
												</div>
												<div class="col-md-1">
													<input type="number" class='form-control' id="healthSurveySelectionScoreList" name="healthSurveySelectionScoreList" value='1'>
												</div>
											</div>
										</div>
										<div class="col-md-8 col-md-offset-2">
											<div class="col-md-3">정상 : <input type="number" class='form-control' id="healthSurveyRegisterNormal" name="healthSurveyRegisterNormal"><br></div>
											<div class="col-md-3">경고 : <input type="number" class='form-control' id="healthSurveyRegisterWarning" name="healthSurveyRegisterWarning"><br></div>
											<div class="col-md-3">위험 : <input type="number" class='form-control' id="healthSurveyRegisterDanger" name="healthSurveyRegisterDanger"><br></div>
											<div class="col-md-3">총점 : <input type="text" class='form-control' id="healthSurveyRegisterTotal" name="healthSurveyRegisterTotal" readonly><br></div>
											<input type="button" class="btn btn-default" id="healthSurveyBtn" value="설문 등록">
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="목록">
				</div>
			</div>
		</div>
	</div>
</body>
</html>