<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">	
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
	<script>
		$(document).ready(function() {
			$.ajax({
				type : "POST"
				,url : "${pageContext.request.contextPath}/getSanctionKindList"
				,dataType : "json"
				,success : function(result) {
					alert('성공')
				}
				,error : function(request,status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			
		})
	</script>
</head>
<body>
	addSanction.jsp
	<form action="" method="POST">
		제재대상 아이디 : <input type="text" name="sanctionMemberNo">
		제재 종류 : <select name="sanctionKindNo"></select>
		제재 사유
		<textarea name="sanctionContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
	</form>
</body>
</html>