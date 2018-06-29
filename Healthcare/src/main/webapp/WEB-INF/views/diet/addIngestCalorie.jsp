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
			$('#btnSearch').click(function() {
				if( $('#sv').val() == "" ||  $('#sv').val() == " " || $('#sv').val().length < 2) {
					console.log(sv);
					alert("검색어가 잘못되었습니다. 2자이상 입력하세요")
				}else{
					$.ajax({
						type : 'POST'
						,url : "${pageContext.request.contextPath}/foodSerach"
						,data : {"sv" : $('#sv').val()}
						,dataType : "json"
						,success : function(result) {
							alert('성공')
							$('#tbody').empty();
							for (var i = 0; i < result.length; i++) {
								$('#tbody').append('<tr><td>'+result[i].foodName+'</td>'+
														'<td>'+result[i].foodOnce+'</td>'+
														'<td>'+result[i].foodKcal+'</td>'+
														'<td>'+result[i].foodCarbohydrate+'</td>'+
														'<td>'+result[i].foodProtein+'</td>'+
														'<td>'+result[i].foodFat+'</td>'+
														'<td>'+result[i].foodSugar+'</td>'+
														'<td>'+result[i].foodNatrium+'</td>'+
														'<td>'+result[i].foodCholesterol+'</td>'+
														'<td>'+result[i].foodSfa+'</td>'+
														'<td>'+result[i].foodTransfat+'</td>'+
														'<td class="td">'+result[i].foodBuildYear+'</td>'+	
														'<td><input type="hidden" name="foodNo" value="'+result[i].foodNo+'"></td>'+
														'<td><input type="button" id="btnAdd" value="추가"></td></tr>');
							}
						}
						,error : function(request,status,error){
							 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				}		
			})
			
			$(document).on('click','#btnAdd', function() {
				var addFood = $(this).closest("tr").clone();
				var addSelectBox = '<td><select id="ingestWeight" name="ingestWeight">'+
									'<option value="1">100g</option>'+
									'<option value="2">200g</option>'+
									'<option value="3">300g</option>'+
									'<option value="4">400g</option>'+
									'<option value="5">500g</option>'+
									'</select></td>'
				$('.tbodyMain').append(addFood);
				$('#btnAdd').parent().remove();
				$(addFood).children('.td').after(addSelectBox);
				
			})
			$('#btnAdd').click(function() {
				$('#form').submit();
			})
		})
	</script>
	<style>
		#div{max-width: 500px; border: solid red; }
	</style>
</head>
<body>
	<h1>나의칼로리등록</h1>
	<div>
		<div id="divMain">
			<form id="form" action="${pageContext.request.contextPath}/addIngestCalorie" method="POST">
			<input type="hidden" name="memberNo" value="${memberSessionNo}">
				<table class="table" id="addTable">
					<thead>
						<tr>
							<th>이름</th>
							<th>1회제공량</th>
							<th>칼로리</th>
							<th>탄수화물</th>
							<th>단백질</th>
							<th>지방</th>
							<th>당류</th>
							<th>나트륨</th>
							<th>콜레스테롤</th>
							<th>포화지방산</th>
							<th>트랜스지방</th>
							<th>등록일</th>	
							<th>비고</th>				
						</tr>
					</thead>
					<tbody class="tbodyMain">
					</tbody>
				</table>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>이름</th>
					<th>1회제공량</th>
					<th>칼로리</th>
					<th>탄수화물</th>
					<th>단백질</th>
					<th>지방</th>
					<th>당류</th>
					<th>나트륨</th>
					<th>콜레스테롤</th>
					<th>포화지방산</th>
					<th>트랜스지방</th>
					<th>등록일</th>	
					<th>비고</th>				
				</tr>
			</thead>

			<tbody id="tbody">
				<tr>					
				</tr>
			</tbody>
					
		</table>
		<div style="text-align: center;">
			<input type="text" name="sv" id="sv">
			<button type="button" id="btnSearch">검색</button>
		</div>
		<div style="text-align: center; margin-top: 50px">
			<button type="button" id="btnAdd">섭취칼로리 추가하기</button>
		</div>	
	</div>
</body>
</html>