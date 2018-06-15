<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
			$("#bmiChart").click(function(){
				$.ajax({
					type: "POST"
					,url : "${pageContext.request.contextPath}/bodyMassIndexChart"
					,data: {"memberNo" : $("#memberNo").val()}
					,dataType: "json"
					,success:function(result){
						
						console.log(result);
						if(result.length>=2){
							//구글 차트
							google.charts.load('current', {'packages':['corechart']});
							google.charts.setOnLoadCallback(drawChart);
							var chartDateformat = 'yy년MM월dd일';
							var chartLineCount = 15;
						      function drawChart() {
						        var data = new google.visualization.DataTable();
						        
						        data.addColumn('datetime', '등록일[day]');
						        data.addColumn('number','BMI');
						        data.addColumn('number','정상');
						        data.addColumn('number','저체중');
						        data.addColumn('number','과체중');
						        data.addColumn('number','비만');
						       var nomal=21;
						       var underWeight =18.5;
						       var overWeight =23;
						       var obese =25;
						       for(var i =0;i<result.length;i++){
						    	   data.addRow([new Date(result[i].bodyDate),(result[i].bodyMassIndex),nomal,underWeight,overWeight,obese]);
						       }
						        var options = {
						        		title : 'BMI 차트',
										hAxis: {
											format: chartDateformat, 
											gridlines:{
												count:chartLineCount,
												units: {                      
													years : {format: ['yyyy년']},
													months: {format: ['MM월']},
													days  : {format: ['dd일']},
													hours : {format: ['HH시']}
													}
												}
											}
		
						        };
						        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
						        chart.draw(data, options);
						      }
						}else{
							alert('등록된 체질량 정보는 2개 이상이여야 합니다 .체질량등록페이지로 이동합니다.');
							window.location.href="${pageContext.request.contextPath}/addBodyMassIndex";
						}
						
					}
				});
			});
			$("#bodyWeightChart").click(function(){
				$.ajax({
					type: "POST"
					,url : "${pageContext.request.contextPath}/bodyMassIndexChart"
					,data: {"memberNo" : $("#memberNo").val()}
					,dataType: "json"
					,success:function(result){
						
						console.log(result);
						if(result.length>=2){
							//구글 차트
							google.charts.load('current', {'packages':['corechart']});
							google.charts.setOnLoadCallback(drawChart);
							var chartDateformat = 'yy년MM월dd일';
							var chartLineCount = 30;
						      function drawChart() {
						        var data = new google.visualization.DataTable();
						        
						        data.addColumn('datetime', '등록일[day]');
						        data.addColumn('number','체중');

						       for(var i =0;i<result.length;i++){
						    	   data.addRow([new Date(result[i].bodyDate),(result[i].bodyWeight)]);
						       }
						        var options = {
						        		title : '몸무게 차트',
										hAxis: {
											format: chartDateformat, 
											gridlines:{
												count:chartLineCount,
												units: {                      
													years : {format: ['yyyy년']},
													months: {format: ['MM월']},
													days  : {format: ['dd일']},
													hours : {format: ['HH시']}
													}
												}
											}
		
						        };
						        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
						        chart.draw(data, options);
						      }
						}else{
							alert('등록된 체질량 정보는 2개 이상이여야 합니다 .체질량등록페이지로 이동합니다.');
							window.location.href="${pageContext.request.contextPath}/addBodyMassIndex";
						}
					}
				});
			});
			
		});
	
	</script>
</head>
<body>
	<h1>체질량 차트</h1>
	
	<a href="#" id="bmiChart">BMI 차트</a>
	<a href="#"id="bodyWeightChart">몸무게 차트</a>
	<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
	<div id="curve_chart" style="width: 900px; height: 500px" class="container"></div>
</body>
</html>