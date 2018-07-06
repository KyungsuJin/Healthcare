<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$('#divAddTable').hide();
			$('#divTable').hide();
			$('#btnSearch').click(function() {
				if( $('#sv').val() == "" ||  $('#sv').val() == " " || $('#sv').val().length < 2) {
					console.log(sv);
					alert("검색어가 잘못되었습니다. 2자이상 입력하세요");
				}else{		
					$('#divTable').show();
					$.ajax({
						type : "POST"
						,url : "${pageContext.request.contextPath}/exerciseSearch"
						,data : {"sv": $('#sv').val()}
						,dateType : "json"
						,success : function(result) {
							alert('성공')
							$('#tbody').empty();
							for(var i=0; i<result.length; i++){
								$('#tbody').append('<tr><td>'+result[i].exerciseName+'</td>'+
														'<td class="td">'+result[i].exerciseCalorie+'</td>'+
														'<td><button type="button" id="btnAdd">추가</button></td>'+
														'<td><input type="hidden" name="exerciseNo" value="'+result[i].exerciseNo+'"></td></tr>');
							}
						}
						,error : function(request,status,error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				}
			})
			$(document).on('click','#btnAdd', function() {
				$('#divAddTable').show();
				var addExercise = $(this).closest("tr").clone();
				var addSelectBox = '<td><select id="consumeTime" class="form-control" name="consumeTime">'+
									'<option value="1">1시간</option>'+
									'<option value="2">2시간</option>'+
									'<option value="3">3시간</option>'+
									'<option value="4">4시간</option>'+
									'<option value="5">5시간</option>'+
									'</select></td>'
				$('.tbodyMain').append(addExercise);
				$('#btnAdd').parent().remove();
				$(addExercise).children('.td').after(addSelectBox);
				
			})
			$('#btnAdd').click(function() {
				/* divTable 삭제하는 이유는 form안에 있기때문에 consumeNo가 2개가 넘어간다 */
				$('#divTable').remove();
				$('#form').submit();
			})	
		})
	</script>
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
								<h4 class="title">소모 칼로리 등록</h4>
							</div>
							<div class="card-content">
								<form id="form" action="${pageContext.request.contextPath}/addConsumeCalorie" method="POST">
									<input type="hidden" name="memberNo" value="${memberSessionNo}">									
									<div class="form-group" id="divAddTable">
										<table class="table table-hover" id="addTable">
											<thead>
												<tr>
													<th>이름</th>
													<th>소모칼로리</th>	
													<th>비고</th>				
												</tr>
											</thead>
											<tbody class="tbodyMain">
											</tbody>
										</table>
									</div>
									<div class="form-group" id="divTable">
										<table id="table" class="table table-hover">
											<thead>
												<tr>
													<th>이름</th>
													<th>소모칼로리</th>	
													<th>비고</th>				
												</tr>
											</thead>
											<tbody id="tbody">
												<tr>					
												</tr>
											</tbody>	
										</table>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" name="sv" id="sv" placeholder="운동명입력">
										<button type="button" id="btnSearch" class="btn btn-primary">검색</button>
									</div>
									<div class="form-group">
										<button type="button" id="btnAdd" class="btn btn-primary pull-right">소모칼로리 추가하기</button>
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