<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addGroup</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#inviteBtn').hide();
		$('#groupInviteMessage').hide();
	});	
	function checkmemberId(){		
		var memberId = $('#memberId').val();
		var checkCHar = /[!#$%^&*()?+=\/]/;
		if(memberId == "" || memberId == null ||checkCHar.test(memberId)){
			$('#result').html('공백 또는 특수문자가 포함된 아이디는 검색할 수 없습니다.');
			inviteForm.memberId.focus();
			return false;
		}
       var checkIdAjax = $.ajax({
            type : "GET",
            data : {memberId : memberId},
            url : "${pageContext.request.contextPath}/invitefind",
            dataType : "json",
            contentType: "application/json; charset=UTF-8"
        });    
       
       checkIdAjax.done(function(data){
    	   console.log(data);   
       	if(data.result> 0){
       		$('#result').html('한명의 회원을 찾았습니다.');
       		$('#resultInfomation').html('아이디 :'+memberId+'성함:'+data.name);
       		$('#inviteBtn').show();
       		$('#groupInviteMessage').show();
		
       	}else if(data.result == 0){
       		$('#result').html('회원을 찾지못했습니다. 다시 입력해주세요.');
			$('#inviteBtn').hide();
			$('#groupInviteMessage').hide();
       	}
       }); 
       
       checkIdAjax.fail(function(jqXHR, textStatus){
    	   alert( "Request failed: " + textStatus );
		});
	}
	function check() {
	if(confirm("회원을 초대 하시겠습니까?")){
		if(inviteForm.memberId.value == "") {
			alert("초대하실 회원아이디를 검색 해주세요.");
			inviteForm.memberId.focus();
			return false;
		  }
		if(inviteForm.groupInviteMessage.value == "") {
			alert("초대 메세지를 작성해주세요.");
			inviteForm.groupInviteMessage.focus();
			return false;
		  }else{
			alert("회원 초대 완료 되었습니다.");
			return true;
		}
	}
}

function cancleBtn() {
    location.href="${pageContext.request.contextPath}/groupList";
}   
</script>
</head>
<body>
<h1>InviteMemberForm</h1>
	<form name="inviteForm" id="inviteForm" onsubmit="return check()" action="${pageContext.request.contextPath}/inviteMember" method="post">
		<input type="hidden" name="groupNo" value="${groupTable.groupNo }">
		그룹명 : ${groupTable.groupName } 그룹 종류 : ${groupTable.groupKindName}
		<div>
			초대하고자 하는  회원의 아이디를 검색해주세요.
			<input type="text" id="memberId" name="memberId" >
			<input type="button" value="아이디검색하기" onclick="checkmemberId()">
			<span id="result"></span><br>
			<span id="resultInfomation"></span><br>
		</div>
		<input type="text" id="groupInviteMessage" name="groupInviteMessage" placeholder="초대메세지를 작성해주세요.">
		<input type="submit" id="inviteBtn" value="초대하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="돌아기기">
</body>
</html>