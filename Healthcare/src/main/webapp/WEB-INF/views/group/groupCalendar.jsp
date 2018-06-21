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
var groupName = "groupName7";
$(document).ready(function(){
	  ajaxData(); 
});

function ajaxData() {
	var request = $.ajax({
	type : "POST",
	url : "${pageContext.request.contextPath}/groupCalendarList?groupName="+groupName
	});   
	//ajax 실행 값 확인
	request.done(function(msg) {
		console.log(msg);
		var medication = msg.groupCalendarMedication;
		var treatment = msg.groupCalendarTreatment;
		var memberlist = msg.groupRelationMember;
		var creationMember = msg.creationMember;
		if(treatment!=undefined && Array.isArray(treatment)){
			console.log('array 확인');
			console.log("진료리스트:"+treatment+treatment.length);
			console.log("복약스트:"+medication+medication.length);
			console.log("회원리스트:"+memberlist+memberlist.length);
			console.log('memberlist[1].memberId:'+memberlist[1].memberId);
			console.log("그룹장:"+creationMember);
			//회원리스트
			var resource = [{ id: creationMember.memberNo, title: creationMember.memberName }];
	 		for(var i = 0; i<memberlist.length; i++){
				resource[i+1] = { id: memberlist[i].memberId, title: memberlist[i].memberName}
			} 
	 		//복약일정
	 		var test = [];
	 		if(medication.length>0){
	 	 		for(var i = 0; i<medication.length; i++){
	 	 			test[i] = {
	 	 					id : medication[i].memberId
	 						,title: '[복약]'+medication[i].medicationTitle+' [하루'+medication[i].dosage+'번]'
	 						,resourceIds: medication[i].memberId
	 						,start: medication[i].medicationStartDate
	 						,end: medication[i].medicationEndDate
	 						,color: '#8041D9'
	 	 			}
	 	 		}
	 		}
	 		console.log('test:'+test);
			//진료일정
	 		if(treatment.length>0){
	 	 		for(var i = 0; i<treatment.length; i++){
	 	 			test[i+medication.length] = {
	 	 					id:treatment[i].memberId
	 						,title: '[진료]'+treatment[i].treatmentTitle
	 						,resourceIds: treatment[i].memberId
	 						,start: treatment[i].tratmentDate
	 						,color: '#F361A6'
	 	 			}
	 			}
	 		}
	 		console.log('test:'+test);
	 		console.log('test:'+test.length);
	 		console.log('resource:'+resource.length);
	 		
		}else{
			console.log('데이터 없음');
		}
		//캘린더
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
			    
			    dayClick: function(date) {//날짜 클릭했을 때
			        alert('clicked ' + date.format());
			      },
			      
			      select: function(startDate, endDate) {//날짜 드래그했을 때
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
				resourceLabelText: '그룹회원명', 
				resources: resource
			});
	});

	request.fail(function( jqXHR, textStatus ) {
		alert( "Request failed: " + textStatus );
	});
} 


</script>

<style> 

body {
margin: 40px 10px; 
padding: 0; 
font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; 
font-size: 14px; 
} 
#calendar {
 max-width: 500px; margin: 0 auto; 
 } 
</style>
</head>
<body>
	<h1>그룹 캘린더</h1>
	<div id="calendardaily"></div>
</body>
</html>