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
	<script>
		$(document).ready(function() {
			$('.btnFeedback').hide();
			$.ajax({
				type : "POST"
				,url : "${pageContext.request.contextPath}/selectForInsertFeedbackApproval"
				,data : {"doctorFeedbackRequestNo" : $('#doctorFeedbackRequestNo').val()}
				,dataType : "text"
				,success : function(result) {
					console.log(result);
					if(result == "F") {
						$('.btnRequest').remove();
						$('.btnCancel').remove();
						$('.btnFeedback').show();
					}
				}
				,error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			$('.btnRequest').click(function() {
				location.href="${pageContext.request.contextPath}/addDoctorFeedbackApprovalAcceptance?doctorFeedbackRequestNo="+$('#doctorFeedbackRequestNo').val()+"&doctorFeedbackApproval=T";
			})
			$('.btnCancel').click(function() {
				location.href="${pageContext.request.contextPath}/addDoctorFeedbackApproval?doctorFeedbackRequestNo="+$('#doctorFeedbackRequestNo').val()+"&doctorFeedbackApproval=F";
			})
			$('.btnFeedback').click(function() {
				location.href="${pageContext.request.contextPath}/addDoctorFeedbackResult?doctorFeedbackRequestNo="+$('#doctorFeedbackRequestNo').val()+"&memberNo="+$('#memberNo').val();
			})
		})
	</script>
</head>
<body>
	<h1>getDoctorFeedBackRequestedDetail.jsp</h1>
	<input type="hidden" name="doctorNo" value="${memberSessionNo}">
	<input type="hidden" id="memberNo" name="memberNo" value="${doctorFeedbackRequest.memberNo}">
	<input type="hidden" id="doctorFeedbackRequestNo" name="doctorFeedbackRequestNo" value="${doctorFeedbackRequest.doctorFeedbackRequestNo}">
		<div class="div">
			<div>
				질병명 : <input type="text" name="diseaseName" value="${doctorFeedbackRequest.diseaseName}">
			</div>
			<div>
				제목 : <input type="text" name="doctorFeedbackRequestTitle" value="${doctorFeedbackRequest.doctorFeedbackRequestTitle}" readonly>
			</div>
			<div>
				내용 :<br>
				<textarea name="doctorFeedbackRequestContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;" readonly>${doctorFeedbackRequest.doctorFeedbackRequestContent}</textarea>
			</div>
			<div class="divBtn">
				<button type="button" class="btnRequest">요청수락하기</button>
				<button type="button" class="btnCancel">요청거절하기</button>
				<button type="button" class="btnFeedback">피드백해주기</button>
			</div>
		</div>

</body>
</html>