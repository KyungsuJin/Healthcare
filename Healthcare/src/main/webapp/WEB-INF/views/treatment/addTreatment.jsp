<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#containerTreatment{ width: 1000px; margin: auto; }
	.fileChooseList { display: inline-block !important; }
	#treatmentContent { height: 300px; }
</style>
<script>
	var removeFile = function(e){
		e.closest("div").remove();
	}
	
	$(document).ready(function(){
		$("#fileChoose").change(function(e){
			var plusFile = $("#fileChoose").closest("div").clone();
			var deleteFile = "<input id='removeBtn' class='btn btn-default' type='button' value='삭제' onclick='removeFile(this)'>";
			$("#fileChoose").val("");
			$("#submitFile").before(plusFile);
			$('[class=fileChooseList]:last').after(deleteFile);
		});
		
		$("#treatmentBtn").click(function(){
			$("p").hide();
			if($('#treatmentTitle').val().length < 1) {
                alert('title을 입력하세요');
            } else if($('#treatmentContent').val().length < 1) {
                alert('content을 입력하세요');
            } else{
            	 var flag = true;
                 $('.fileChooseList').each(function(index, item){
                	 if($(this).val().length <1) {
                         return true;
                     }
                	 var file = this.files[0];
                     if(file.type == "application/x-msdownload"){
                    	 $("#fileLine").before("<p>경고! exe파일(" + file.name + "입니다.</p><br>");
                    	 flag = false;
                     }
                 });
                 
                 if(flag){
                	 $('.fileChooseList').each(function(index, item){
                    	 if($(this).val().length <1) {
                             $(this).remove();
                         }
                     });
                	 $("#treatmentForm").submit();
                 }
            }
		});
		$("#cancelBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getTreatmentList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
	});
		
</script>
</head>
<body>
	<jsp:include page="../include/body.jsp"></jsp:include>
	<div id="containerTreatment" align="center">
		<h1>addTreatment</h1>
		<form id="treatmentForm" action="${pageContext.request.contextPath}/addTreatment" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberNo" value="${memberNo}">
			
			<div>treatmentDepartment : <input id="treatmentDepartment" class="form-control" type="text" name="treatmentDepartment" value="${treatment.treatmentDepartment}"></div>
			<div>hospitalName : <input id="hospitalName" class="form-control" type="text" name="hospitalName" value="${treatment.hospitalName}"></div>
			<div>doctorName : <input id="doctorName" class="form-control" type="text" name="doctorName" value="${treatment.doctorName}"></div>
			<div>hospitalAddress : <input id="hospitalAddress" class="form-control" type="text" name="hospitalAddress" value="${treatment.hospitalAddress}"></div>
			
			<div>treatmentTitle : <input id="treatmentTitle" class="form-control" type="text" name="treatmentTitle" value="${treatment.treatmentTitle}"></div>
			<div>treatmentContent : <textarea id="treatmentContent" class="form-control" name="treatmentContent" value="${treatment.treatmentContent}"></textarea></div>
			
			<div><input id="fileChoose" class="fileChooseList" type="file" name="multipartFile"></div>
			<input type="hidden" id="fileLine">
			<div id="submitFile">
				<button id="treatmentBtn" class="btn btn-default" type="button">저장</button>
				<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
			</div>
		</form>
	</div>
</body>
</html>