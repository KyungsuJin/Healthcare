<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	input{ text-align:center; }
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
		$("#hospitalAddress").click(function(){
			window.name = "parentForm";
			window.open("${pageContext.request.contextPath}/getPopMedicalList"
					,"medicalForm", "width=750, height=700, resizable=no, scrollbars=no");
		});
		
		
		
	});
		
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="containerTreatment" align="center">
					<form id="treatmentForm" name="treatmentForm" action="${pageContext.request.contextPath}/addTreatment" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<div class="card">
                           			<div class="card-header" data-background-color="purple"><h4 class="title">진료기록 등록</h4></div>
									<input type="hidden" name="memberNo" value="${memberNo}">
									<div class="col-md-4">병원 명 : <input id="hospitalName" class="form-control" type="text" name="hospitalName" value="${treatment.hospitalName}"></div>
									<div class="col-md-4">진료 과 : <input id="treatmentDepartment" class="form-control" type="text" name="treatmentDepartment" value="${treatment.treatmentDepartment}"></div>
									<div class="col-md-4">의사 명 : <input id="doctorName" class="form-control" type="text" name="doctorName" value="${treatment.doctorName}"></div>
									<div>병원 주소 : <input id="hospitalAddress" class="form-control" type="text" name="hospitalAddress" value="${treatment.hospitalAddress}"></div>
									
									<div>진료 제목 : <input id="treatmentTitle" class="form-control" type="text" name="treatmentTitle" value="${treatment.treatmentTitle}"></div>
									<div>진료 내용 : <textarea id="treatmentContent" class="form-control" name="treatmentContent">${treatment.treatmentContent}</textarea></div>
									
									<div><input id="fileChoose" class="fileChooseList" type="file" name="multipartFile"></div>
									<input type="hidden" id="fileLine">
									<div id="submitFile">
										<button id="treatmentBtn" class="btn btn-default" type="button">저장</button>
										<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>