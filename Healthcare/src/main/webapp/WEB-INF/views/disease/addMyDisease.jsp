<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$('#selectBoxDisease').change(function() {
				$('#selectBoxDiseaseSubCategory').empty();
				$.ajax({
					type : 'POST'
					,url : "${pageContext.request.contextPath}/selectBoxDisease"
					,data : {"diseaseNo": $('#selectBoxDisease').val()}
					,dataType : "json"
					,success : function(result) {
						alert('성공');
						for (var i = 0; i < result.length; i++) {
							$('#selectBoxDiseaseSubCategory').append('<option value="' + result[i].diseaseSubCategoryNo + '">' + result[i].diseaseSubCategoryName + '</option>');
						}
					}
					,error:function(request,status,error){
						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})	
			$('.btnSubmit').click(function() {	
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
								<h4 class="title">나의질병등록</h4>
							</div>
							<div class="card-content">
							<form id="form" action="${pageContext.request.contextPath}/addMyDisease" method="POST">
								<input type="hidden" name="memberNo" value="${memberSessionNo}">
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group">
											<label class="control-label">질병 선택</label>
											<select name="diseaseNo" id="selectBoxDisease" class="form-control">
												<c:forEach var="disease" items="${list}">
													 <option value="${disease.diseaseNo}">${disease.diseaseName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<div>
												상세질병선택
												<select id="selectBoxDiseaseSubCategory" name="diseaseSubCategoryNo">
												</select>
											</div>
										</div>
										<button type="submit" id="btnSubmit" class="btn btn-primary pull-right">나의질병등록하기</button>
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