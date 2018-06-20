<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더</title>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar-scheduler/1.9.4/scheduler.css">
<script type="text/javascript" src="https://fullcalendar.io/releases/fullcalendar-scheduler/1.9.4/scheduler.min.js"></script>

<script type="text/javascript">
var memberNo = "member_1";
$(document).ready(function(){
	 /* ajaxData(); */
	var test = [
		{id:'1',
		title: 'My Event',
		resourceIds: '1',
		start: '2018-06-19'}
	];
	var resourcedata = [
		{ id: '1', title: '홍길동' }
	];
   
	$('#calendardaily').fullCalendar({
		header: {
	    	left: 'today prev,next',
	        center: 'title', 
	        right: 'month,timelineDay,listWeek'
	    },
	    defaultView: 'month',
	    defaultDate : new Date(),
	    navLinks: true,
	    eventLimit: true,
	    
	    dayClick: function(date) {//날짜 클릭했을 때 일정 추가
	        alert('clicked ' + date.format());
	    
	        var date = moment(date.format());
	        console.log("date:"+date);
	          if (date.isValid()) {
	            
	            alert('일정 등록이 완료되었습니다.');
	          } else {
	            alert('일정 등록이 실패하였습니다.');
	          }
	      },
	      
	      select: function(startDate, endDate) {//날짜 드래그했을 때 일정 추가
	        alert('selected ' + startDate.format() + ' to ' + endDate.format());
	      },
	      
 	      eventClick: function(event) { //이벤트 클릭시 해당글의 상세보기
	          // opens events in a popup window
	          window.open('', 'calendarDetail', 'width=700,height=600');
	          myWindow.document.write(calendarDetail);
	          return false;
	        }, 
	    views: { 
	    	month:{
	    		buttonText: 'month',
	    		eventLimit : 3
	    	},
	    	timelineDay:{ 
	    		buttonText: '오늘 일정 보기',
	    		slotLabelFormat : ['H:mm'],
				slotDuration: '00:15'
			},
			listWeek: {
				buttonText: '일주일 일정 보기',
				type: 'timeline',
				duration: { days: 7 },
				slotLabelFormat : ['ddd D/M']
			}
		},	
		events :  test,
		resourceLabelText: '회원명', 
		resources: resourcedata
	});
});
/* function ajaxData() {

var request = $.ajax({
type : "POST",
url : "${pageContext.request.contextPath}/#?memberNo="+memberNo
});   
//ajax 실행 값 확인
request.done(function( msg ) {
	if(msg!=undefined && Array.isArray(msg)){
		console.log('array 확인');
		console.log(msg);
		console.log(msg.length);
		//복약일정. 및 
		var test = [
		for(var i=0; i < msg.length; i++){
			{
			id:'i',
			title: 'msg[i].medicationTitle',
			resourceIds: 'msg[i].memberId',
			start: 'msg[i].startdate',end:'msg[i].enddate'
			}
		}
		];
		
		var resourcedata = [
		for(var i=0; i < msg.length; i++){
			{ 
			id: 'msg[i].memberId', 
			title: 'msg[i].memberName' 
			}
		}
		];
		
	}else{
		console.log('데이터 없음');
	}
});
request.fail(function( jqXHR, textStatus ) {
	alert( "Request failed: " + textStatus );
});
} */
</script>
<style> 

body {
margin: 40px 10px; 
padding: 0; 
font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; 
font-size: 14px; 
} 
#calendar {
 max-width: 900px; margin: 0 auto; 
 } 
</style>
</head>
<body>
	<h1>그룹 캘린더</h1>
	<div id="calendardaily"></div>
</body>
</html>