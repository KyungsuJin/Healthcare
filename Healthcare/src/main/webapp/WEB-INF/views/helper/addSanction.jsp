<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			$.ajax({
				type : "POST"
				,url : "${pageContext.request.contextPath}/getSanctionKindList"
				,dataType : "json"
				,success : function(result) {
					alert('성공')
					console.log(result);
					for(var i=0; i<result.length; i++){
						$('#sanctionKindNo').append('<option value="'+result[i].sanctionKindNo+'">'+result[i].sanctionKind+'</option>');
					}
				}
				,error : function(request,status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			$('#btnIdSearch').click(function() {
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/getIdSearch"
					,data : {"id":$('#idSearch').val()}
					,dataType : "json"
					,success : function(result) {
						if(result.memberNo != null){
							alert('아이디가 확인되었습니다.')
							$('#formSanction').append('<input type="hidden" name="sanctionMemberNo" value="'+result.memberNo+'">');
							$('#memberId').val(result.memberId);
						}else {
							alert('아이디를 다시확인 해 주세요')
						}
					}
					,error : function(request,status,error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})
 			$(document).on('change','#sanctionKindNo', function() {
				console.log($(this).val());
				if($(this).val() == "sanction_kind_5"){
					console.log("시발");
					$('.div').append(' 회수금액 : <input type="text" name="sanctionPoint">');
				}
			})
			$(document).on('click','#btnSubmit', function() {
				$('#formSanction').submit();
			})
		})
	</script>
</head>
<body>
	addSanction.jsp
	<div>
		아이디검색 : <input type="text" id="idSearch">
		<button type="button" id="btnIdSearch">아이디찾기</button>
	</div>
	<div>
		<form id="formSanction" action="${pageContext.request.contextPath}/addSanction" method="POST">
			<div>
				제재대상 아이디 : <input type="text" id="memberId" name="memberId">
			</div>
			<div class="div">
				제재 종류 : <select id="sanctionKindNo" name="sanctionKindNo"></select>
			</div>
			<div>
				제재 제목 : <input type="text" name="sanctionTitle">
			</div>
			<div>
				제재 사유 <br>
				<textarea name="sanctionContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
			</div>
			<button type="button" id="btnSubmit">제재하기</button>	
		</form>	
	</div>
</body>
</html>