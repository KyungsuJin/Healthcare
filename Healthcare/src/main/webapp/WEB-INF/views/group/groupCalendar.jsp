<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더</title>

<link href='fullcalendar-3.9.0/fullcalendar.min.css' rel='stylesheet' /> 
<link href='fullcalendar-3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' /> 
<script src='fullcalendar-3.9.0/lib/moment.min.js'></script> <script src='fullcalendar-3.9.0/lib/jquery.min.js'></script> 
<script src='fullcalendar-3.9.0/fullcalendar.min.js'></script>
<script src='https://fullcalendar.io/releases/fullcalendar-scheduler/1.9.4/scheduler.min.js'></script> 
<script src='https://fullcalendar.io/releases/fullcalendar-scheduler/1.9.4/scheduler.min.css'></script> 

<script type="text/javascript">
$(document).ready(function() { 
	$('#calendar').fullCalendar({ 
		header: { 
			left: 'prev,next today', 
			center: 'title', 
			right: 'month,basicWeek,timelineWeek'
			}, 
		defaultDate: new Date(), 
		navLinks: true, 
		// can click day/week names to navigate views 
		editable: false, 
		eventLimit: true, 


		events: 
			 [
			{ id: 'a',title: 'All Day Event', 
				start: '2018-06-01' 
			}, 
			{ id: 'c',title: 'Long Event', 
				start: '2018-06-01', 
				end: '2018-06-10' 
			}, 
			{ id: 'f', 
				title: 'Repeating Event', 
				start: '2018-06-01T16:00:00' 
			} 
			]  
		}); 
	}); 

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
	<h1>캘린더</h1>
	<div id="calendar"></div>
</body>
</html>