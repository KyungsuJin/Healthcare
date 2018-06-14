<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script>
		
		$(document).ready(function(){
			$("#messageNo").val();
			$("#complainSubmit").click(function(){
				$.ajax({
					type :"POST"
					,url : "${pageContext.request.contextPath}/messageComplain"
					,data : {"complainReason" :$("#complainReason").val()
							,"messageNo" :$("#sendMessageNo",opener.document).val()
							,}
					,dataType:"json"
					,success:function(data){
						if(data==0){
							alert('신고처리 되었습니다.');
							window.close();
						}else{
							alert('이미 신고된 메시지 입니다.');
							window.close();
						}
						
					}
				});
			});
		});
		
	</script>

</head>
<body>
	<h1>메시지 신고</h1>
	신고 사유
		<select id="complainReason">
			<option value="불법적인 광고 메시지">불법적인 광고 메시지</option>
			<option value="지속적인 반복 메시지">지속적인 반복 메시지</option>
		</select>
		<button type="button" id="complainSubmit">완료</button>
</body>
</html>