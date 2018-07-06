<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			var name = "";
			var nameCheck;
			$('#btnConfirm').click(function() {
				nameCheck = $("#diseaseSCNameChecked").val();
				if(nameCheck == "" || nameCheck == " "){
					alert("질병명이 잘못되었습니다.");
				}else {
					$.ajax({
						type : 'POST'
						,url : "${pageContext.request.contextPath}/diseaseSCNameChecked"
						,data : {"sendNameChecked": $('#diseaseSCNameChecked').val()}
						,dataType : "json"
						,success:function(result) {
							flag = result;
							if(result == 0) {
								$('#diseaseSCName').val($('#diseaseSCNameChecked').val())
								name = $("#diseaseSCName").val();
							}else {
								alert('이미등록된 질병이름 입니다. 확힌해주세요');
							}
						}
					})	
				}
			})
			$('#btnAdd').click(function() {
				console.log("name : "+name)
				if(name == ""){
					alert('질병체크를 다시 해주세요');
				}else {
					$('#diseaseSubCategoryForm').submit();
				}	
			})
		});
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" data-background-color="purple">
								<h4 class="title">질병 등록</h4>
							</div>
							<div class="card-content">
								<form id="diseaseSubCategoryForm" action="${pageContext.request.contextPath}/addDiseaseSubCategory" method="POST">
									<input type="hidden" name="diseaseNo" value="${diseaseNo}">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">소분류 질병명 체크</label>
												<input class="form-control" type="text" id="diseaseSCNameChecked" name="diseaseSCNameChecked" maxlength="5">
												<button type="button" id="btnConfirm" class="btn btn-primary">소분류질병명체크</button>
											</div>
											<div class="form-group">
												<label class="control-label">소분류 질병명</label>
												<input class="form-control" type="text" id="diseaseSCName" name="diseaseSubCategoryName" maxlength="5">
											</div>
											<div>
												<input  type="radio" name="familyHistory" value="T" checked="checked"> 가족력질병
												<input  type="radio" name="familyHistory" value="F"> 일반질병
											</div>
											<button type="button" class="btn btn-primary pull-right">취소하기</button>
											<button type="button" id="btnAdd" class="btn btn-primary pull-right">상세질병등록하기</button>
										</div>
									</div>		
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>