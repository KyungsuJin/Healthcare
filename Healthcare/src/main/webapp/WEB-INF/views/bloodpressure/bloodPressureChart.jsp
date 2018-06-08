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

		success : function(list){
			console.log(list);   
			google.charts.load('current', {'packages':['line']});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = new google.visualization.DataTable();					
				data.addColumn('datetime', '날짜');
				data.addColumn('number', '이완기혈압');
				data.addColumn('number', '수축기혈압');
					
				var dataRow = [];
				
				for(var i=0; i<=list.length; i++){
					console.log(list.length); 
					var date = list[i].bloodPressureDate;
					console.log(date); 
					var systolic = list[i].systolicPressure;
					console.log(systolic); 
					var diastolic = list[i].diastolicPressure;
					console.log(diastolic); 
					dataRow = [date,systolic,diastolic];
				}
				
				data.addRow(dataRow);
				var options = {
					chart:{title : '내혈압그래프'},
					width: 900, // 넓이 옵션
					height: 300 // 높이 옵션
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
    <input type="button" value="데이터호출" onclick="ajaxData()"/>
    
  <%--   <table>
        

    	<thead>
    		<tr>
    			<th>이완기</th>
    			<th>수축기</th>
    			<th>최종수정날짜</th>
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