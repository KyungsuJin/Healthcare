<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

	<script>
		jQuery.browser = {};
		(function () {
		    jQuery.browser.msie = false;
		    jQuery.browser.version = 0;
		    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
		        jQuery.browser.msie = true;
		        jQuery.browser.version = RegExp.$1;
		    }
		})();
		$(document).ready(function(){
		    $.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
		    $(function() {
		        $("#exerciseScheduleDate").datepicker();
		    });
		    $("#exercisePlace").click(function(){
		    	window.open("${pageContext.request.contextPath}/exercisePlace"
		    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
		    });
		    $("#addExerciseBtn").click(function(){
		    	var i =$("#startTime").val()+"~"+$("#endTime").val();

		    	console.log($("#startTime").val()+"~"+$("#endTime").val());
		    	
		    	if($("#exerciseScheduleDate").val().length==0){
		    		alert('운동예정날짜를 선택해주세요');
		    		$("#exerciseScheduleDate").focus();
		    		return false;
		    	}else if($("#exerciseScheduleDate").val()<=$("#currentDate").val()){
		    		alert('운동 계획 날짜는 오늘날짜와 같거나  작을수없습니다.');
		    		$("#exerciseScheduleDate").focus();
		    		return false;
		    	}else if(($("#exerciseScheduleDate").val() <= $("#currentDate").val())
		    			&& ($("#startTime").val() < $("#currentTime").val())){
		    		alert('운동 시작은 현재시간보다 작을수 없습니다.');
		    		return false;
		    	}else if($("#startTime").val().length==0 || $("#endTime").val().length==0 ){
		    		alert('운동 시작시간 끝나는 시간을 모두 선택해주세요');
		    		return false;
		    	}else if($("#startTime").val() > $("#endTime").val()){
		    		alert('운동 시작시간이 끝나는시간보다  더 클수는 없습니다.');
		    		return false;
		    	}else if($("#exercisePlace").val().length==0){
		    		alert('운동 장소를 결정해 주세요.');
		    		$("#exercisePlace").click();
		    		return false;
		    	}else if($("#exerciseCount").val().length==0){
		    		alert('운동할 인원수를 정해주세요');
		    		$("#exerciseCount").focus();
		    		return false;
		    	}else if($("#exerciseCount").val()>99){
		    		alert('인원수가 너무많습니다 100명을 넘을수 없습니다.');
		    		$("#exerciseCount").focus();
		    		return false;
		    	}else if($("#exerciseNo").val().length==0){
		    		alert('운동종류를 결정해주세요');
		    		$("#exerciseNo").focus();
		    		return false;
		    	}else if($("#exerciseMatchingTitle").val().length==0){
		    		alert('제목을 입력해주세요');
		    		$("#exerciseMatchingTitle").focus();
		    		return false;
		    	}else{
		    		console.log($("#exerciseMatchingTime").val);
		    		$("#addExerciseForm").submit();
		    		alert('운동매칭 등록완료');
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
				<div class="row">
					<div class="col-md-2">
					</div>
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">운동 등록</h4>
                                </div>
                                <div class="card-content">
									<form id="addExerciseForm" name="addExerciseForm" action="${pageContext.request.contextPath}/addExerciseMatching" method="post">
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
										<input type="hidden" id="currentDate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />">
										<input type="hidden" id="currentTime" value="<fmt:formatDate value="${now}" pattern="k:mm" />">
										<div class="row">
											<div class="col-md-2"></div>
											<div class="col-md-8">
													<div class="form-group">
														 <label class="control-label">예정날짜</label>
														 <input class="form-control" id="exerciseScheduleDate" name="exerciseMatchingScheduleDate" type="text" readonly>
													</div>
													<div class="form-group">
														 <label class="control-label">운동장소</label>
														 <input class="form-control"type="text" id="exercisePlace" name="exerciseMatchingPlace">
													</div>
													<div class="form-group">
														<label class="control-label">운동 시작 시간</label>
														<input class="form-control" type="time" id="startTime" name="exerciseMatchingTime">
													</div>
													<div class="form-group">
														<label class="control-label">운동 끝나는 시간</label>
														<input class="form-control" type="time" name="exerciseMatchingTime" id="endTime">
													</div>
													<div class="form-group">
														<label class="control-label">인원수</label>
														<input class="form-control" type="number" name="exerciseMatchingCount" id="exerciseCount" min="1" max="100">
													</div>
													<div class="form-group">
														<label class="control-label">운동종류</label>
														<input class="form-control" type="text" name="exerciseNo" id="exerciseNo">
													</div>
													<div class="form-group">
														<label class="control-label" style="text-align:center;">제목</label>
														<input class="form-control" type="text" id="exerciseMatchingTitle" name="exerciseMatchingTitle">
													</div>
													<div class="form-group">
														<label class="control-label">내용</label>
														<textarea class="form-control" rows="20" name="exerciseMatchingContent"></textarea>
													</div>
												</div>
											</div>
										<button type="button" id="addExerciseBtn" class="btn btn-primary pull-right">등록</button>
									</form>
								</div>
							</div>
						</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>