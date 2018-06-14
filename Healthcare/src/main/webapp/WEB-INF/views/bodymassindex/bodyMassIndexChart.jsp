<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		$(document).ready(function(){
			$.ajax({
				type: "POST"
				,url : "${pageContext.request.contextPath}/bodyMassIndexChart"
				,data: {"memberNo" : $("#memberNo").val()}
				,dataType: "json"
				,success:function(result){
					
					console.log(result);
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					var chartDateformat = 'yy년MM월dd일';
					var chartLineCount = 10;
				      function drawChart() {
				        var data = new google.visualization.DataTable();
				        data.addColumn('datetime', '등록일[day]');
				       data.addColumn('number','몸무게');
				       data.addColumn('number','몸무게1');
				       for(var i =0;i<result.length;i++){
				    	   data.addRow([new Date(result[i].bodyDate),parseInt(result[i].bodyHeight),parseInt(result[i].bodyWeight)]);
				       }
				        /*   for(var i=0; i < data.length; i++){
							data.addRow([(data[i].bodyHeight),(data[i].bodyWeight),(data[i].bodyWaistSize),(data[i].bodyMassIndex)]);
						} */
				        var options = {
				        		chart:{title : '혈압 그래프',
									subtitle: '최근 일주일 혈압 수치 그래프'	
								},
								width: 900, // 넓이 옵션
								height: 500, // 높이 옵션
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
				}
			});
		});
	
	</script>
</head>
<body>
	<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
	<div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>