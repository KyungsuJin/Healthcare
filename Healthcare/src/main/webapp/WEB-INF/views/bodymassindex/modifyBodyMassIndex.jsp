<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			var number = /^[0-9]*$/;
			$("#bodyWaistSizeCm").focusout(function(){
				$("#bodyWaistSizeIn").val(($(this).val()/2.54).toFixed(0));
			});
			$("#bodyWeight").focusout(function(){
				var heightBmi=$("#bodyHeight").val()/100;
				var bmi=$("#bodyWeight").val()/(heightBmi*heightBmi);
				$("#bodyMassIndex").val(bmi.toFixed(1));
			})
			$("#addBodyMassIndexSubmit").click(function(){
				if((!number.test($("#bodyHeight").val())) || $("#bodyHeight").val()==null){
					alert('키는 필수값이며 숫자만 입력 가능합니다.');
					$("#bodyHeight").focus();
					
				}else if(!number.test($("#bodyWeight").val()) || $("#bodyWeight").val()==null){
					alert('몸무게는 필수값이며 숫자만 입력 가능합니다.');
					$("#bodyWeight").focus();
				}else if(!number.test($("#bodyWaistSizeCm").val()) || $("#bodyWaistSizeCm").val()==null){
					alert('허리둘레는 필수값이며 숫자만 입력가능합니다.');
					$("#bodyWaistSizeCm").focus();
				}else{
					$("#addBoayMassIndexForm").submit();
					alert('체질량이 등록완료되었습니다.');
				}
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
				<div class="row">
					<div class="col-md-2">
					</div>
                     <div class="col-md-8">
                         <div class="card">
                         	<div class="card-header" data-background-color="purple">
								<h4 class="title">체질량 수정</h4>
							</div>
							<div class="card-content">
								<form id="addBoayMassIndexForm"action="${pageContext.request.contextPath}/modifyBmi" method="post">
									<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
									<input type="hidden" name="bodyMassIndexNo" value="${bodyMassIndex.bodyMassIndexNo}">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">키</label>
												<input class="form-control" type="text" id="bodyHeight" name="bodyHeight" value=" ${bodyMassIndex.bodyHeight} "maxlength="5">
											</div>
											<div class="form-group">
												<label class="control-label">체중</label>
												<input class="form-control" type="text" id="bodyWeight" name="bodyWeight" value="${bodyMassIndex.bodyWeight}" maxlength="5">
											</div>
											<div class="form-group">
												<label class="control-label">허리둘레 cm</label>
												<input class="form-control" type="text" id="bodyWaistSizeCm" maxlength="5">
												<label class="control-label">Inch</label>
												<input class="form-control" type="text" id="bodyWaistSizeIn" value=" ${bodyMassIndex.bodyWaistSize}" name="bodyWaistSize" maxlength="5" readonly>
											</div>
											<div class="form-group">
												<label class="control-label">BMI</label>
												<input class="form-control" type="text" id="bodyMassIndex" name="bodyMassIndex" value=" ${bodyMassIndex.bodyMassIndex}" readonly>
											</div>
											<button type="button" id="addBodyMassIndexSubmit" class="btn btn-primary pull-right">수정</button>
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