<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
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
		
		$(".removeFile").click(function(){
			var deleteFile = "<input type='hidden' name='treatmentDeleteList' value='"+$(this).prev().attr("value")+"'>";
			$("#submitFile").before(deleteFile);
			$(this).closest("div").remove();
		});
		
		$("#treatmentBtn").click(function(){
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
			$(location).attr('href', "${pageContext.request.contextPath}/getTreatmentContent?treatmentNo=${treatmentResponse.treatmentNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#hospitalAddress").click(function(){
			window.name = "parentForm";
			window.open("${pageContext.request.contextPath}/getPopMedicalList"
					,"medicalForm", "width=600, height=430, resizable=no, scrollbars=no");
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
					<form id="treatmentForm" name="treatmentForm" action="${pageContext.request.contextPath}/modifyTreatment" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<input type="hidden" name="treatmentNo" value="${treatmentResponse.treatmentNo}">
								<input type="hidden" name="currentPage" value="${currentPage}">
								<input type="hidden" name="pagePerRow" value="${pagePerRow}">			
								
								<div class="col-md-4">병원 명 : <input id="hospitalName" class="form-control" type="text" name="hospitalName" value="${treatmentResponse.hospitalName}"></div>
								<div class="col-md-4">진료 과 : <input id="treatmentDepartment" class="form-control" type="text" name="treatmentDepartment" value="${treatmentResponse.treatmentDepartment}"></div>
								<div class="col-md-4">의사 명 : <input id="doctorName" class="form-control" type="text" name="doctorName" value="${treatmentResponse.doctorName}"></div>
								<div>병원 주소 : <input id="hospitalAddress" class="form-control" type="text" name="hospitalAddress" value="${treatmentResponse.hospitalAddress}"></div>
								
								<div>진료 제목 : <input id="treatmentTitle" class="form-control" type="text" name="treatmentTitle" value="${treatmentResponse.treatmentTitle}"></div>
								<div>진료 내용 : <textarea id="treatmentContent" class="form-control" name="treatmentContent">${treatmentResponse.treatmentContent}</textarea></div>
								
								
								
								<div><input id="fileChoose"class="btn btn-default fileChooseList" type="file" name="multipartFile"></div>
								<input type="hidden" id="fileLine">
								<c:forEach var = "treatmentFile" items = "${treatmentResponse.treatmentFile}">
									<div>
										<a href="#" value="${treatmentFile.treatmentFileNo}">${treatmentFile.treatmentFileRealName}</a>
										<input class="btn btn-default removeFile" type="button" value="삭제">
									</div>
								</c:forEach>
								<div id="submitFile">
									<button id="treatmentBtn" class="btn btn-default" type="button">저장</button>
									<input id="cancelBtn" class="btn btn-default" type="button" value="취소">
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