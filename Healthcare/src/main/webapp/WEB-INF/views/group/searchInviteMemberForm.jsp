<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchMemberForm</title>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		$('#inviteBtn').hide();
	});
	function checkId() {
		var memberId = $('#memberId').val();	
		var checkMemberId = $.ajax({
			type : "POST",
			data : {memberId : memberId},
			url : "${pageContext.request.contextPath}/invitefind",
			dataType : "json",
			contentType: "application/json; charset=UTF-8"
		});
		checkMemberId.done(function(data){
			console.log(data);   
			if(data> 0){
				$('#result').html(memberId+'으로 한명의 회원을 찾았습니다. 초대하시겠습니까?');
				$('#inviteBtn').show();
			}else if(data == 0){
				$('#result').html(memberId+'라는 아이디로 회원을 찾지못했습니다.');
				$('#inviteBtn').hide();
			}
		}); 
		checkMemberId.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
</script>
</head>
<body>
	<!-- 회원초대 -->
	<div id="searchId">
		찾고자하는 회원의 아이디를 입력해주세요.
		<input type="text" id="memberId" name="memberId" onchange="checkId()">
	</div>
	<span id="result"></span>
	<div id="inviteBtn">
		<input type="button" id="invite" value="초대하기">
	</div>
</body>
</html>