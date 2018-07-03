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
						console.log(result);
						if(result.length>=2){
							$("#miniBodyMassIndexChart").remove();
							$("#miniBmiChartChange").append('<a href="#" id="miniBodyWeightChart">몸무게 차트보기</a>');
							//구글 차트
							google.charts.load('current', {'packages':['corechart']});
							google.charts.setOnLoadCallback(drawChart);
							var chartDateformat = 'yy년MM월dd일';
							var chartLineCount = 7;
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
					    	  $("#miniBmiChartChange").append('<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록하기</a>');
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
							console.log(result);

							$("#miniBodyWeightChart").remove();
							$("#miniBmiChartChange").append('<a href="#" id="miniBodyMassIndexChart">BMI차트 보기</a>');
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
		  			
		  			if(msg.length>=2){
		  			//구글 차트
			  			google.charts.load('current', {'packages':['line']}); //차트 스타일
			  			google.charts.setOnLoadCallback(drawChart);
			  			var chartDateformat = 'yy년MM월dd일';
			  			var chartLineCount = 10;
		  				function drawChart() {
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
		  				}else{
		  					$("#miniBloodPressureChart").append('<a href="${pageContext.request.contextPath}/addBloodPressure">혈압 등록하기</a>');
		  				}
		  			});
		  		}
		  		
	  	});
	  	
	</script>
</head>
<style>
#textsize{
 font-size : 7px;
 line-height:120%;
}
#textsize2{
 font-size : 7px;
 line-height:120%;
}
</style>
<body>
	<div class="wrapper" style="overflow:auto; overflow-y:hidden; width:auto; height:auto; padding:-5px 0px 17px 0px;">
		<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
		<jsp:include page="include/left.jsp"></jsp:include>
        <div class="main-panel">
            <jsp:include page="include/top.jsp"></jsp:include>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">content_copy</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">팀프로젝트 소개</p>
                                    	소셜 네트워크+<br>건강데이터베이스 기반의 <br>건강관리 사이트 헬프 입니다.
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <p id="textsize">헬프란? 헬스와 프렌트의 합성어로써 건강 친구라는 의미입니다.
                                        <br>서로 도와 건강을 관리하자는 의미에서 비롯되었습니다.</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <div class="card card-stats">
                                <div>
                                </div>
                                <div class="card-content">
	                                    <span class="title"><br></span>
	                                    <div align="center">
	                                   		<br>
	                                   <a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl&memberPw=1234">관리자 로그인</a>
	                                   | <a href="${pageContext.request.contextPath}/loginDirect?memberId=1234&memberPw=1234">일반회원 로그인</a>
	                                    | <a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl93&memberPw=1234">의사회원 로그인</a>
	                                   | <a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl936&memberPw=1234">PT 회원 로그인</a>
	                                		<br><br>
	                                	</div>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                       <p> <a href="#">클릭하면 자동으로 로그인이 됩니다.</a></p>
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
	                                    <h5 class="title">차트를 이용해 자신의 건강을 수치화 해보세요!</h5>
	                                </div>
	                            </c:if>
	                            <c:if test="${sessionScope.memberSessionLevel eq 2}">
                                    	<div class="ct-chart" id="curve_chart"></div>
	                                <div class="card-content">
	                                    <h4 class="title" style="text-align:center;">체질량 차트</h4>
	                                </div>
	                                <div class="card-footer">
	                                    <div class="stats" id="miniBmiChartChange">
	                                    </div>
	                                </div>
	                            </c:if>
                                
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                            	<c:if test="${sessionScope.memberSessionLevel eq null}">
                                   	 <div class="ct-chart" id="emailsSubscriptionChart"></div>
	                                <div class="card-content">
	                                    <h4 class="title">좀 더 건강한 내일을 위한 자신만의 차트를 만들어보세요!</h4>
	                               	</div>
	                            </c:if>
                            	<c:if test="${sessionScope.memberSessionLevel eq 2}">
                                    <div class="ct-chart" id="linechart_material"></div>
	                                <div class="card-content">
	                                    <h4 class="title"  style="text-align:center;">혈압 차트</h4>
	                                </div>
	                                <div class="card-footer">
	                                    <div class="stats" id="miniBloodPressureChart">
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
                                     <h4 class="title">주요기능</h4>
                                    <p class="category">헬프의 기능을 소개합니다.</p>
                                </div>
                                <div class="card-content">
                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									  <!-- Indicators -->
									 <ol class="carousel-indicators">
									    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									  </ol>
									  <div class="carousel-inner" role="listbox">
									    <div class="item active">
									      <img src="./img/sample.JPG" alt="...">
										      <div class="carousel-caption d-none d-md-block">
											    <p><h5>캘린더로 자신의 건강을 체계적으로 관리해보세요!<h5></p>
											  </div>
									    </div>
									    <div class="item">
									      <img src="./img/sample.JPG" alt="...">
										      <div class="carousel-caption">
										        ...
										      </div>
									    </div>
									     <div class="item">
									      <img src="./img/sample.JPG" alt="...">
										      <div class="carousel-caption">
										        ...
										      </div>
									      </div>
									  </div>
									
									  <!-- Controls -->
									  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
									  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
									</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="orange">
                                    <h4 class="title">팀원 소개</h4>
                                    <p class="category">헬프의 팀원을 소개합니다. 해당 글씨를 클릭하면 이동합니다.</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <tbody>
                                    	    <tr>
                                                <td>1. 진경수 [팀장] : <a href="#">사이트</a> | <a href="#">이력서</a> | <a href="#">깃허브</a></td>
                                            </tr>
                                            <tr>
                                                <td>2. 김문기 [팀원] : <a href="#">사이트</a> | <a href="#">이력서</a> | <a href="#">깃허브</a></td>
                                            </tr>
                                            <tr>
                                                <td>3. 박지하 [팀원] : <a href="#">사이트</a> | <a href="#">이력서</a> | <a href="#">깃허브</a></td>
                                            </tr>
                                            <tr>
                                                <td>4. 도정만 [팀원] : <a href="#">사이트</a> | <a href="#">이력서</a> | <a href="#">깃허브</a></td>
                                            </tr>
                                            <tr>
                                                <td>5. 나윤주 [팀원] : <a href="#">사이트</a> | <a href="#">이력서</a> | <a href="#">깃허브</a></td>
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
                                 	팀원
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