<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addGroup</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
function checkName(){
			groupName = $("#groupName").val();
			if(groupName == "" || groupName == null){
				$('#Name').html('공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.');
				groupForm.groupName.focus();
			}
	        $.ajax({
	            type: 'GET',
	            url: '${pageContext.request.contextPath}/checkGroupName',
	            data: groupName,
	            success: function(data){
	                if(data.cnt == 0){
	                    $('#Name').html('사용가능');
	                }
	                else{
	                    $('#Name').html('사용불가');
	                }
	            }
	        });  
		}

	function check(){
		if(groupForm.groupName.value == "") {
			alert("그룹명을 입력해주세요.");
			groupForm.groupName.focus();
			return false;
    	  }
		if(groupForm.groupInfo.value != 1){
			alert("그룹 소개글을 해주세요.");
			groupForm.groupInfo.focus();
			return false;
		}else{
			alert("그룹 생성이 완료 되었습니다.");
			return true;
		}
	}
    function cancleBtn() {
        location.href="${pageContext.request.contextPath}/groupMain";
    }   

</script>

</head>
<body>
<h1>addBloodPressure</h1>
	<form name="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addGroup" method="post">
		<div>
			그룹 종류를 선택해주세요.
			<select name="groupKindNo">
			  <option value="group_kind_1" selected="selected">가족</option>
			  <option value="group_kind_2">회사</option>
			  <option value="group_kind_3">친구</option>
			</select>
		</div>
		<div>
			회원아이디 : 
			<input type="text" name="memberNo">
		</div>
		<div>
			그룹명 :
				<input type="text" id="groupName" name="groupName" maxlength="10" onchange="checkName()">&nbsp;<span id="Name"></span>
		</div>
		<div>
			그룹 소개:
			<textarea name="groupInfo" style="resize: none;" cols="40" rows="8" placeholder="그룹 소개글을 입력해주세요"></textarea>
		</div>
		<input type="submit" value="등록하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="등록취소">
</body>
</html>