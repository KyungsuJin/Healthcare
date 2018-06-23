<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#RegistrationBtn").click(function(){
				$.ajax({
					type : "POST"
					,data: {"memberNo": $("#memberNo").val()}
					,url : "${pageContext.request.contextPath}/exerciseDepositRegistration1"
					,dataType : "json"
					,success:function(data){
						if(data.result==1){
							alert('보증금 등록 완료!');
							window.close();
							
						}else{
							alert('보증금등록에 실패했습니다 포인트 충전을 해주세요');
							
						}
					}
				});
			});
		});
	</script>
</head>
<body>
	 <div class="card">
		 <div class="card-header" data-background-color="purple">
		 	<h4 class="title">보증금 등록하기</h4>
		 </div>
		 <div class="card-content">
		 	<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
		 	<div class="row">
		 		<div class="col-xs-4">
		 		</div>
		 		<div class="col-xs-4">
		 			<div class="form-group">
		 				<label class="control-label">보증금 가격 1000원</label>
					</div>
				</div>
			</div>
			<button id="RegistrationBtn"  class="btn btn-primary pull-right">등록하기</button>
			
		</div>
	</div>
</body>
</html>