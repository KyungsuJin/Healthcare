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
			$('.divFome').hide();
			$('.btnToggle').click(function() {
				$('.divDisease').toggle();
			})
			$('.btnRequest').click(function() {
				$('.divBtn').hide();
				$('.div').hide();
				$('.divFome').show();
				//피드백요청수락을 누르면 hidden으로 수락여부의 value값으로 T를 입력한다.
				var approval = '<input type="hidden" name=doctorFeedbackApproval value="T">';
				$('#form').append(approval);
				console.log("ajax시작");
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/getMemberDiseaseListForFeedback"
					,data : {"memberNo" : $('#memberNo').val()}
					,dataType : "json"
					,success : function(result) {
						alert('성공');
						for(var i=0; i<result.length; i++){
							$('.tbody').append('<tr><td>'+i+'</td>'+
													'<td class="td">'+result[i].diseaseName+'</td>'+
													'<td class="td">'+result[i].diseaseSubCategoryName+'</td>'+
													'<td class="td">'+result[i].familyHistory+'</td></tr>')
						}
					}
					,error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
				
			})
			$(document).on('click','#btnSend', function() {
				$('#form').submit();
			})
		})
	</script>
</head>
<body>
	<h1>getDoctorFeedBackRequestedDetail.jsp</h1>
	<input type="hidden" name="doctorNo" value="${memberSessionNo}">
	<input type="hidden" id="memberNo" name="memberNo" value="${doctorFeedbackRequest.memberNo}">
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
			</div>
		</div>
	<form id="form" action="${pageContext.request.contextPath}/doctorFeedbackResult" method="POST">
		<input type="hidden" name="doctorFeedbackRequestNo" value="${doctorFeedbackRequest.doctorFeedbackRequestNo}">
		<div class='divFome'>
			<div class="divToggle">
				<button type="button" class="btnToggle">회원질병 확인하기/숨기기</button>
			</div>
			<div class="divDisease">
				<table class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>질병명</th>
							<th>질병하위분류</th>
							<th>가족력유무</th>
						</tr>
					</thead>
					<tbody class="tbody">
					</tbody>
				</table>
			</div>
			<div>
				피드백 제목 : <input type="text" name="doctorFeedbackResultTitle">
			</div>
			<div>
				피드백 내용
				<div> 	
					<textarea name="doctorFeedbackResultContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
				</div>
				<button type="button" id="btnSend">피드백 보내기</button>
			</div>
		</div>
	</form>
</body>
</html>