<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Insert title here</title>
	<style>
		.div {margin-bottom: 5px;}
	</style>
	<script>
		$(document).ready(function() {
			var name = "";
			var nameCheck;
			$('#btnConfirm').click(function() {
				nameCheck = $(".diseaseSCNameChecked").val();
				if(nameCheck == "" || nameCheck == " "){
					alert("질병명이 잘못되었습니다.");
				}else {
					$.ajax({
						type : 'POST'
						,url : "${pageContext.request.contextPath}/diseaseSCNameChecked"
						,data : {"sendNameChecked": $('.diseaseSCNameChecked').val()}
						,dataType : "json"
						,success:function(result) {
							flag = result;
							if(result == 0) {
								$('.diseaseSCName').val($('.diseaseSCNameChecked').val())
								name = $(".diseaseSCName").val();
							}else {
								alert('이미등록된 질병이름 입니다. 확힌해주세요');
							}
						}
					})	
				}
			})
			$('.btnAdd').click(function() {
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
	<h1>DiseaseDetail</h1>
	<div>
		<form id="diseaseSubCategoryForm" action="${pageContext.request.contextPath}/addDiseaseSubCategory" method="POST">
			<input type="hidden" name="diseaseNo" value="${diseaseNo}">
			<div class="div">
				소분류질병명체크 : <input type="text" name="diseaseSCNameChecked" class="diseaseSCNameChecked">
				<button type="button" id="btnConfirm">소분류질병명체크</button>
			</div>
			<div class="div">
				소분류질병명 : <input type="text" name="diseaseSubCategoryName" class="diseaseSCName" readonly>
			</div>			
			<div class="div">
				<input type="radio" name="familyHistory" value="T" checked="checked"> 가족력질병
				<input type="radio" name="familyHistory" value="F"> 일반질병
			</div>	
			<div class="div">
				<button type="button" class="btnAdd">상세질병등록하기</button>
			</div>			
		</form>
	</div>
</body>
</html>