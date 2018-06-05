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
			$.post({
				url: "/diseaseSCNameChecked"
				,data: {sendNameChecked: $('.diseaseSCNameChecked').val()},
				succecc:function(result) {
					if(result == 'true') {
						
					}
				}
			})
		})
	</script>
</head>
<body>
	<h1>DiseaseDetail</h1>
	<div>
		<form action="${pageContext.request.contextPath}/addDiseaseSubCategory" method="POST">
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
				<button type="submit">상세질병등록하기</button>
				<button type="button" class="btnCancel">취소하기</button>
			</div>			
		</form>
	</div>
</body>
</html>