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
	//ajax ����
	function ajaxData() {
		var memberNo = $('#memberNoSession').val();
		console.log(memberNo);
		var request = $.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/bloodSugarChart?memberNo="+memberNo
        });   
	//ajax ���� �� Ȯ��
	request.done(function( msg ) {
		//�޾ƿ� ������ �� Ȯ��. 
		console.log(msg);
		if(msg.length<2){
			$('#chartResult').html('�ֱ� �Ѵ޵��� ��ϵ� ������ 2�� �̸��Դϴ�. ��� ���� ��Ʈ�� ��������ø� ������ �� ������ּ���.');
			$('#addBtn').show();
			$('#bloodSugarResult').hide();
			return false;
		}else if(msg.length<1){
			$('#chartResult').html('�ֱ� �Ѵ޵��� ��ϵ� �����Ͱ� �����ϴ�.');
			$('#addBtn').show();
			$('#bloodSugarResult').hide();
			return false;
		}else{
			$('#addBtn').hide();
		}
		
            	
                google.charts.load('current', {'packages':['line']}); //��Ʈ ��Ÿ��
                google.charts.setOnLoadCallback(drawChart);
                var chartDateformat = 'yy��MM��dd��';
                var chartLineCount = 10;
                   function drawChart() {
                      //�迭�� Ȯ��.
                      if(msg!=undefined && Array.isArray(msg)){
                         console.log('array Ȯ��');
                         console.log(msg);
                         console.log(msg.length);

                         for(var i=0; i < msg.length; i++){
                         console.log("1:"+msg[i].fastingBloodSugar);
                         }
                      }else{
                         console.log('������ ����');
                         console.log(msg);
                      }
                      var data = new google.visualization.DataTable();
                      //�ϴ��� ������� ǥ���� �� �÷�
                      data.addColumn('datetime', '�����[day]');
                      //�����Ͱ�(�׷��� ��ġ)
                      data.addColumn('number', '��������'); 
                      //�������
                      data.addColumn('number', '����');
                      //�������
                      data.addColumn('number', '����');
                      //�索��
                      data.addColumn('number', '�索��');
                      var nomal = 100;
                      var dangerous group = 125;
                      var diabetes = 126;
                      //�� �߰� (�÷� ��ϼ����� �߰� �����,���������,�̿ϱ�����)
                      for(var i=0; i < msg.length; i++){
                         data.addRow([new Date(msg[i].bloodSugarDate),parseInt(msg[i].fastingBloodSugar)]);
                      }
                      //�׷��� �ɼ� ����
                      var options = {
                         //��Ʈ ����� ���� ����
                         chart:{title : '���� �׷���',
                            subtitle: '�ֱ� �Ѵ� ������ ���� ��ġ �׷���'
                         },
                         //��Ʈ ũ�� ����
                         width: 900, // ���� �ɼ�
                         height: 500, // ���� �ɼ�
                         //��Ʈ�� �翷 y�� ���� series, �� axes ��3�� �̻��� �����Ͱ��� �־��� ��� ��ġ�⶧���� ����..
                                series: {
                                   0: {axis: 'fastingBloodSugar'},
                            },
                         axes: {
                            y: {
                               diastolicPressure: {label: '��������[fastingBloodSugar]'},
                            }
                         },
                                hAxis: {
                            format: chartDateformat, 
                            gridlines:{
                               count:chartLineCount,
                               units: {                      
                                  years : {format: ['yyyy��']},
                                  months: {format: ['MM��']},
                                  days  : {format: ['dd��']},
                                  hours : {format: ['HH��']}
                                  }
                               }
                            }
                         };
                        //�Է°��� ȭ�鿡 �ѷ��ִ� ����.
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
                	   //ajax ���� �� Ȯ��
                	   request.done(function( msg ) {
                	              
                	                google.charts.load('current', {'packages':['line']}); //��Ʈ ��Ÿ��
                	                google.charts.setOnLoadCallback(drawChart);
                	                var chartDateformat = 'yy��MM��dd��';
                	                var chartLineCount = 10;
                	                   function drawChart() {

                	                      var data = new google.visualization.DataTable();
                	                      //�ϴ��� ������� ǥ���� �� �÷�
                	                      data.addColumn('datetime', '�����[day]');
                	                      //�����Ͱ�(�׷��� ��ġ)
                	                      data.addColumn('number', '��������');  
                	                      data.addColumn('number', '�Ļ�������');

                	                      //�� �߰� (�÷� ��ϼ����� �߰� �����,���������,�̿ϱ�����)
                	                      for(var i=0; i < msg.length; i++){
                	                    	  data.addRow([new Date(msg[i].bloodSugarDate),parseInt(msg[i].fastingBloodSugar)]);
                	                      }
                	                      //�׷��� �ɼ� ����
                	                      var options = {
                	                         //��Ʈ ����� ���� ����
                	                         chart:{title : '���� �׷���',
                	                            subtitle: '�ֱ� �Ѵ� ������ ���� ��ġ �׷���'
                	                         },
                	                         //��Ʈ ũ�� ����
                	                         width: 900, // ���� �ɼ�
                	                         height: 500, // ���� �ɼ�
                	                         //��Ʈ�� �翷 y�� ���� series, �� axes ��3�� �̻��� �����Ͱ��� �־��� ��� ��ġ�⶧���� ����..
                	                                series: {
                	                                   0: {axis: 'fastingBloodSugar'},
                	                            },
                	                         axes: {
                	                            y: {
                	                            	fastingBloodSugar: {label: '�Ļ�������[fastingBloodSugar]'},
                	                            }
                	                         },
                	                                hAxis: {
                	                            format: chartDateformat, 
                	                            gridlines:{
                	                               count:chartLineCount,
                	                               units: {                      
                	                                  years : {format: ['yyyy��']},
                	                                  months: {format: ['MM��']},
                	                                  days  : {format: ['dd��']},
                	                                  hours : {format: ['HH��']}
                	                                  }
                	                               }
                	                            }
                	                         };
                	                        //�Է°��� ȭ�鿡 �ѷ��ִ� ����.
                	                         var chart = new google.charts.Line(document.getElementById('linechart_material'));
                	                         chart.draw(data, google.charts.Line.convertOptions(options));
                	                       }
                	      });  
                	   request.fail(function( jqXHR, textStatus ) {
                	        alert( "Request failed: " + textStatus );
                	      });
            	
            	
            
            	
			if(msg.length> 0){
	    		// �̿ϱ�,����� �迭 ��� �Լ�
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
	    		console.log("��հ�:"+Math.round(average(msg))+","+Math.round(averages(msg)));
	    		$('#fastingBloodSugar').html('������ �����<span id="purple"> '+Math.round(average(msg))+'mgdl</span>�Դϴ�');
	    		/* ������ ����
	    		100�̸�
	    		100~125����
	    		125�̻� */
	    		var diastolic = Math.round(average(msg));
				if(90<fastingBloodSugar){
					if(fastingBloodSugar<200){
						$('#fastingBloodSugar').html('������ �����Դϴ�.');
					}else if(fastingBloodSugar<=250){
						$('#fastingBloodSugar').html('�索���� �ǽɵ˴ϴ�. ������ �湮���ּ���.');
					}else if(251<fastingBloodSugar){
						$('#fastingBloodSugar').html('�索�� �ܰ��Դϴ�. ������ �湮���ּ���.');
					}
				}else{
					$('#fastingBloodSugar').html('�������� �ǽɵ˴ϴ�.');
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
			<h4>�ֱ� �Ѵް��� ���� �׷���</h4>
				<input type="hidden" id="memberNoSession" value="${sessionScope.memberSessionNo}">
				<span id="chartResult"></span>
				<div id="addBtn">
					<a href="${pageContext.request.contextPath}/addBloodSugar">���� ����ϱ�</a>
				</div>
				<div class="col-sm-12" align="center">
				<div class="row">
					<div class='col-sm-8'>
						<!-- ��Ʈ�� �׷����� ��ġ -->
						<div id="linechart_material"></div>
						<div id="linechart_materialF"></div>
						</div>
				 	<div class='col-sm-3' align="center">			 	
						<table class="table table-hober">
							<tr>
								<th>�ܰ�</th>
								<td>��������</td>
								<td>�Ļ�������</td>
							</tr>
							<tr>
								<th>���� ����</th>
								<td>100mgdl �̸�</td>
								<td>200mgdl�̸�</td>
							</tr>
							<tr>
								<th>�索�� ��(��)�ܰ�</th>
								<td>101-125mgdl</td>
								<td>250mgdl�̸�</td>
							</tr>
							<tr>
								<th>�索��</th>	
								<td>126mgdl�̻�</td>
								<td>250mgdl�̻�</td>
							</tr>
						</table>
						<!-- ���� ����� ��� -->
						<div id="bloodSugarResult">
						<h5>�ֱ� �Ѵް��� ���� �м� ���</h5>
							<div>
								<span id="purple">���� ���� :</span> 
								<span id="fastingBloodSugarT"></span>
								<div>
								<span id="fastingBloodSugarT"></span>
								</div>
								<div>
								<span id="purple">�Ļ� �� ���� :</span>
								<span id="fastingBloodSugarF"></span>
								<div>
								<span id="fastingBloodSugarF"></span>
								</div>
							</div>
					 	</div>
						<div class="navbar-form navbar-right">
							<input type="button" class="btn btn-primary" onclick="returnBtn()" value="���ư���">
						</div>
					</div>
				</div>
 			</div>
 			</div>
		</div>
	</div>
</body>
</html>