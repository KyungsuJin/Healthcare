<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		#addHealthSurveyResult{ float: right; }
		#removeHealthSurveyBtn{ float: right; }
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
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<input id="addHealthSurveyResult" class="btn btn-default" type="button" value="설문 시작하기">
							<input id="removeHealthSurveyBtn" class="btn btn-default" type="button" value="삭제">
							<br>
							<table border="1" class="table">
								<thead>
									<tr>
										<th>제목</th>
										<th>[${healthSurveyContent.diseaseName}] ${healthSurveyContent.healthSurveyRegisterTitle} </th>
									</tr>
								</thead>
								<tbody>
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
		</div>
	</div>
</body>
</html>