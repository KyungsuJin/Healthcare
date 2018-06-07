<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Insert title here</title>
	<script>
		$(document).ready(function() {
			$.ajax({
				type : 'POST'
				,url : "${pageContext.request.contextPath}/selectBoxDisease"
				,data : {"diseaseNo": $('.selectBoxDisease').val()}
				,dataType : "json"
				,success : function(result) {
					alert('성공');
					for (var i = 0; i < result.length; i++) {
						console.log("1111"+result[i].diseaseSubCategoryNo);
						$('#selectBoxDiseaseSubCategory').append('<option value="' + result[i].diseaseSubCategoryNo + '">' + result[i].diseaseSubCategoryName + '</option>');
					}
				}
				,error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			$('.btnSubmit').click(function() {
				
			})
		})
	</script>
	<style>
		select {
		    width: 200px; height: 30px; padding-left: 10px; font-size: 18px; color: #006fff;  border: 1px solid #006fff; border-radius: 3px;}
	</style>
</head>
<body>
	<h1>나의질병등록</h1>
	<div>
		<form id="form" action="${pageContext.request.contextPath}/addMyDisease" method="POST">
			<input type="hidden" name="memberNo" value="member_1">
			<div>
				질병선택
				<select name="diseaseNo" class="selectBoxDisease">
					<c:forEach var="disease" items="${list}">
						 <option value="${disease.diseaseNo}">${disease.diseaseName}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				상세질병선택
				<select id="selectBoxDiseaseSubCategory" name="diseaseSubCategoryNo">
				</select>
			</div>
			<div>
				<button type="submit" class="btnSubmit">나의질병등록하기</button>
			</div>
		</form>
	</div>
</body>
</html>