<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bloodPressureChart</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery.min.js"></script>
	<!-- google charts -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var memberNo = "member_1";
	function ajaxData() {
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/bloodPressureChart?memberNo="+memberNo,
		success : function(msg){
			console.log("listSet:"+msg);   
			google.charts.load('current', {'packages':['line', 'corechart']});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = new google.visualization.arraytodataTable(msg);
/* 				data.addColumn('number', '��ϳ�¥');
				data.addColumn('number', '�̿ϱ�����');
				data.addColumn('number', '���������'); */

				var options = {
					chart:{title : '���б׷���'},
					width: 900, // ���� �ɼ�
					height: 300, // ���� �ɼ�
					};
				      
				 var chart = new google.charts.Line(document.getElementById('linechart_material'));
			      chart.draw(data, google.charts.Line.convertOptions(options));
            	}
            }
        });   
	}
       $(document).ready(function(){
    	    ajaxData();
    	});

</script>
</head>
<body>
    <div id="linechart_material"></div>
    <input type="button" value="������ȣ��" onclick="ajaxData()"/>
    
  <%--   <table>
        

    	<thead>
    		<tr>
    			<th>�̿ϱ�</th>
    			<th>�����</th>
    			<th>����������¥</th>
  			</tr>
    	</thead>
    	<tbody>
    	<c:foreach var="bloodPressure" items="${list }">
    		<tr>
    			<th>${bloodPressure.diatolicPressure }</th>
    			<th>${bloodPressure.systolicPressure }</th>
    			<th>${bloodPressure.bloodPressureDate }</th>
    		</tr>
    	
    </c:foreach>
    	</tbody>

    </table> --%>

</body>
</html>