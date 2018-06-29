<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			$('#btnFeedback').click(function() {
				location.href="${pageContext.request.contextPath}/getDoctorFeedbackResult?doctorFeedbackRequestNo="+$('#doctorFeedbackRequestNo').val();
			})
		})
	</script>
<body>
	<input type="hidden" id="doctorFeedbackRequestNo" name="doctorFeedbackRequestNo" value="${doctorFeedbackRequest.doctorFeedbackRequestNo}">
	<div id="div">
		<div>
			질병명 : ${doctorFeedbackRequest.diseaseName}
		</div>
		<div>
			제목 : <input type="text" name="doctorFeedbackRequestTitle" value="${doctorFeedbackRequest.doctorFeedbackRequestTitle}" readonly>
		</div>
		<div>
			내용 :<br>
			<textarea name="doctorFeedbackRequestContent" cols="100" rows="10" autofocus="autofocus" required="required" style="resize: none;" readonly>${doctorFeedbackRequest.doctorFeedbackRequestContent}</textarea>
		</div>		
	</div>
	<div>
		<button type="button" id="btnFeedback">피드백확인하기</button>
	</div>
</body>
</html>