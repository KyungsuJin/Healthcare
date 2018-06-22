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
			$('#div').hide();
			$.ajax({
				type : "POST"
				,url : "${pageContext.request.contextPath}/getDoctorList"
				,dataType : "json"
				,success : function(result) {
					alert('성공');
					for(var i=0; i<result.length; i++){
						$('#tbody').append('<tr><td>'+i+'</td>'+
											'<td>'+result[i].memberName+'</td>'+
											'<td>'+result[i].memberHospitalName+'</td>'+
											'<td>'+result[i].treatment_department+'</td>'+
											'<td>'+result[i].memberTotalFeedback+'</td>'+
											'<td>'+result[i].memberAgreeFeedback+'</td>'+
											'<td>'+result[i].evaluationAverageGrade+'</td>'+
											'<td><button type="button" name="selectDoctor" class="selectDoctor" value="'+result[i].memberNo+'">선택</button><td></tr>');
					}
				}
				,error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			$(document).on('click','.selectDoctor', function() {
				console.log($(this).val());
				var addHidden = '<input type="hidden" name="doctorNo" value="'+$(this).val()+'">';
				$('#form').append(addHidden);
				$('#tableDoctorList').hide();
				$('#div').show();
				
				$.ajax({
					type :"POST"
					,url : "${pageContext.request.contextPath}/getDiseaseList"
					,dateType : "json"
					,success : function(result) {
						alert('성공');											
						for(var i=0; i< result.length; i++){		
							$('#selectBoxDisease').append('<option value="'+result[i].diseaseNo+'">'+result[i].diseaseName+'</option>');
						}		
					}
					,error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})

			$(document).on('click','.btnRequest', function() {
				$('#form').submit();
			})
		})
	</script>
</head>
<body>
	<h1>의사 피드백 요청</h1>
	<table id="tableDoctorList" class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>소속병원명</th>
				<th>진료과</th>
				<th>총피드백수</th>
				<th>피드백동의수</th>
				<th>평가점수</th>
				<th>선택</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	<form id="form" action="${pageContext.request.contextPath}/doctorFeedbackRequest" method="POST">
		<input type="hidden" name="memberNo" value="${memberSessionNo}">
		<div id="div">
			<div>
				질병명 : <select id="selectBoxDisease" name="diseaseNo"></select>
			</div>
			<div>
				제목 : <input type="text" name="doctorFeedbackRequestTitle">
			</div>
			<div>
				내용 :<br>
				<textarea name="doctorFeedbackRequestContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
			</div>
			<button type="button" class="btnRequest">피드백요청하기</button>
		</div>

	</form>
</body>
</html>