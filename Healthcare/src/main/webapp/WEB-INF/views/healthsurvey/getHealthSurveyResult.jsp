<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		addHealthSurveyBtn{ float: right; }
		#healthSurveyContent { height: 300px; }
		.starR{
			background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
			background-size: auto 100%;
			width: 30px;
			height: 30px;
			display: inline-block;
			text-indent: -9999px;
			cursor: pointer;
		}
		.starR.on{background-position:0 0;}
	</style>
	<script>
		$(document).ready(function(){
			var resultNo = $('#healthSurveyResultNo').val();
			$.ajax({
		    	url : '${pageContext.request.contextPath}/getHealthSurveyResultSelectionList',
		        type : 'post',
		        data : { healthSurveyResultNo : resultNo },
		        dataType : 'json',
		        success : function(data) {
		        	$.each(data.list, function(idx,val){
		        		$('.healthSurveyRecordNo').each(function(){
		        			console.log($(this).val());
		        			if($(this).val() == val.healthSurveySelectionNo){
		        				$(this).attr("checked", "checked");
		        			}
		        		});
		        		$("[type=radio]").attr('disabled','disabled');
		        	});
		        },
		        error : function() { console.log('error');}
			});
			$("#getDoctorFeedbackList").click(function(){
				location.href="${pageContext.request.contextPath}/";
			});
			$("#getHealthSurveyListBtn").click(function(){
				location.href="${pageContext.request.contextPath}/getHealthSurveyResultList";
			});
			$("#evaluationBtn").click(function(){
				var evaluationValue = $(".starRev").find(".on").length;
				var param = "";
				param = "healthSurveyResultNo="+$("#healthSurveyResultNo").val();
				param = param + "&healthSurveyEvaluationAverageGrade="+evaluationValue;
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
			var healthSurveyRegisterNormal = $("#healthSurveyRegisterNormal").val();
			var healthSurveyRegisterWarning = $("#healthSurveyRegisterWarning").val();
			var healthSurveyRegisterDanger = $("#healthSurveyRegisterDanger").val();
			var healthSurveyRegisterTotal = $("#healthSurveyRegisterTotal").val();
			var healthSurveyTotalGrade = $("#healthSurveyTotalGrade").val();
			var percentage = (healthSurveyTotalGrade/healthSurveyRegisterTotal)*100;
			if(healthSurveyTotalGrade >= healthSurveyRegisterDanger){
				$(".progress div").width(percentage+"%");
				$(".progress div").addClass("progress-bar-danger");
				$("#healthSurveyResultScore").val("[${sessionScope.memberSessionName}]님의 설문 결과 ${healthSurveyResultResponse.healthSurveyTotalGrade}으로 위험단계 입니다.");
			} else if(healthSurveyTotalGrade >= healthSurveyRegisterWarning){
				$(".progress div").width(percentage+"%");
				$(".progress div").addClass("progress-bar-warning");
				$("#healthSurveyResultScore").val("[${sessionScope.memberSessionName}]님의 설문 결과 ${healthSurveyResultResponse.healthSurveyTotalGrade}으로 경고단계 입니다.");
			} else if(healthSurveyTotalGrade >= healthSurveyRegisterNormal){
				$(".progress div").width(percentage+"%");
				$(".progress div").addClass("progress-bar-success");
				$("#healthSurveyResultScore").val("[${sessionScope.memberSessionName}]님의 설문 결과 ${healthSurveyResultResponse.healthSurveyTotalGrade}으로 주의단계 입니다.");
			} else{
				$(".progress div").width(percentage+"%");
				$(".progress div").addClass("progress-bar-success");
				$("#healthSurveyResultScore").val("[${sessionScope.memberSessionName}]님의 설문 결과 ${healthSurveyResultResponse.healthSurveyTotalGrade}으로 정상단계 입니다.");
			}
			$('.starRev span').click(function(){
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				return false;
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
				<div class="healthSurveyResultContainer" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
								<div class="card-header" data-background-color="purple"><h4 class="title">설문 결과</h4></div>
								<div class="col-md-12">
									<input type="hidden" id="healthSurveyRegisterNo" value="${question[0].healthSurveyRegisterNo}">
									<input type="hidden" id="questionSize" value="${questionSize}">
									<input type="hidden" id="healthSurveyResultNo" value="${healthSurveyResultResponse.healthSurveyResultNo}">
									<input type="hidden" id="healthSurveyRegisterNo" value="${healthSurveyResultResponse.healthSurveyRegisterNo}">
									<input type="hidden" id="healthSurveyRegisterNormal" value="${healthSurveyResultResponse.healthSurveyRegisterNormal}">
									<input type="hidden" id="healthSurveyRegisterWarning" value="${healthSurveyResultResponse.healthSurveyRegisterWarning}">
									<input type="hidden" id="healthSurveyRegisterDanger" value="${healthSurveyResultResponse.healthSurveyRegisterDanger}">
									<input type="hidden" id="healthSurveyRegisterTotal" value="${healthSurveyResultResponse.healthSurveyRegisterTotal}">
									<input type="hidden" id="healthSurveyTotalGrade" value="${healthSurveyResultResponse.healthSurveyTotalGrade}">
									설문 명
									<input class="form-control" type="text" value="[${healthSurveyResultResponse.diseaseName}] ${healthSurveyResultResponse.healthSurveyRegisterTitle}" readonly>
								</div>
								<div class="col-md-12">
									<textarea id="healthSurveyContent" class="form-control" readonly>${healthSurveyResultResponse.healthSurveyRegisterContent}</textarea>
								</div>
								<div class="col-md-12">
									<c:forEach var="i" begin="0" end="${questionSize}" step="1">
										${question[i].questionNo}
										${question[i].healthSurveyQuestion}<br>
										<c:set var="tempName">selection${i}</c:set>
										<c:forEach var = "healthSelection" items = "${question[i].healthSurveySelection}">
											<div>
												<input type="radio" class="healthSurveyRecordNo" name="${tempName}" value="${healthSelection.healthSurveySelectionNo}" readonly>
												<input type="hidden" value="${healthSelection.healthSurveySelectionScore}">
												${healthSelection.selectionNo}.
												${healthSelection.healthSurveySelection}<br>
											</div>
										</c:forEach>
										<br>
									</c:forEach>
								</div>
								<div class="col-md-12">
									<input id="healthSurveyResultScore" class="form-control" type="text" readonly>
								</div>
								
								<div class="col-md-12">
									<div class="progress">
										<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div id="evaluationContainer">
										<c:if test="${healthSurveyResultResponse.healthSurveyEvaluationDo eq 0}">
											당신의 평가 점수는?
											<div class="starRev">
												<span class="starR on">별1</span>
												<span class="starR">별2</span>
												<span class="starR">별3</span>
												<span class="starR">별4</span>
												<span class="starR">별5</span>
											</div>
											
											
											<input type="button" id="evaluationBtn" class="btn btn-primary" value="평가하기">
										</c:if>
									</div>
									<input id="getDoctorFeedbackList" class="btn btn-default" type="button" value="의사에게 피드백 요청하기">
									<input id="getHealthSurveyListBtn" class="btn btn-default" type="button" value="나의 설문 리스트">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>