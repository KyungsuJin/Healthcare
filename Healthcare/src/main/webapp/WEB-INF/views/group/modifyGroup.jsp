<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyGroup</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var count = 0;
	function checkName(){		
		var groupName = $('#groupName').val();
		var checkCHar = /[!#$%^&*()?+=\/]/;
		if(groupName == "" || groupName == null ||checkCHar.test(groupName)){
			$('#Name').html('공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.');
			groupForm.groupName.focus();
			return false;
		}
       var checkName = $.ajax({
            type : "GET",
            data : {groupName : groupName},
            url : "${pageContext.request.contextPath}/checkGroupName",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data){
            	console.log(data);   
            	if(data.result> 0){
            		$('#Name').html('입력하신 그룹명은 현재 사용중이므로 사용할 수 없습니다. 다시 입력해주세요.');
            		return count = 0;
            	}else if(data.result == 0){
            		$('#Name').html('사용가능한 그룹명입니다.');
            		return count = 1;
            	}
            }
        });       
       checkName.fail(function(jqXHR, textStatus){
    	   alert( "Request failed: " + textStatus );
		});
	}

	function check() {
	if(confirm("그룹정보를 수정하시겠습니까?")){
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
			alert("그룹 정보가 수정 완료 되었습니다.");
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
<h1>modifyGroup</h1>
	<form name="groupForm" id="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyGroup" method="post">
		<input type="hidden" name="groupNo" value="${groupTable.groupNo }">
		<div>
			현재 그룹 종류는 ${groupTable.groupKindName}입니다. 변경하실 그룹 종류를 선택해주세요.
			<select name="groupKindNo">
			  <option value="group_kind_1" selected="selected">가족</option>
			  <option value="group_kind_2">회사</option>
			  <option value="group_kind_3">친구</option>
			</select>
		</div>
		<div>
			회원아이디 : 
			<input type="text" value="${groupTable.memberNo }" readonly>

		</div>
		<div>
			그룹명 :
				<input type="text" id="groupName" name="groupName" value="${groupTable.groupName }" required class="groupName" maxlength="10" onchange="checkName()">&nbsp;<span id="Name"></span>
		</div>
		<div>
			그룹 소개:
			<textarea name="groupInfo" style="resize: none;" cols="40" rows="8" name="groupInfo" placeholder="현재 소개글 내용은 ${groupTable.groupInfo }입니다. **수정하실 내용을 적어주세요**"></textarea>
		</div>
		<input type="submit" value="수정하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="수정취소">
</body>
</html>