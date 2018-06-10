<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script>
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
		    $("#btn").click(function(){
		    	console.log($("#startTime").val());
		    	console.log($("#endTime").val());
		    	console.log($("#datepicker1").val());
		    });
		    $("#exercisePlace").click(function(){
		    	window.open("${pageContext.request.contextPath}/exercisePlace"
		    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
		    });
		    $("#addExerciseBtn").click(function(){
		    	if($("#exerciseScheduleDate").val().length==0){
		    		alert('운동예정날짜를 선택해주세요');
		    		$("#exerciseScheduleDate").focus();
		    		return false;
		    	/* }else if($("#startTime").val().length==0 || $("#endTime").val().length==0 ){
		    		alert('운동 시작시간 끝나는 시간을 모두 선택해주세요');
		    		return false;
		    	}else if($("#startTime").val() > $("#endTime").val()){
		    		alert('운동 시작시간이 끝나는시간보다  더 클수는 없습니다.');
		    		return false;
		    	}else if($("#exercisePlace").val().length==0){
		    		alert('운동 장소를 결정해 주세요.');
		    		$("#exercisePlace").click();
		    		return false; */
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
		    		
		    	}
		    });
		});
	</script>
</head>
<body>
	<h1> 운동 등록하기</h1>
	<form id="addExerciseForm" name="addExerciseForm" action="${pageContext.request.contextPath}/" method="post">
		<input type="hidden" name="" value="${sessionScope.memberSessionNo}">
		<div>
			예정날짜:<input id="exerciseScheduleDate" type="text" readonly>
			운동시간 :<input type="time" id="startTime">~<input type="time" id="endTime">
			운동장소 : <input type="text" id="exercisePlace" name="exercisePlace" placeholder="운동선택하기">
		</div>
		<div> 인원수 :<input type="number" id="exerciseCount" min="1" max="100"> 운동종류 : <input type="text" id="exerciseNo"></div>
		<div>제목 : <input type="text" id="exerciseMatchingTitle"></div>
		<div><textarea class="form-control" rows="20"></textarea></div>
		<button type="button" id="addExerciseBtn">등록</button>
	</form>
</body>
</html>