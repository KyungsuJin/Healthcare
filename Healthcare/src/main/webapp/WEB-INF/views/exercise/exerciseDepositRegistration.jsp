<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<h1>보증금 등록하기</h1>
	보증금 가격 1000원
		<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
		${sessionScope.memberSessionNo}
		<button id="RegistrationBtn">등록하기</button>

</body>
</html>