<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
	<div class="form-group">
	<label class="control-label">신고 사유</label>
		<select class="form-control" id="complainReason">
			<option value="불법적인 광고 메시지">불법적인 광고 메시지</option>
			<option value="지속적인 반복 메시지">지속적인 반복 메시지</option>
		</select>
		<button type="button" id="complainSubmit" class="btn btn-primary pull-right">완료</button>
	</div>
</body>
</html>