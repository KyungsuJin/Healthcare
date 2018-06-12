<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addGroup</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
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
       		$('#result').html(memberId+'으로 한명의 회원을 찾았습니다. 초대하시겠습니까?');
			$('#inviteBtn').show();
       	}else if(data.result == 0){
       		$('#result').html(memberId+'라는 아이디로 회원을 찾지못했습니다.');
			$('#inviteBtn').hide();
       	}
       }); 
       
       checkIdAjax.fail(function(jqXHR, textStatus){
    	   alert( "Request failed: " + textStatus );
		});
	}

	function check() {
	if(confirm("그룹을 생성하시겠습니까?")){
		if(groupForm.groupName.value == "") {
			alert("그룹명을 입력해주세요.");
			groupForm.groupName.focus();
			return false;
		  }
		if(groupForm.groupInfo.value == ""){
			alert("그룹 소개글을 해주세요.");
			groupForm.groupInfo.focus();
			return false;
		}else{
			alert("그룹 생성이 완료 되었습니다.");
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
		<input type="hidden" name="groupNo" value="#{groupTable.groupNo}">
		<div>
		초대하고자 하는  회원의 아이디를 입력해주세요.
		<input type="text" id="memberId" name="memberId" onchange="checkmemberId()"><span id="result"></span>
		</div>
		<input type="submit" value="초대하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="등록취소">
</body>
</html>