<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" >

<head>
  	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  	<jsp:include page="include/header.jsp"></jsp:include>
  	<script>
	  	$(document).ready(function(){
	  		ajaxBodyMassIndexChart();
	  		ajaxData();
	  		$(document).on("click","#miniBodyMassIndexChart",function(){
	  			ajaxBodyMassIndexChart();
	  		});
	  		/* BMI 미리보기 차트 */
	  		function ajaxBodyMassIndexChart(){
		  		$.ajax({
					type: "POST"
					,url : "${pageContext.request.contextPath}/bodyMassIndexChart"
					,data: {"memberNo" : $("#memberNo").val()}
					,dataType: "json"
					,success:function(result){
						$("#miniBodyMassIndexChart").remove();
						$("#miniChartChange").append('<a href="#" id="miniBodyWeightChart">몸무게 차트보기</a>');
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
						        window.addEventListener('resize', function() { chart.draw(data, options); }, false);
						        chart.draw(data, options);
						      }
						}else{
					    	  $("#curve_chart").append('<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록하기</a>');
					    }
					}
				});
	  		}
		  		/* 몸무게 미리보기  차트 */
		  		$(document).on("click","#miniBodyWeightChart",function(){
					$.ajax({
						type: "POST"
						,url : "${pageContext.request.contextPath}/bodyMassIndexChart"
						,data: {"memberNo" : $("#memberNo").val()}
						,dataType: "json"
						,success:function(result){
							$("#miniBodyWeightChart").remove();
							$("#miniChartChange").append('<a href="#" id="miniBodyMassIndexChart">BMI차트 보기</a>');
							console.log(result);
							if(result.length>=2){
								//구글 차트
								google.charts.load('current', {'packages':['corechart']});
								google.charts.setOnLoadCallback(drawChart);
								var chartDateformat = 'yy년MM월dd일';
								var chartLineCount = 10;
				        		var controlLineCount    = 10;
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
							        window.addEventListener('resize', function() { dashboard.draw(data); }, false);
							        chart.draw(data, options);
							      }
								}else{
							    	  $("#curve_chart").append('<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록하기</a>');
							    }
							}
						});
		  		});
		  		function ajaxData() {
		  			var request = $.ajax({
		  			type : "POST",
		  			url : "${pageContext.request.contextPath}/bloodPressureChart"
		  			,data: {"memberNo" : $("#memberNo").val()}
		  	        });   
		  		//ajax 실행 값 확인
		  		request.done(function( msg ) {
		  			//받아온 데이터 값 확인. 
		  			console.log(msg);
		  			
		  			//구글 차트
		  			google.charts.load('current', {'packages':['line']}); //차트 스타일
		  			google.charts.setOnLoadCallback(drawChart);
		  			var chartDateformat = 'yy년MM월dd일';
		  			var chartLineCount = 10;
		  				function drawChart() {
		  					//배열값 확인.
		  					if(msg!=undefined && Array.isArray(msg)){
		  						console.log('array 확인');
		  						console.log(msg);
		  						console.log(msg.length);

		  						for(var i=0; i < msg.length; i++){
		  						console.log("1:"+msg[i].systolicPressure);
		  						console.log("2:"+msg[i].diastolicPressure);
		  						}
		  					}else{
		  						console.log('데이터 없음');
		  						console.log(msg);
		  					}
		  					var data = new google.visualization.DataTable();
		  					//하단의 등록일을 표시해 줄 컬럼
		  					data.addColumn('datetime', '등록일[day]');
		  					//데이터값(그래프 수치)
		  					data.addColumn('number', '수축기혈압');  
		  					data.addColumn('number', '이완기혈압');

		  					//열 추가 (컬럼 등록순으로 추가 등록일,수축기혈압,이완기혈압)
		  					for(var i=0; i < msg.length; i++){
		  						data.addRow([new Date(msg[i].bloodPressureDate),parseInt(msg[i].systolicPressure),parseInt(msg[i].diastolicPressure)]);
		  					}
		  					//그래프 옵션 설정
		  					var options = {
		  						//차트 상단의 제목 설정
		  						title : '혈압 차트',
		  	                      series: {
		  	                    	  0: {axis: 'diastolicPressure'},
		  	                    	  1: {axis: 'systolicPressure'}
		  							},
		  						axes: {
		  							y: {
		  								diastolicPressure: {label: '이완기혈압'},
		  								systolicPressure: {label: '수축기혈압'}
		  							}
		  						},
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
		  					  //입력값을 화면에 뿌려주는 역할.
		  				      var chart = new google.charts.Line(document.getElementById('linechart_material'));
		  				    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
		  				      chart.draw(data, google.charts.Line.convertOptions(options));
		  	            	}
		  			});
		  		}
		  		
	  	});
	  	
	</script>
</head>

<body>
	<div class="wrapper" style="overflow:auto; overflow-y:hidden; width:auto; height:auto; padding:0 0 17px 0;">
			<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
			<jsp:include page="include/left.jsp"></jsp:include>
        <div class="main-panel">
            <jsp:include page="include/top.jsp"></jsp:include>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">content_copy</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Used Space</p>
                                    <h3 class="title">49/50
                                        <small>GB</small>
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">warning</i>
                                        <a href="#pablo">Get More Space...</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
                                    <i class="material-icons">store</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Revenue</p>
                                    <h3 class="title">$34,245</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">date_range</i> Last 24 Hours
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
                                    <i class="material-icons">info_outline</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Fixed Issues</p>
                                    <h3 class="title">75</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">local_offer</i> Tracked from Github
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="fa fa-twitter"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Followers</p>
                                    <h3 class="title">+245</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">update</i> Just Updated
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                
                                <c:if test="${sessionScope.memberSessionLevel eq null}">
                                    	<div class="ct-chart" id="dailySalesChart"></div>
	                                <div class="card-content">
	                                    <h4 class="title">자신의 체질량 차트</h4>
	                                    <p class="category">
	                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
	                                </div>
	                                <div class="card-footer">
	                                    <div class="stats">
	                                        <i class="material-icons">access_time</i> updated 4 minutes ago
	                                    </div>
	                                </div>
	                            </c:if>
	                            <c:if test="${sessionScope.memberSessionLevel eq 2}">
                                    	<div class="ct-chart" id="curve_chart">
                                    	</div>
	                                <div class="card-content">
	                                    <h4 class="title" style="text-align:center;">자신의 차트</h4>
	                                </div>
	                                <div class="card-footer">
	                                    <div class="stats" id="miniChartChange">
	                                    </div>
	                                </div>
	                            </c:if>
                                
                            </div>
                        </div>
                       
                        <div class="col-md-6">
                            <div class="card">
                            	<c:if test="${sessionScope.memberSessionLevel eq 2}">
                                    <div class="ct-chart" id="linechart_material"></div>
	                                <div class="card-content">
	                                    <h4 class="title"  style="text-align:center;">혈압 차트</h4>
	                                </div>
	                                <div class="card-footer">
	                                    <div class="stats" >
	                                        <a href="#">혈당 차트보기</a>
	                                    </div>
	                                </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="purple">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Tasks:</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">bug_report</i> Bugs
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">code</i> Website
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">cloud</i> Server
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Create 4 Invisible User Experiences you Never Knew About</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="messages">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="settings">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="orange">
                                    <h4 class="title">Employees Stats</h4>
                                    <p class="category">New employees on 15th September, 2016</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                        	<li>
                                 	팀원 소개
                            </li>
                            <li>
                                <a href="#">
                                 	진경수
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                   	김문기
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                   	 도정만
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                   	 나윤주
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                   	 박지하
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="https://github.com/KyungsuJin/Healthcare">건강매니지먼트</a>, github 바로가기
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        demo.initDashboardPageCharts();
    });
</script>

</html>