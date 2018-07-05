<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bloodPressureChart</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

    $(document).ready(function(){
	    ajaxData();
	    $('#addBtn').hide();
	});	
	//ajax 실행
	function ajaxData() {
		var memberNo = $('#memberNoSession').val();
		console.log(memberNo);
		var request = $.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/bloodSugarChart?memberNo="+memberNo
        });   
	//ajax 실행 값 확인
	request.done(function( msg ) {
		//받아온 데이터 값 확인. 
		console.log(msg);
		if(msg.length<2){
			$('#chartResult').html('최근 한달동안 등록된 혈당이 2개 미만입니다. 평균 혈당 차트를 보고싶으시면 혈당을 더 등록해주세요.');
			$('#addBtn').show();
			$('#bloodSugarResult').hide();
			return false;
		}else if(msg.length<1){
			$('#chartResult').html('최근 한달동안 등록된 데이터가 없습니다.');
			$('#addBtn').show();
			$('#bloodSugarResult').hide();
			return false;
		}else{
			$('#addBtn').hide();
		}
		
            	
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
                         console.log("1:"+msg[i].fastingBloodSugar);
                         }
                      }else{
                         console.log('데이터 없음');
                         console.log(msg);
                      }
                      var data = new google.visualization.DataTable();
                      //하단의 등록일을 표시해 줄 컬럼
                      data.addColumn('datetime', '등록일[day]');
                      //데이터값(그래프 수치)
                      data.addColumn('number', '공복혈당'); 
                      //정상범위
                      data.addColumn('number', '정상');
                      //위험범위
                      data.addColumn('number', '위험');
                      //당뇨병
                      data.addColumn('number', '당뇨병');
                      var nomal = 100;
                      var dangerous group = 125;
                      var diabetes = 126;
                      //열 추가 (컬럼 등록순으로 추가 등록일,수축기혈압,이완기혈압)
                      for(var i=0; i < msg.length; i++){
                         data.addRow([new Date(msg[i].bloodSugarDate),parseInt(msg[i].fastingBloodSugar)]);
                      }
                      //그래프 옵션 설정
                      var options = {
                         //차트 상단의 제목 설정
                         chart:{title : '혈당 그래프',
                            subtitle: '최근 한달 동안의 혈당 수치 그래프'
                         },
                         //차트 크기 설정
                         width: 900, // 넓이 옵션
                         height: 500, // 높이 옵션
                         //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
                                series: {
                                   0: {axis: 'fastingBloodSugar'},
                            },
                         axes: {
                            y: {
                               diastolicPressure: {label: '공복혈당[fastingBloodSugar]'},
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
                         chart.draw(data, google.charts.Line.convertOptions(options));
                         }
            	
                   
                   
                   
                   function ajaxData() {
                	      var memberNo = $('#memberNoSession').val();
                	      console.log(memberNo);
                	      var request = $.ajax({
                	      type : "POST",
                	      url : "${pageContext.request.contextPath}/bloodSugarChartF?memberNo="+memberNo
                	        });   
                	   //ajax 실행 값 확인
                	   request.done(function( msg ) {
                	              
                	                google.charts.load('current', {'packages':['line']}); //차트 스타일
                	                google.charts.setOnLoadCallback(drawChart);
                	                var chartDateformat = 'yy년MM월dd일';
                	                var chartLineCount = 10;
                	                   function drawChart() {

                	                      var data = new google.visualization.DataTable();
                	                      //하단의 등록일을 표시해 줄 컬럼
                	                      data.addColumn('datetime', '등록일[day]');
                	                      //데이터값(그래프 수치)
                	                      data.addColumn('number', '공복혈당');  
                	                      data.addColumn('number', '식사후혈당');

                	                      //열 추가 (컬럼 등록순으로 추가 등록일,수축기혈압,이완기혈압)
                	                      for(var i=0; i < msg.length; i++){
                	                    	  data.addRow([new Date(msg[i].bloodSugarDate),parseInt(msg[i].fastingBloodSugar)]);
                	                      }
                	                      //그래프 옵션 설정
                	                      var options = {
                	                         //차트 상단의 제목 설정
                	                         chart:{title : '혈당 그래프',
                	                            subtitle: '최근 한달 동안의 혈당 수치 그래프'
                	                         },
                	                         //차트 크기 설정
                	                         width: 900, // 넓이 옵션
                	                         height: 500, // 높이 옵션
                	                         //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
                	                                series: {
                	                                   0: {axis: 'fastingBloodSugar'},
                	                            },
                	                         axes: {
                	                            y: {
                	                            	fastingBloodSugar: {label: '식사후혈당[fastingBloodSugar]'},
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
                	                         chart.draw(data, google.charts.Line.convertOptions(options));
                	                       }
                	      });  
                	   request.fail(function( jqXHR, textStatus ) {
                	        alert( "Request failed: " + textStatus );
                	      });
            	
            	
            
            	
			if(msg.length> 0){
	    		// 이완기,수축기 배열 평균 함수
	    		var arrLength = msg.length;
	    		function average(msg) {
	    		  var diaresult = 0;
	    		  for (var i = 0; i < arrLength; i++){
	    			  diaresult += msg[i].fastingBloodSugar;
	    		  }
	    		    return diaresult/arrLength;
	    		}
	    		/* function averages(msg) {
	      		  var sysresult = 0;
	      		  for (var i = 0; i < arrLength; i++){
	      			sysresult += msg[i].systolicPressure;
	      		  }
	    		    return sysresult/arrLength;
	      		} */
	    		console.log("평균값:"+Math.round(average(msg))+","+Math.round(averages(msg)));
	    		$('#fastingBloodSugar').html('혈당의 평균은<span id="purple"> '+Math.round(average(msg))+'mgdl</span>입니다');
	    		/* 공복시 혈당
	    		100미만
	    		100~125이하
	    		125이상 */
	    		var diastolic = Math.round(average(msg));
				if(90<fastingBloodSugar){
					if(fastingBloodSugar<200){
						$('#fastingBloodSugar').html('혈당이 정상입니다.');
					}else if(fastingBloodSugar<=250){
						$('#fastingBloodSugar').html('당뇨병이 의심됩니다. 병원을 방문해주세요.');
					}else if(251<fastingBloodSugar){
						$('#fastingBloodSugar').html('당뇨병 단계입니다. 병원을 방문해주세요.');
					}
				}else{
					$('#fastingBloodSugar').html('저혈당이 의심됩니다.');
				}
			}
	});

	request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
	}
	function returnBtn(){
		history.back();
	}
</script>
<style type="text/css">
tr {
text-align: center;
font-size: 12px;
}
#purple{
color: #9c27b0;
 font-weight: bold;
}
h5{
 font-weight: bold;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h4>최근 한달간의 혈당 그래프</h4>
				<input type="hidden" id="memberNoSession" value="${sessionScope.memberSessionNo}">
				<span id="chartResult"></span>
				<div id="addBtn">
					<a href="${pageContext.request.contextPath}/addBloodSugar">혈당 등록하기</a>
				</div>
				<div class="col-sm-12" align="center">
				<div class="row">
					<div class='col-sm-8'>
						<!-- 차트가 그려지는 위치 -->
						<div id="linechart_material"></div>
						<div id="linechart_materialF"></div>
						</div>
				 	<div class='col-sm-3' align="center">			 	
						<table class="table table-hober">
							<tr>
								<th>단계</th>
								<td>공복혈당</td>
								<td>식사후혈당</td>
							</tr>
							<tr>
								<th>정상 혈당</th>
								<td>100mgdl 미만</td>
								<td>200mgdl미만</td>
							</tr>
							<tr>
								<th>당뇨병 전(前)단계</th>
								<td>101-125mgdl</td>
								<td>250mgdl미만</td>
							</tr>
							<tr>
								<th>당뇨병</th>	
								<td>126mgdl이상</td>
								<td>250mgdl이상</td>
							</tr>
						</table>
						<!-- 혈압 결과값 계산 -->
						<div id="bloodSugarResult">
						<h5>최근 한달간의 혈압 분석 결과</h5>
							<div>
								<span id="purple">공복 혈당 :</span> 
								<span id="fastingBloodSugarT"></span>
								<div>
								<span id="fastingBloodSugarT"></span>
								</div>
								<div>
								<span id="purple">식사 후 혈당 :</span>
								<span id="fastingBloodSugarF"></span>
								<div>
								<span id="fastingBloodSugarF"></span>
								</div>
							</div>
					 	</div>
						<div class="navbar-form navbar-right">
							<input type="button" class="btn btn-primary" onclick="returnBtn()" value="돌아가기">
						</div>
					</div>
				</div>
 			</div>
 			</div>
		</div>
	</div>
</body>
</html>