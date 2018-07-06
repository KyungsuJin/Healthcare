<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<title>Insert title here</title>
	<script>
		$(document).ready(function() {
			$('#divAddTable').hide();
			$('#divTable').hide();
			$('#btnSearch').click(function() {
				if( $('#sv').val() == "" ||  $('#sv').val() == " " || $('#sv').val().length < 2) {
					console.log(sv);
					alert("검색어가 잘못되었습니다. 2자이상 입력하세요")
				}else{
					$('#divTable').show();
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
														'<td class="td">'+result[i].foodBuildYear+'</td>'+	
														'<td><input type="button" class="btnAdd" value="추가"></td>'+
														'<td><input type="hidden" name="foodNo" value="'+result[i].foodNo+'"></td></tr>');
							}
						}
						,error : function(request,status,error){
							 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				}		
			})			
			$(document).on('click','.btnAdd', function() {
				$('#divAddTable').show();
				var addFood = $(this).closest("tr").clone();
				var addSelectBox = '<td><select id="ingestWeight" class="form-controll" name="ingestWeight">'+
									'<option value="1">100g</option>'+
									'<option value="2">200g</option>'+
									'<option value="3">300g</option>'+
									'<option value="4">400g</option>'+
									'<option value="5">500g</option>'+
									'</select></td>'				
				$('#tbodyMain').append(addFood);
				$(addFood).find('.btnAdd').parent().remove();
				$(addFood).children('.td').after(addSelectBox);
			})
			$('#btnAdd').click(function() {
				$('#divTable').remove();
				$('#form').submit();
			})
		})
	</script>
	<style>
		#div{max-width: 500px; border: solid red; }
	</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" data-background-color="purple">
								<h4 class="title">섭취 칼로리 등록</h4>
							</div>
							<div class="card-content">
								<form id="form" action="${pageContext.request.contextPath}/addIngestCalorie" method="POST">
									<input type="hidden" name="memberNo" value="${memberSessionNo}">
									<div class="row">										
										<div class="form-controll" id="divTable">
											<table class="table">
												<thead>
													<tr>
														<th>이름</th>
														<th>1회제공량</th>
														<th>칼로리</th>
														<th>등록일</th>	
														<th>비고</th>				
													</tr>
												</thead>
												<tbody id="tbody">
													<tr>					
													</tr>
												</tbody>	
											</table>
										</div>
										<div class="form-controll" id="divAddTable">
											<table class="table" id="addTable">
												<thead>
													<tr>
														<th>이름</th>
														<th>1회제공량</th>
														<th>칼로리</th>
														<th>등록일</th>	
														<th>비고</th>				
													</tr>
												</thead>
												<tbody id="tbodyMain">
												</tbody>
											</table>
										</div>
									<div class="form-controll">
										<input type="text" class="form-control" name="sv" id="sv" maxlength="5" placeholder="음식이름 입력해주세요">
										<button type="button" class="btn btn-primary" id="btnSearch">검색</button>
									</div>
									<div class="form-controll">
										<button type="button" class="btn btn-primary pull-right" id="btnAdd">섭취칼로리 추가하기</button>
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